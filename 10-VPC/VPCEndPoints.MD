# Brief document on  VPC Endpoint in AWS

- It allows you to connect to the supported services without configuring an Internet
  gateway, NAT gateway, VPN or Direct Connect.
- They are powered by AWS PrivateLink.
They scale horizontally and are redundant.

## Interface Endpoints
- These are essentially ENIs placed in subnets that act as a target for any traffic
  that has been sent to supported service and operates with the use of PrivateLink.
- PrivateLink allows a secure and private connection between VPCs, AWS services and
  on-premise applications via the AWS internal network.
- When an Interface endpoint has been created for your service, a specific DNS
  hostname has been created and is associated with a private hosted zone in your VPC.
- within this hosted zone, a record set for the default DNS name of the service
  is created resolving to the IP address of your interface endpoint.
- Requests to that service using the default DNS name will be resolved to the
  private IP address of the interface endpoint and will route through the internal
  AWS network instead of the internet.
- VPC Setting: `Enable DNS hostnames` and `Enable DNS Support` must be set to `true`.
- This must be attached to a security group.
- Interface endpoints can be accessed from Direct Connect and Site-to-Site VPN connection.

## Gateway Endpoints
- Gateway VPC endpoints provide reliable connectivity to Amazon S3 and DynamoDB without requiring an internet gateway or a NAT device for your VPC.
- Gateway endpoints dont allow traffic out to the internet. 
- It is used to direct the internal AWS traffic across different AWS services such as S3 and DynamoDB.
- A Gateway endpoint is a target within your route table that allows you to communicate with the supported services. 
- Currently, the list of services supported by gateway endpoints are S3 and DynamoDB.
- During the creation of Gateway endpoint you will be asked which route tables within your VPC should be updated to add the new target of the gateway endpoint.
- Gateway endpoints are free to use, we just need to pay for the data transfer.
- Must update the route tables.
- DNS resolution must be enabled in the VPC.
- Same public hostname for S3 can be used.
- VPC Gateway endpoints cannot be extended outside of VPC. (VPN, DX, TGW, VPC peering).
  - Meaning if we are using VPN/DX/TGW/VPC Peering then it cannot go through your gateway endpoint.
  - Traffic has to remain within your private VPC.

Note:

: Key difference between Gateway endpoint and Interface endpoint is that, former sits at VPC level with a prefix list of IPs route created in a route table, while
    the latter sits at subnet level by associating a private ENI.

### VP Endpoints architecture:

![Endpoints-architecture](https://docs.aws.amazon.com/images/whitepapers/latest/aws-privatelink/images/connectivity.png)

### VPC Endpoint policies:

- Endpoint policies are JSON documents to control access to services.
- Does not override or replace IAM user policies or service-specigic policies (such as S3 bucket policies)
- For exmaple: IAM user can still use other SQS API from outside the VPC endpoint.
  - However, if we want IAM users to restrict any SQS action vic VPC endpoint then we can create SQS queue policy.
  - This way users are enforced to perform any action on the SQS queue only if they come via SQS VPC interface endpoint.

## AWS Private Link:
- Called as VPC Endpoint Services.
- Most secure and reliable way to expose your services to 1000s of VPCs.
- Does not require, IGW, VPC Peering, NAT GW, route tables..
- Requires a Network LB (Service VPC) and an ENI or Gateway LB (Customer VPC)

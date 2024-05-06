# Brief document on AWS Transit Gateway

- Transit Gateway allows you to connect multiple VPCs (transitive peering) to the remote locations either
  using VPN or AWS Direct Connect.
- Regional resource, can work cross region.
- Share cross account using Resource Access Manager.
- You can peer Transit Gateways across region.
- Route Tables: Limit which VPC can talk to other VPC.
- Supports IP Multicast.
- Solution for Edge-to-Edge routing.
- Instances in a VPC can access NAT Gateway, EFS, NLB, PrivateLink in others' VPC attached to `Transit Gateway`
- Use to increase bandwidth to your Sit-to-Site VPN connection using ECMP - Equal Cost Multi-Path routing.
- Share Direct Connect connections with multiple accounts using Transit Gateway.
  - We have a  corporate DC with Direct Connect Endpoint.
  - You have a Transit Gateway with multiple VPCs connected in different AWS accounts.
  - You connect Direct Connect Gateway to Transit Gateway using Transit VIF.
  - This way Direct Connect connection is shared between multiple AWS accounts.

### Use case:
  - You want to scale up an AWS Site-to-Site VPN connection throughput, established between your on-premises data and
    AWS Cloud, beyond a single IPsec tunnel's maximum limit of 1.25 Gbps. What should you do? Use Transit Gateway.

## Transit Gateway network solution

Creating a single internet exit point from multiple VPCs Using AWS Transit Gateway. 

![Transit Gateway](https://d2908q01vomqb2.cloudfront.net/5b384ce32d8cdef02bc3a139d4cac0a22bb029e8/2019/10/04/drawing1-1024x597.png)

[Blog](https://aws.amazon.com/blogs/networking-and-content-delivery/creating-a-single-internet-exit-point-from-multiple-vpcs-using-aws-transit-gateway/) for reference.

### Transit Gateway - Share through RAM:

You can use AWS RAM to share a transit gateway for VPC attachments across AWS accounts or AWS Organizations.

#### Note:

Review this [udemy](https://jpmc.udemy.com/course/aws-solutions-architect-professional/learn/lecture/18387210#overview) lecture
before exam for transit gateway architecture solutions.
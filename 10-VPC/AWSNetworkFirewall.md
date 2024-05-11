# AWS Network Firewall

## Introduction:

- Helps to protect entire Amazon VPC.
- From layer 3 to layer 7 protection.
- Helps to inspect traffic in any direction:
  - From VPC to VPC.
  - Outbound to internet.
  - Internet to inbound.
  - To/From Direct Connect and Site to Site VPN.
- Internally the AWS network firewall uses the gateway load balancer.
- Rules can be centrally managed cross-account by AWS Firewall Manager to apply to many VPCs.

### Fine Grained Control:

- Supports 1000s of rules
  - IP & port - example: 10,000s of IPs filtering
  - Protocol - example: block the SMB protocol for outbound communications
  - Stateful domain list rule groups: only allow outbound traffic to *mycorp.com or third-party software repo
  - General pattern matching using regex
- **Traffic filtering:** Allow, drop, or alert for the traffic that matches the rules
- **Active flow inspection** to protect against network threats with intrusion-prevention capabilities (like Gateway Load Balancer, but all managed by AWS)
- Send logs of rule matches to Amazon S3, CloudWatch Logs, Kinesis Data

## Architecture:

![network firewall](https://d2908q01vomqb2.cloudfront.net/5b384ce32d8cdef02bc3a139d4cac0a22bb029e8/2021/05/28/Screen-Shot-2021-04-02-at-2.30.28-PM.png)

**North-South VPC to internet egress traffic, via NAT Gateway:**
- Traffic from private subnets within a VPC is routed through Transit Gateway and AWS Network Firewall. 
- Then it is routed through a NAT gateway that performs network address translation (NAT) for the traffic that flows out to the internet. 
- This architecture is for outbound connections only, as the NAT gateway cannot accept inbound connections from the internet. 
- For ingress options, please see the blog post Deployment models for AWS Network Firewall.

**North-South VPC to on-premises traffic, via VPN connection or AWS Direct Connect:** 

- Traffic between a VPC and a remotely connected network is routed through AWS Network Firewall. 
- This provides an additional layer of control over traffic flowing between these points.

**East-West VPC to VPC traffic:**
- Traffic between two VPCs is routed through the Transit Gateway. 
- Common use cases include providing an application VPC access to a shared services VPC, or facilitating communication 
  between a development VPC, a testing/QA VPC, or a production VPC.

Refer to this [blog](https://aws.amazon.com/blogs/networking-and-content-delivery/deploy-centralized-traffic-filtering-using-aws-network-firewall/)
for detailed architecture solution.
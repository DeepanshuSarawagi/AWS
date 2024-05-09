# Brief document on VPN and DirectConnect and its basic differences

## VPN:
- To enable communication between your VPC resources and those in datacenters
  you can use a VPN connection across your public internet.
- **On AWS side:**
  - In your VPC you must attach a Virtual GW.
  - The CGW has an endpoint attached to the VGW.
- **On customer VPN side:**
  - In your datacenter you must add a customer gateway.
  - A customer gateway with BGP protocol can enable dynamic routing between your VGW and CGW.
- A connection has to be initiated by your CGW. It cannot be initiated from VGW.
- Healthcheck pings can be setup to ensure VPN tunnel is not dropped.

### AWS Site-to-Site VPN architecture:

![Site-to-Site](https://docs.aws.amazon.com/images/whitepapers/latest/aws-vpc-connectivity-options/images/aws-managed-vpn.png)

### Route propagation:

- If route propagation is enabled on your route table in the VPC, routes representing
  your Site-to-Site VPN connection automatically appear as propagated routes in
  your route table.
- If you need to ping the EC2 instance from the on-prem network, then you need to enable the
  ICMP protocol in the inbound rule of security groups.


### AWS VPN CloudHub:
  - Provide secure connection between multiple sites if you have multiple VPN connections.
  - We can connect upto 10 customer gateway for each virtual private gateway.
  - Low-cost hub-and-spoke model to connect multiple Customer GWs with one VGW. 
  - Using CloudHub, we can connect multiple on-prem DCs together with VPC using VPN.

### AWS Client VPN:

- Connect from your computer using OpenVPN to your private network in AWS and on-premises.
- This requires installation of software.
- Refer to below architecture diagram how we can utilize AWS client VPN to connect to many VPCs.

![AWS client VPN](https://d2908q01vomqb2.cloudfront.net/5b384ce32d8cdef02bc3a139d4cac0a22bb029e8/2020/04/14/Screen-Shot-2020-04-07-at-10.30.06-AM.png)

## DirectConnect (DX):
- Direct Connect allows you to create a private connection between your remote
  datacenter and an AWS region, not just your VPC.
- Your datacenter will connect to an AWS partner using dedicated links which contains
  DirectConnect infrastructure.
- This is a separate building to your remote datacenter.
- You can configure private virtual interfaces and public virtual interfaces
  on your router for DC.
- **Private virtual interfaces** will connect to the VGW within your VPC.
- **Public virtual interfaces** connects to an AWS region allowing access to Public
  AWS resources such as S3 and DynamoDB.
- **Transit virtual interface** will allow to connect to VPC using transit gateway.
- Direct Connect Gateway can be used to setup a Direct Connect to one or more VPC in
  different regions (same AWS account).
**Direct Connect Connections:**
  - Dedicated Connections: Comes with a bandwidth of 1/10/100 GBPS.
  - Physical ethernet port dedicated to a customer.
  - Request made to AWS first and then completed by AWS Direct Connect partners.
**Hosted Connections:**
  - Bandwidth of 50 Mbps, 500 Mbps, 10 Gbps.
  - Capacity requests are made via AWS Direct Connect partners.
  - Capacity can be increased/decreased on-demand.
- Direct Connect often takes more than 1 month to establish.
- Data in transit is not encrypted but is private.
- AWS Direct Connect + VPN gives IPsec-encrypted private connection.
**- Two modes of resiliency:**
  - high resiliency with two Direct Connect locations
  - Maximum resiliency with two Direct Connect Locations and each location with two Direct Connect Connections.

### Direct Connect - Link Aggregation Groups:

- Get increased speed and failover by summing up existing DX connections into single logical one.
- Can aggregate upto 4 connections.
- Can add connections over time to the LAG.
- All connections in the LAG:
  - Must be dedicated connections
  - Must have the same bandwidth
  - Must terminate at same AWS DX connection endpoint.

### Direct Connect Gateway:

- Allows to setup Direct Connect to one or more VPC in many different regions.

### Direct Connect Gateway - Sitelink:

- SiteLink, a new feature of AWS Direct Connect (DX), makes it easy to send data from one Direct Connect location to another, bypassing AWS Regions. 
- If you recall, Direct Connect is a cloud service that links your network to AWS, bypassing the internet to deliver more consistent, lower-latency performance. 
- Prior to SiteLink, it was not possible to route traffic directly between Direct Connect locations. 
- Now, you can create global, reliable, and pay-as-you-go connections between the offices and data centers 
  in your global network by sending data over the fastest path between AWS Direct Connect locations.

![AWS Direct Connect](https://docs.aws.amazon.com/images/whitepapers/latest/aws-vpc-connectivity-options/images/redundant-aws-direct-connect.png)

Below is the architecture diagram how we can leverage AWS DX + Transit Gateway:

![DX - TGW](https://docs.aws.amazon.com/images/whitepapers/latest/aws-vpc-connectivity-options/images/aws-direct-connect-and-aws-transit-gateway.png)

With AWS Direct Connect + AWS Transit Gateway + AWS Site-to-Site VPN, you can enable end-to-end IPsec-encrypted connections 
between your networks and a regional centralized router for Amazon VPCs over a private dedicated connection.

![DX-TGW-S2SVPN](https://docs.aws.amazon.com/images/whitepapers/latest/aws-vpc-connectivity-options/images/aws-direct-connect-and-aws-transit-gateway-and-vpn-with-transit-vif.png)

Direct connect gateway sitelink architecture diagram:

![DX-Sitelink](https://d2908q01vomqb2.cloudfront.net/5b384ce32d8cdef02bc3a139d4cac0a22bb029e8/2021/12/01/Slide1-14.jpg)
# VPC in AWS.

A VPC is an isolated environment which allows you to provision your resources
within cloud which is accessible and visible only by you.

Subnetting is a process of splitting the CIDR block into a smaller CIDR blocks
using subnet masks. Subnetting allows you to logically divide your network for
different tiers which increases security of your infra.

A subnet can only belong to one routing table.
Multiple subnets allow you to restrict resources in certain subnets to specific
destinations via these defined routes.

Private IP CIDR ranges in AWS:

- 10.0.0.0/8
- 172.16.0.0/12
- 192.168.0.0/16

Within a subnet, AWS reserves 4 IP addresses.
- 1st IP address is the network address.
- 2nd IP address is reserved for AWS routing.
- 3rd IP address is reserved for DNS.
- 4th IP address is reserved for future use.
- Last IP address is the broadcast address which cannot be used either.

Subnets in a VPC contains following information:
  - Summary; which has following further detailed metadata
    - SubnetID
    - IPv4CIDR
    - Status
    - Available IPs
    - VPC
    - Availability Zone
    - Route Table
    - Network ACL
    - Default Subnet?
    - Auto Assign Public IP?
    - Auto Assign IPv6 IP?

  - Route table
    - All route destinations and targets are shown in this table

  - NACL
    - Network Access Control Lists provide a rule-based tool for filtering ingress
      and egress traffic of your subnet
    - NACL are stateless

  - Flow logs

  - Tags

Public and Private Subnets:

  - Public subnets have direct access to the internet while private subnets don't.
  - An internet gateway IGW must be attached to your VPC to get access to the internet.
  - However, the instances within your VPC will not have an understanding on how
    to get to the internet.
  - Hence, here comes in the route table. The route table will have IGW as target
    with destination as 0.0.0.0/0
  - Instances within a public subnet requires a public IP address.
  - Ensure any NACLs for the public subnet are not restricting any traffic.
  - Each subnet exists in a single AZ.

  IP addressing behaviour for assigning Public IP address within a public subnet:
    - Public IP addresses can be automatically assigned or can be assigned manually.
    - By default all subnets have automatic assignment of public ip addresses disabled.
    - By design, the public IP addresses are assigned from the AWS resource pool.
    - Once the instance no longer requires it, the ip is returned back to the pool.
    - If you want to reuse the public IP address again and again, it is better to
      assign an Elastic IP address.

  Following are CIDR ranges of Private IPs:
    - 10.0.0.0/8
    - 172.16.0.0/16 (most default VPCs subnets will be in this range)
    - 192.168.0.0/16

### Internet Gateway:
  - Allows resources in a VPC to connect to the internet.
  - Must be created separately from a VPC.
  - One VPC can only be attached to one IGW.
  - Acts as NAT for instances which has public IPV4 attached to it.
  - Internet Gateways on their own do not allow internet access.
    - We must edit the route tables.
  - Every Internet Gateway should have one or more explicit subnet associations.
  - And every subnet should have a route table attached to it.
  - We add routes that is public internet 0.0.0.0 in the public route table. The target of this route should be IGW.
  - Public route table must only be associated with public subnet.

### DNS Resolution in VPC:
  - If we use custom domain names in the VPC, and want to use custom domain names of a private hosted zone in Route53
    then we must enable the enableDnsSupport and enableDnsHostname attributes in VPC.

### VPC Reachability Analyzer:
  - A network diagnostics tool that troubleshoots network connectivity between two endpoints in your VPC.
  - It builds the model of network configuration, then checks the reachability based on these
    configurations. (doesn't send packets)

### VPC Peering:
  - Privately connect two VPCs together using AWS network.
  - Inter-region / cross-account VPC peering is possible.
    - You can reference a security group of a peered VPC (cross account)
  - Must not have overlapping CIDRs.
  - You must update route tables in each VPC's subnets to ensure EC2 instances can communicate with each other.
  - VPC uses the longest prefix match to select the most prefix route.
  - No Edge to Edge routing:
    - Lets say we have VPC-A and VPC-B peered together.
    - And VPC-A has connection to corporate network via VPN/Direct Connect.
    - That doesn't allow to have VPC-B have connection established with corporate network through VPC-A.
    - No Edge-to-Edge routing for `VPN, Direct Connect, IGW, NATGW, Gateway VPC Endpoints`.

### VPC Flow Logs:
- Log internet traffic going through VPC.
- Can be defined at the VPC/Subnet/ENI level.
- Helpful to capture `denied internet traffic.`
- Can be sent to CloudWatch logs, Kinesis Data Firehose and S3.
- Captures network information from managed interfaces such as:
  - ELB
  - RDS
  - ElastiCache
  - RedShift
  - Workspaces
  - Nat Gateway
  - Transit Gateway
- VPC Flow Logs when sent to CloudWatch can be used to determine the top 10 IP addresses in your network using cloudWatch
  contributor insights.
- 

### VPC Traffic Mirroring:
  - Allows you to capture and inspect traffic in your VPC.
  - Route the traffic to security appliances that you manage.
  - Capture the traffic from source ENIs to Network LB which is sitting infront of EC2 instances
    which will analyze traffic.

### IPV6:
  - We can enable the IPv6 in VPC to operate in dual stack mode.

### Egress only Internet Gateway:
  - Used only for IPv6 address.
  - Allow Instances in your VPC outbound connections over IPv6 while preventing the internet to initiate
    an IPv6 connection to your instances.
# Brief document on AWS RAM service

- AWS RAM is abbreviated as Resource Access Manager.
- Share AWS resource that you own with other AWS accounts.
- Avoid resource duplication.
- We can share VPC subnets.
  - Allow to have all resources launch in the same subnet.
  - must be from the same AWS Organizations.
  - Cannot share security groups and default VPCs.
  - Participants can manage their own AWS resources.
  - Participate can't view, modify, delete resources which are owned by other participants or owners.
- Transit Gateway.
- Route53 resolver group.
- License Manager configuration.

Other resources/services which can be shared using AWS RAM:
- Aurora DB clusters.
- AWS private CA.
- CodeBuild project.
- EC2 (Dedicated hosts, Capacity Reservation)
- AWS Glue (Catalog, Database, Table)
- AWS Network Firewall policies
- AWS Resource Groups.
- System Manager Incident Manager (Contacts, resource plans)
- AWS Outposts (Outposts, Sites)

## Managed Prefix List:

Another set of resource which can be shared using RAM is ```Managed Prefix Lists```.

It is typically one of the following:

- A set of one or more CIDR blocks.
- Makes it easier to configure and maintain Security Groups and Route tables.
- Example: lets say we have following CIDR ranges 10.0.0.0/16, 192.134.1.62/32, 192.168.0.0/24.
  - Then all these CIDR ranges can be added into a Prefix List which can then be shared with other AWS accounts for 
    references.
  - Customer Managed Prefix List:
    - Set of CIDRs that you define and managed by you.
    - Can be shared with other AWS Accounts or Organizations.
    - Any update on this prefix list, will be made on all AWS accounts / Security Groups who are leveraging this Prefix lists.
  - AWS Managed Prefix List:
    - Set of CIDR for AWS services.
    - You can't create, share, modify or delete them.

## Route53 outbound resolver:
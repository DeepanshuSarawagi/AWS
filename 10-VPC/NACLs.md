# Brief overview about the NACLs in AWS

NACL controls the virtual network level firewall rules which controls both ingress/egress
traffic flowing to your VPC and between your subnets.

Just like Route Tables, We can have multiple subnets having the same NACL, however, only one NACL can be
applied to one subnet.

- The default NACLs allow traffic.
- Each entry has a rule number.
- NACLs are read in rule number order.
- NACLs are stateless service. (Outbound is not allowed by default)
- NACL is the first entrypoint firewall in VPC to enter into a subnet.
- There is one NACL per subnet.
- NACLs are great for blocking IPs at subnet level.
- Default NACL accepts everything in inbound/outbound with the subnets its associated with.
- If there is an explicit allow then request enters into subnet and checks for security group.

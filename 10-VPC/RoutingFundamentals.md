# Brief document on routing tables

- AWS creates and adds an implicit routing table for your VPC during the creating of VPC
- Your default routing table is known as the routing table.
- The Main Route Table cannot be deleted.
- Subnets will be implicitly associated with the route table unless a custom rule
  route table has been created.
- A subnet can only be associated to the single route table.
- Multiple subnets can use the same route table.
- Each subnet must have its own gateway to leave the VPC to connect to the internet.
- Route propagation allows you to propagate against any virtual private gateway
  attached to your VPC.
- When enabled, routes representing your VPN connection over that VPC will be
  automatically added in the route table.
- Default limit of 200 routes per VPC.
- Each route table has a default limit of 50 non-propagated routes(Maximum 100)
- Maximum limit of 100 propagated routes per route table and this limit cannot be increased.


# Routing Priorities
- If route propagation is enabled for VGW and those propagated routes overlap the VPC's
  local routes, then the local route will have precedence over the propagated routes
  even though the propagated routes have longest prefix match.
- If any propagated routes have the same destination as any static routes, the longest
  prefix match is not applied. Route priority s executed against the static routes
  in following order:
  IGW
  VGW
  Network Interface
  Instance ID
  VPC Peering connection
  NAT gateway
  VPC Endpoint

# Network Load Balancer

- The Network Load Balancer operates at the layer 4 of the OSI model.
- Enables us to balance requests based on TCP protocols.
- The supported listeners are TCP, TLS and UDP.
- The NLB is able to process millions of requests per second
- If the application logic requires a static IP address per AZ then NLB is preferred.
- It also supports assigning Elastic IP.
- For the NLB, cross zone load balancing can be enabled or disabled.
- Using NLB, we can also route traffic to ALB.
- NLB does not have a security group associated with it.
- NLB has one static IP per AZ and supports assigning EIP.
- Target groups:
  - EC2 instances
  - Private IP address
  - ALB

## NLB - Zonal DNS Name:
- If we have NLB created across three AZs, then resolving regional NLB DNS names will return the IP address of NLB nodes 
 in all three AZs.
- **Zonal DNS Names:**
  - NLB has DNS names for each of its nodes.
  - Used to determine IP address of each of its nodes per zone.
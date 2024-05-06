# Brief document on the use of bastion hosts in AWS VPC

- A bastion host can be used as a jumphost to connect to the EC2 instances in a
  Private subnet.
- Bastion host should be created in the public subnet of your VPC and the security
  group should be very stringent. It should allow connections only on port 22 to
  a specific user IP address.
- Once the bastion host is created, we need to create one more security group in the
  private subnet allowing SSH connections only from the source if it is security group
  of bastion host.
- Since we require a private key to SSH into any EC2 instances, the private key of
  the EC2 instances in the private subnet should not be placed in the bastion hosts
  since it could be a great security threat.
- Hence, we can manage the private keys of private instances using SSH Agent Forwarding.
- SSH Agent Forwarding stores the private keys of your instances running on the
  private subnets.

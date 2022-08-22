# Brief document on NAT Gateway

- A NAT Gateway sits within the public subnet with an EIP.
- NAT GW allows the private resources to access the internet.
- A private instance should have a route to access the NAT GW.
- It will block all incoming communications from the internet.
- You can use a network address translation (NAT) gateway to enable instances in a private subnet to connect to the
  Internet or other AWS services, but prevent the Internet from initiating a connection with those instances.
-  To create a NAT gateway, you must specify the public subnet in which the NAT gateway will reside.
-  You must also specify an Elastic IP address to associate with the NAT gateway when you create it.
-  After you've created a NAT gateway, you must update the route table associated with one or more of your private
   subnets to point Internet-bound traffic to the NAT gateway.
-  Disabling source/destination checks is a feature of NAT Instances not NAT Gateways.
- Port forwarding is not supported.
- No security group association is required.

NAT Instances:
- Same as NAT gateway, must be created in the public subnet.
- We must disable the EC2 check: source/destination check.
- Must have an EIP attached to it.
- Port forwarding is supported.

Complete comparison can be found here - https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-comparison.html
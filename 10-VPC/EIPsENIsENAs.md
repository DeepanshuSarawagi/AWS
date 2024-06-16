# Brief document to differentiate among ENIs, EIPs and ENAs.

EIP:
  - EIPs provide a persistent public IP address that you can associate with your EC2 instance.
  - The IP address is associated with your account rather than your instance.
  - You can attach an EIP to an instance or to an Elastic Network Interface, ENI.
  - You can also detach a EIP from an instance and attach it to your instance.
  - Any unsused EIP will incur cost.

ENIs:
  - Logical component in a VPC that represents a virtual network card
  - Each ENI can have the following attributes
  - It can have 1 Primary Private IPv4 and one or more Secondary IPv4
  - One Elastic IP (IPv4) per one Private IPv4
  - One Public IPv4
  - One or more security groups attached to a ENI
  - MAC address can be attached to the ENI
  - Bound to a specific Availability Zone
  - The configuration is bound to an ENI and not the instance it is attached to.
  - Useful to create a management network.

ENAs:
  - Provides enhanced networking features to reach speed upto 100 Gbps.
  - They are not supported for all instances. Must be running kernel versions 2.6.32
    and 3.2 and above.
  - Offers high bandwidth with increased packet per second performance.
  - Offered at no extra cost and is included with the latest version of Amazon Linux AMI.

EFA:
  - Elastic Fabric Adapter
  - Improved ENA for HPC, works only for Linux.
  - Leverages Message Passing Interface standard.
  - Bypass the underlying OS to provide Low-latency, reliable support.
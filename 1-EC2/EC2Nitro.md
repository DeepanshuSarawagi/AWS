# This document will give us a brief introduction to EC2 Nitro

## EC2 Nitro:
- Underlying platform for the next Gen EC2 instances
- New virtualization technology
- Allows for better performance
  - Better networking option (Enhanced networking, HPC, IPv6)
  - Higher speed EBS (Nitro is for 64,000 EBS IOPS, for a Non-Nitro, max IOPS can be upto 32,000)
- Better underlying security
- Instances types examples
  - Virtualized: A l, C5, C6, D3, G4, I3en, M5
  - Bare metal: a l.metal, c5.metal, c5d.metal, c5n.metal, c6g.metal, c6gd.metal

## EC2 - Understanding vCPU
  - Multiple threads can run on one vCPU (Multithreading)
  - Each thread is represented as a virtual CPU
  - Example: m5.2xlarge
    - 4 cores (CPU)
    - 2 threads per CPU
    - 8 vCPU in total 

# This document will give us a brief introduction about EC2 hibernate

## EC2 Hibernate:
- The in-memory (RAM) state is preserved
- The instance is much faster (Since underlying OS is not stopped)
- Under the hood: The whole state of RAM is written to a text file in a root
  EBS volume
- The root EBS volume must be encrypted

### Use cases:
- Long-running processing
- saving the RAM state
- services that take time to initialize

## Supported instances families:
- C3, C4, C5, M3, M4, M5, R3, R4 and R5
- Instance RAM size must be less than 150 GB
- Supported AMIs - Amazon Linux 2, Linux, Ubuntu and Windows
- Root volume must be EBS, encrypted, not instance store, and large
- Available only for On-Demand and Reserved instances
- Any instance cannot be in hibernate state more than 60 days

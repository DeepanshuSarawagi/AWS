# This document will give us brief introduction to EC2 Placement Groups
We can control over the EC2 Placement instance strategy

When you create a placement group, you specify one of the following strategy
for the Groups

- Cluster - Clusters instances into a low latency group in a single Availability Zone
- Spread - Instances are going to be spread across underlying hardware (Max 7 Instances per group per AZ.) - Critical applications
- Partition - It is similar to the spread. Spreads instances across many different partitions which rely on different sets of racks within in AZ.
            Scales to 100s of instances per group(Cassandra, Kafka, Hadoop)

## Cluster:
- Low latency - 10Gbps network
- Same Rack, Same AZ.
- Instances are on the same hardware
- If the rack fails, all the EC2 instances will fail at the same time.
- Use case - Big data jobs, batch jobs
- High performance computing and networking.

## Spread:
- All EC2 instances will be located on the different hardware span across multiple AZ.
- Reduced risk of simultaneous failures.
- From this config, we are limited to 7 instances per AZ per placement group.
- Spread placement groups are not supported for Dedicated Instances.
- Use case: 
  - Maximum high availability. Critical applications that must be isolated from failure from each other.

## Partition:
- We can create multiple partitions across multiple AZ.
- All EC2 instances are spread across multiple partitions across multiple AZs.
- We can create 100s of EC2 instances per partition.
- We can create upto 7 partitions per AZ.
- Each partition represents a hardware rack in AWS.
- Each partition is isolated from each other hence avoiding simultaneous failures across multiple EC2 instances.

## Note:

: You can move an instance into or out of placement groups. Follow below steps.

- Stop the EC2 instance
- Use the CLI `modify-instance-placement` API to move into or out of placement group.
- Start the EC2 instance

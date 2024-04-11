# This document will give us an overview of Elastic Block Storage

- Persistent storage which means data is not lost if the EC2 instance is terminated.
- They are bound to a specific AZ.
- EBS volumes are independent of the EC2 instances.
- They are logically attached to the instance instead of directly attached like
  instance store volumes.
- From a connectivity perspective, each EBS volume can only be attached to a single
  EC2 instance at any time. However, multiple EBS volumes can be attached to the
  same EC2 instance.
- However, Amazon has now added a new feature called EBS Multi-Attach.
- EBS Multi-Attach feature can allow you to attach the storage access between
  multi-instances and prevent data inconsistencies. It can support upto 16 linux
  instances that are using the Nitro system and that are in the same availability zone.
- Backups in the form of snapshots can be created and it will be stored in the S3.
- If an EBS volume is corrupted or lost or for some reason not accessible, then
  a new EBS volume can be created with the Snapshot created. It then can be attached
  to the EC2 instance.
- To add additional flexibility and availability, it is possible to copy a Snapshot
  from one region to another.
- One important note to consider is that, EC2 volumes can be attached to EBS volumes
  within the same availability zone.
- Also, one EBS volume can be accessed by one EC2 instance at a time.
- EBS volumes can be resized.

## EBS Snapshot features:

- Incremental backups.
- EBS backups use IO and you shouldn't run them while application is handling lot of traffic.
  - Application may experience decreased performance if there is heavy RO traffic.
- Snapshots will be stored in S3.
- Not necessary to detach volume to do snapshot, but it is highly recommended.
- Can copy snapshot across region.
- Can make AMI from snapshot.
- EBS volumes restored by snapshots needs to be pre-warmed first. (Need to utilize the Fast Snapshot Restore feature which
  will read the entire volume first. Or you can also attach it to the EC2 instance and run fio/dd command to read the 
  entire volume to pre-warm it)

**- EBS Snapshot Archive:**
  - Move the snapshot to Archive which is 75% cheaper
  - Takes 24-72% to restore the archive.
**- EBS Snapshot bin:**
  - You can restore the snapshot from bin which were accidentally deleted.
  - The retention period is 1 day to 1 year.

## EBS Volume types:

### - SSD volumes

- suited for work with smaller blocks
- Two types: General Purpose and Provisioned IOPS.
- General Purpose SSD:
- Cost effective storage, low latency.
- Used for system boot volumes, virtual desktops, Development and test environments.
- 1GB - 16TB
- GP3: Baseline of 3000 IOPS and throughput of 125 MB/S.
- Can increase IOPS upto 16000 and throughput of 1000 MB/s.
- GP2: Can burst upto 3000 IOPS.

Provisioned IOPS provides throughput of 16000 IOPS with 250 MiB/S.
- Critical business application with sustained IOPS performance.
- Or for applications more than 16,000 IOPS.
- Great for database workloads.
- iO1/iO2 - 4GB - 16TB.
- Max IOPS of 64000 with EC2 nitro instances and max 32,000 IOPS for other instances.
- iO2 Block Express Provisioned SSD: Can range from 4GB - 64TB
- sub-millisecond latency.
- Max IOPS of 256,000 and IOPS:GB ratio is 1000:1
- supports EBS Multi-Attach

### - HDD volumes

- suited for workload that requires higher throughput or high blocks
- of storage. Eg; big data or logging information.
- Two Types:
- Optimized HDD - Cannot be a boot volume. Used for higher throughput. Max throughput of 500 MB/s and
- Max IOPS of 500.
- Cold HDD - Lowest cost volume. Cannot be a boot volume. Generally used for
- low infrequently accessed data.
- Max throughput of 250 MB/s and Max IOPS of 250.

## EBS Security:
- Possible to enable encryption during the creation.
- Used AES 256 algorithm.
- Data at rest and data in flight is also encrypted.
- Any snapshots created will also be encrypted.
- All the volumes created from the encrypted snapshot will also be encrypted.
- There is an account level setting to automatically encrypt all new EBS volumes and snapshots.
  - This setting needs to be enabled on a per-region basis.

## EBS Multi-Attach:
  - Available only for Provisioned IOPS SSD Volumes of io1/io2 types.
  - Attach the same volumes to multiple EC2 instances in same AZ.
  - Achieve higher application availability in linux cluster.
  - Must use a file-system that's cluster-aware (Not XFS, EX4).

## Amazon Lifecycle Data Manager:
- Automate the creation, retention, deletion of EBS snapshots and EBS backed AMIs.
- Can schedule the backups, cross account snapshot copies and delete the outdated backups.
- Uses resource tags to identify the resources.
- Can't be used to manage snapshots/AMIs created outside of DLM.
- Can't be used to manage instance-store backed AMIs.
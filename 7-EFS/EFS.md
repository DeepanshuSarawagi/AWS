# Basics of EFS:

## Introduction:

- Managed network filesystem that can be mounted on many EC2.
- EFS works with EC2 in multi-AZ and on-prem (Using DX and VPN)
- Highly available, scalable and expensive (3xgp2 EBS), pay per GB used.
- Is considered as file storage which also has low latency access.
- Unlike EBS, it supports multiple EC2 instances at once.
- Simple scalable filesystem which can be mounted on multiple EC2 instances by creating multiple mount-points on multiple AZs.
- It can easily scale to Petabytes in size with low latency access.
- It has been designed for high level throughput.
- Works only with Linux based AMI, POSIX compliant.
- Uses NFSVv4.1 protocol.
- Uses security groups to control access.
- Encryption at rest using KMS.
- Can attach to one VPC alone, create one ENI (mount target) per AZ.

## Storage Classes and Performance Options:
- Standard
- Infrequent Access

### Standard Storage Class
- Charges on the amount of storage used per month

### Infrequent Access Storage Class
- Charges on the amount of Read/Write operations.
- Reduced cost when compared to the standard class.
- Supports lifecycle management similar to S3.
- The files are moved to IA storage class if the file is not accessed based on lifecycle rules.
- The lifecycle rules can be set to 14, 30, 60 or 90 days.
- Once the file is accessed within the lifecycle set, the timer gets reset and file automatically moves to standard class.
- Any files which has size less than 128K or it has metadata about your files, then it will remain in the standard storage class.

### Scalability:
- 1000s of concurrent NFS clients, 10+ Gbps throughput.
- Grow to petabyte scale NFS automatically.


| **Performance Metrics** | **General Purpose** | **Max I/O**     |
|-------------------------|---------------------|-----------------|
| **Throughput**          | Standard            | Unlimited       |
| **IOPS**	               | 7K<= per second     | 7k>= per second |
| **Latency**             | 	Low Latency        | 	High Latency   | 

### Throughput Modes:

- **Bursting Throughput -**  100 MiB/Second per TiB
- **Provisioned Throughput -** Set your throughput regardless of storage size. Additional changes incur since it provides 
  additional Throughput.
- **Elastic -**
  - Automatically scales throughput up or down based on workload.
  - Upto 3 GiB/s for reads and 1 GiB/s for writes.
  - Used for unpredictable workloads.

## Creating EFS:

**EFS can be created using two methods:**

- EFS Mount Helper (Latest)
- Linux NFS client

### EFS Mount Helper:

- Simplifies the mount process
- Has an internal logging system. It logs to /var/log/amazon/efs
- Automatically connects to EFS at startup by editing the /etc/fstab

#### Pre-requisites:

- Create EFS File System and EFS mount targets
- A running EC2 instance with EFS mount helper installed
- Needs a EC2 instance in VPC. Amazon DNS servers with DNS hostnames
- A security group allowing NFS access your EC2 instance

## Storage classes:

### Standard:
- For frequently accessed files.

### Infrequent access:
- Cost to retrieve files.
- Lower price to store.
- Enable EFS-IA with a lifecycle policy.

## Availability and Durability:

- Regional: Multi-AZ, great for Prod.
- Great for lower environments, compatible with IA; EFS One Zone-IA

## On-premises and VPC peering:

- EFS has a way to be mounted with on-premises and has VPC peering.
- The VPC elsewhere can be peered with your EFS VPC for you EC2 instances to access your EFS drive.
- Or through on-premises servers through DC or Site-to-Site VPN.
  - On-premises mount of EFS should be done using IPV4.

## Access points:
- Easily manage application environments to NFS environments.
- Enforce a POSIX user and a group to use when accessing the file system.
- Restrict access to directory within a filesystem and optionally specify a different root directory.
- Can restrict access from NFS clients using IAM policies.

### Use case of EFS access points:

- Consider the following directory structure of / -> /root, /config, /secrets, /data.
- We create an `Access Point 1`, lets say `UID: 1001, GID: 1001, Path: /data`
- Then any IAM identity which has access to this `access point 1` using IAM will only be able to access the `/data` directory
  of your NFS.

## EFS - File System policies:

- Resource based policies to control access to EFS File System
- By default it grants full access to all clients.

## EFS - Cross-Region replication:
- Replicate objects in an EFS file system to another AWS region.
- Can be setup for new or existing EFS file systems.
- Provides RTO and RPO of minutes.
- The replication setting doesnt affect the throughput of the file system.
- 
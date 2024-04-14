# This document will provide brief explanation on Amazon Aurora

- Fully managed database service by Amazon
- SQL - MySQL and Postgresql
- Distributed, fault-tolerant, self-healing storage system that auto-heals
- Replication across 3 AZs in 6 replicas.
  - 4 copies out of 6 needed for writes.
  - 3 copies out of 6 needed for reads.
  - Self-healing with peer to peer replication.
- Upto 15 low-latency read replicas can be created.
- Aurora is a serverless database service with automatic fail-over.
- Continuous backup to S3
  - Load/Offload data directly from/to S3.
- Encryption at rest using KMS and Encryption at transit using SSL.
- Replication of data is performed asynchronously in milliseconds - fast enough to
  give the impression that the data synchronisation is happening synchronously.
- Master and Read Replicas use the same Storage Cluster Volume.
- Read Replicas can be launched in different AZ using the same VPC or can be launched
  as cross region replicas.
- Each Read Replica can be tagged with a label indicating priority in terms of which
  one to get promoted to the role of Master in the event of master going down.
- **Aurora storage automatically grows incrementally in 10GB upto 128TB.**
- **Aurora is 10% costlier than RDS.**
- Support for cross-region replication.
- Enabling Backtrack, helps us to rewind a Aurora DB cluster to a specific point in time.
- Aurora has a old backtrack time of 72 hours.
- Auto-scaling of storage from 10GB to 128TB.
- Amazon Aurora will promote the Read Replica that has the highest priority (the lowest numbered tier).
  If two or more Aurora Replicas share the same priority, then Amazon RDS promotes the replica that is largest in size.
- Automated failover for master in less than 30 seconds.

## Aurora Logs:
- You can monitor the following types of Aurora cluster logs:
  - Error
  - Slow Query
  - General
  - Audit
- These log files are either downloaded or published to CloudWatch logs.

## Convert RDS to Aurora:

### Option1:

- Create an RDS snapshot. And then restore the snapshot into an Aurora DB instance.
- Quicker option, however, application still using RDS main instance will have problems due to replication of remaining data.

### Option2:

- This option is to create an Aurora Read Replica from RDS DB instance. 
  - It is possible to create Aurora Read Replica from Non-Aurora RDS instance.
- When the replication lag is zero, you can then promote it to Aurora DB instance.

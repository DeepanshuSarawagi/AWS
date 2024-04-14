# Brief document to explain on how RDS can be used in Multi-AZ

## Introduction:

- RDS in Multi-Availability Zone is a feature used to help with resilience and
  business continuity.
- Multi-AZ configures a secondary RDS instance within a different availability zone
  in the same Region as the primary instance.
- This secondary RDS instance should not be confused with Read Replicas which is
  used for read only traffic.
- The purpose of secondary RDS instance if provide a failover option for a primary
  RDS instance.
- The replication of data happens synchronously.
- RDS uses a failover mechanism on Oracle, MySQL, MariaDB, PostgreSQL.
- The RDS failover process happens automatically and is managed by AWS.
- RDS updates the DNS record to point to the secondary instance within 60-120 seconds.
- The RDS failover triggers an event which is recorded as `RDS-EVENT-0025` when the
  failover process is complete.
- The failover event can be notified using SMS/SNS service.

## SQL Server Mirroring:
- SQL sever Multi-AZ is achieved through the use of SQL Server Mirroring.
- SQL Mirroring provisions a secondary RDS instance in a different AZ than that of
  primary RDS instance to help with resilience and fault tolerance.
- Both primary and secondary RDS instances in SQL server Mirroring uses the same endpoint.

### Things to consider before SQL Mirroring:
- We need to ensure that we have the environment configured correctly.
- A DB subnet group must be configured with a minimum of two AZs in it.
- You can specify which AZ the secondary RDS instance will reside in.

## Fault tolerance in Amazon Aurora DB:
- Aurora DB clusters are fault tolerant by default.
- This is achieved within the cluster by replicating the data across different instances in
  different AZs.
- Aurora can automatically provision and launch a new primary instance in different AZ within 10 minutes in the event of failure.
- Multi-AZ on Aurora cluster allows RDS to provision a replica within a different AZ
  automatically.
- Should a failure occur, the replica instance is promoted to new primary instance
  without having to wait 10 minutes.
- It is possible to create 15 different replicas if required, each with different priority.

# Brief document on read replicas in Amazon RDS

## Introduction:

- Read replicas are NOT used for resiliency or secondary instance in the event of
  a failover.
- Read Replicas are used to serve the read-only access to your database data via
  a separate instance.
- A snapshot is taken from your primary database.
- Once the snapshot is completed, a read-replica instance is created.
- The read replica maintains a secure asynchronous link between itself and the
  primary database instance.
- At this point, read only traffic can be directed to the Read-replica.
- Read Replicas are only available for MySQL, MariaDB and PostgreSQL database engines.
- It is possible to deploy more than one read replica for a primary DB.
- Adding more replicas allows you to scale your read performance to a wider range
  of applications.
- You are able to deploy read replicas in different regions.
- **It is possible to promote an existing read replica to replace the primary db instance
  in the event of an incident.**
- For read replicas, you dont pay the fee is the data is travelling across multi-AZ within same region.
- During any maintenance of the primary instance, the read traffic can still be
  served by the read replicas.

### Distributing Reads across replicas:
- Using Route53 we can use the weighted record set to route traffic equally among all the replicas.
- We can also include health checks to read replicas using Route53, hence, in event of failures, application traffic will
  not be routed to a faulty ready replica instance.

## Read Replicas for MySQL Engine:
- Read replicas are only supported where the source DB is running MySQL DB V5.6 or later.
- The retention value of the automatic backups of the primary DB needs to set to
  a value of 1 or more.
- Replication is only possible when using an InnoDB storage engine which is transactional.
- It is possible to have nested read replicas chain. This chain can only be a maximum
  of 4 layers deep.
- You can have up to a maximum of 5 read replicas per each source DB.
- If an outage occurs with the primary instance, RDS automatically redirects the
  read replica source to the secondary DB instance.
- Amazon CloudWatch can monitor the synchronization between the source DB and the
  read replica through a metric known as ReplicaLag.

## Read Replicas for MariaDB Engine:
- All the config or requirements of read replicas using MariaDB engine are same as
  MySQL engine.
- The only difference is you can be running any version of MariaDB for read replicas.

## Read Replicas for PostgreSQL Engine:
- When using PostgreSQL, you need to run version 9.3.5 or later for read replica.
- The native PostgreSQL streaming replication is used to handle the replication and
  creation of the read replica.
- The connection between the master and the read replica instance replicates the
  data asynchronously between the 2 instances.
- PostgreSQL allows you to create Multi-AZ read replica instance.
- It is possible to create the Multi-AZ read replica instance even if the source
  DB of the first read replica is not configured for Multi-AZ deployment.
- PostgreSQL does not allow nested read replicas.

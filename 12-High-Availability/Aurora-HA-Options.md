# HA Options available in Amazon Aurora Service

## Introduction:

- Amazon Aurora - AWS' fastest growing service.
- Database service with superior MySQL and PostgreSQL engine compliant service.
- Separates the compute layer from the storage layer.
- Separating the compute layer from the storage layer is the key architectural
  decision which allows you to dial up and down the availability of your data.
- Read replicas can be easily introduced and removed at will.
- The compute layer when launched can be provisioned in several configurations -
  providing varying forms of performance and availability.
- The compute layer is implemented using the EC2 instance, but this is a managed
  service, it will not show up in the console.
- Aurora stores data in 10GB  block, with each block being replicated 6 times
  across 3 AZs - 2 within each AZ. 
- From an availability and durability point of view,
  Aurora can handle up to 3 copies lost for reads, and up to 4 copies lost for write.
- This makes the data highly redundant, durable and available.
- The storage layer is presented to the compute layer as a single logical volume.
- This same single logical volume is shared across all compute instances involved
  in the compute layer whether it be a master or read replica - allowing the read
  replicas to accomplish the near-identical query performance as the master itself.
- With RDS data needs to be replicated from the master to each of its replicas. 
- **With Aurora on the other hand has no need for the replication since it uses the
  single logical volume amongst all compute instances.**
- Aurora uses a Quorum and Gossip protocol basked within the storage layer to ensure
  that the data remains consistent.
- Together the Quorum and Gossip protocol provide a self-healing mechanism for the
  data.
- Reads operation require a Quorum of 3 and writes operation require a Quorum of 4.
- The peer to peer Gossip protocol is used to ensure that data is copied to all 6
  nodes.
- Aurora in general and regardless of the compute storage setup, always provides
  6 way replicated storage across 3 availability zones.
- **In the event that the Aurora detects Master going offline, it will either launch
  a replacement master or will promote its existing read replica to the role of master.**

## Connection Endpoints:
- Connection Endpoints is load balanced internally using Route53 DNS.
- Be careful in the client layer, not to cache the connection endpoint lookups
  longer than their specified TTL.
- Connection Endpoints are mostly used in "Single Master and multiple read replica"
  setup.
- Below are four different types of connection endpoints.

## Cluster/Writer Endpoints:
- A cluster endpoint provides connectivity to current master database instance. 
- Using the Cluster endpoint allows you to perform read and write operations on
  the master database instance.

### Reader Endpoints:

- Reader endpoint load balances connections across the read replica fleet within
  the cluster.

### Custom Endpoints:

- A custom endpoint load balances the connections to a group of specific cluster
  instances that you choose and register. 
- Custom endpoint can be used to group instances based on instance size or maybe group them on a particular DB parameter
  group.

### Instance Endpoints:

- An instance endpoint maps directly to a cluster instance. 
- Each and every instance has its own instance endpoint. 
- You can use an instance endpoint when you want a fine grained control over instance which you want it to service your requests.

## Aurora Replicas Auto-Scaling:
- Using Read-Replicas auto-scaling, we can scale out the read replicas upto 15 instances based on the
  policy we define.

## Aurora Multi-Master node setup:
- Pair of masters are created in Active-Active read write configuration.
- This provides fault tolerance at the compute layer.
- A maximum of 4 compute instances can be configured in Multi-Master setup.
- We cannot add read replicas in this Multi-Master configuration setup.

## Aurora Serverless:
- Aurora serverless is an elastic solution that auto-scales the compute layer
  based on application demand, and only bills you when its in use.
- Ideally suited towards application which exhibit variable workloads and/or have
  infrequent data accessing and modification needs.
- When provisioning an Aurora serverless database, we no longer need to plan and
  allocate instance sizes. 
- Instead, we simply configure lower and upper limits for capacity. 
- Capacity is measured in ACUs which is Aurora Capacity Units.
- Aurora will continually adjust and optimize the capacity units based on demand.
- An Aurora serverless database is configured with single connection endpoint.

### Aurora Serverless - Data API:
- Access Aurora Serverless DB with an API endpoint (No JDBC connection required).
- Secure HTTPS endpoints to run SQL statements.
- No persistent DB connection management.
- Users must be granted permission to Data API and Secrets Manager.

### RDS Proxy for Aurora:

![RDS Proxy for Aurora](rds-proxy-for-aurora.png)

Note:

: This is taken from Stephane Maarek's Udemy course. I do not own the copyright hence don't use it for commercial purpose.
This is only meant for Educational purpose.

## Aurora Global:
- Aurora Cross region read-replicas.
- Aurora Global Database.
  - One primary region where all reads and writes happen.
  - Upto 5 secondary read-only regions with replication latency of < 1 second.
  - Upto 16 read-replicas per secondary region.
  - Promoting another region has an RTO of < 1 minute.
- Ability to manage the RPO in Aurora for PostgreSQL.

### Write Forwarding:
- Enables secondary DB clusters to forward SQL statements that performs write operations to the primary DB cluster.
- Data is always changed first on the primary DB cluster and the replicated on the secondary DB clusters.
  - This way no direct CUD operations  happen on secondary DB clusters.
- Primary DB cluster always has an upto date copy of all data.
- This architecture helps in reducing the number of endpoints to manage.

## Aurora Machine Learning:
- Aurora is Compatible with integrating with Machine Learning services
- Currently supports two ML services offered by AWS - AWS SageMaker and AWS Comprehend (For sentiment analysis)
- Use cases: Fraud detection, ads protection, sentiment analysis and product recommendations.
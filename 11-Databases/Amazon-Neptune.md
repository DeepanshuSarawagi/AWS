# Brief document on Amazon Neptune and its use cases

- This is a fully managed, fast, reliable and secure graph database service.
- Graph database is ideal if the focus is on relationship of interconnected data
  rather than the database.
- Highly available across 3 AZs, upto 15 read replicas.

### Uses Cases:
  - Powerful asset when running a social networking application.
  - Helps in detecting financial fraud by analyzing the potential known fraud.
  - Can also be used as Recommendation Engines.
  - 
## Components of Amazon Neptune:
  - Uses its own Graph database engine which supports two graph frameworks
  - Apache Tinkerpop Gremlin: Allows you to query your graph running on Neptune DB,
    using the Gremlin Traversal language.
  - World Wide Web consortium sparql: Designed to work with network and can be used
    to run queries against your Neptune DB graph.

## Neptune DB Cluster:
  - Single or required multiple database instances span across different AZs in addition
    to virtual database cluster volumes which contains data across all instances
    within the cluster.
  - The single cluster volume consists of solid state drives or SSDs. As the graph
    database grows, the shared volume will automatically scale and increase in size
    as required upto max of 64 TB.
  - To ensure high availability and reliability, each cluster maintains its separate
    copy of shared volume in at least 3 different AZs.
  - Neptune's storage auto-repair, will find and detect any segment failures that are
    present in the SSDs nd automatically repair the segment using the data from the
    shared volume in the cluster.
  - Each Neptune cluster, will have a primary database instance which will serve
    Read/Write operations and replicas to perform the read operations. Any read query
    results served by the replicas will have Minimum lag typically upto 100 ms after
    new data has been written to the volume. A maximum of 15 replica per cluster
    can exist which can span across multiple AZs.
  - If a primary Neptune DB instance in a AZ is subjected to failure, then the read
    replica in a different AZ will be promoted to primary instance. This process can
    take upto 30 seconds.

## Connecting to Amazon Neptune:
  - We can connect Amazon Neptune DB instances using endpoints. There are three
    different types of Amazon Neptune endpoints.

### Cluster Endpoint:

- Points directly to the current primary DB instance of a cluster.
- Should be used by applications that require both read and write access to the databases.
- When primary DB instance fails, will point to the new primary DB instance without making any changes to the applications accessing the database.
 
### Reader Endpoints:

- Used to connect to read replicas.
- Allows applications to access your database on a read only basis for your queries.
- A single reader endpoint exists even if you have multiple read replicas.
- Connections served by the read replicas will be performed on a round-robin basis.
- The endpoint does not load balance your traffic in any way across the Available replicas in your cluster.

### Instance Endpoints:

- Every instance within your cluster will have a unique instance endpoint.
- Allows you to direct certain traffic specific instances within the cluster.
- You might want to do this for load balancing reasons across your applications reading from your replicas.

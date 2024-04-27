# Brief document on Amazon Redshift service

## Introduction:

- Fast, fully-managed Petabytes scaled data warehouse.
- Designed for high performance and analysis information.
- Operates on RDMS, hence compatible with other RDMS applications.
- Based upon Postgresql 8.0.2 but its not used for OLTP. (Online Transaction Processing)
  - It is used for OLAP - Online Analytical Processing.
- A data warehouse is used to consolidate data from multiple sources and allows you
  to run BI tools which then helps you identify actionable business intelligence data.
- This will then help you to drive your organization with business driven results and decisions.
- Runs on Massive Parallel Query Execution.
- Columnar storage of data instead of row based.
- Runs on a paradigm of Extract, Transform and Load.
- Enhanced VPC Routing Redshift forces all COPY and UNLOAD traffic moving between your cluster and data
  repositories through your VPCs.

## Redshift Snapshots and DR:
- Redshift has no Multi-AZ mode.
- Snapshots are point-in-time backups of cluster stored internally in S3.
- The backups are incremental in nature.
- The Snapshots can be automated: Every 8 hours, Every 5 GB or Scheduled with set retention period.
- Manual snapshots can be taken with infinite retention period until you delete it.
- Snapshots can be automated to be copied into another AWS region and restore of cluster in another region.

## Components of Redshift:
### Cluster:
- Main or the core component of Amazon Redshift service which has its own Redshift
- engine and has at least one database.
- Each cluster component will have at least 1 compute node. 
- If there are more than 1 compute node, then Amazon will create one more component called Leader Node.
- Leader Node has the role of coordinating the communication between the compute Nodes and other external apps. 
- When external apps query the data from the Redshift data warehouse, Leader Node creates the execution plans and returns the results of the query.
- If the query from the external apps references to the tables associated with the compute nodes, this code is then distributed 
  to the cluster node to obtain the required data which is then sent back to the Leader Node to deliver it to the external apps. 
- Leader Node thus acts as a gateway between the external applications and cluster node.
- Each compute node is itself split into slices called as Node slices. 
- A Node Slice is simply a partition of the Compute Node where the node's memory and disk spaces live.
- Each Node Slice then process the operation given by the Leader Node where parallel
- operations can be performed across all slices and all nodes at once for the same query.
- The compute nodes may vary from 1 node to 128 nodes. 
- Redshift Spectrum can perform queries directly against S3.

### Connectivity:
- Communication between Business Intelligence applications and Amazon Redshift database can be established using either ODBC or JDBC.

### Performance features:
- Massive Parallel Programming
- Columnar Data Storage
- Result caching.
- Results are cached in the memory of the Leader Node, whenever a query is made to the Redshift Database, 
- Leader Node first checks for the results within its memory

### Redshift Spectrum:
- Query data that is already in S3 without loading it.
- Must have a Redshift cluster available to start the query.
- The query is then submitted to thousands of Redshift spectrum nodes.
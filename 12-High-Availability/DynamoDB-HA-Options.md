# Brief document explaining the HA options available in DynamoDB

- Designed internally to automatically partition data and incoming traffic across
  multiple partitions.
- Partitions are stored on numerous backend servers distributed across three
  availability zones within a Region.
- DynamoDB being a managed service takes care of performing both the partition
  management and replication.
- Dialing up and down the provisioned throughput of a DynamoDB database is possible
- DynamoDB provides a second layer of availability in the form of Cross Region
  Replication (Global Tables)
- A Global Table gives you the capability to replicate a single table across 1 or
  many alternate regions.
- A Global Table elevates the availability of your data and enables applications
  to take advantage of data locality.
- Users can be served data directly from the closest geographically located table
  replica.

## On Demand Backups:
- Allow to request a full backup of a table, as it is at the very moment the backup
  request is made.
- On demand backups remain in the account until they are explicitly requested to be deleted
- Backups typically finish within seconds and have zero impact on the table performance
  and availability.

## Point In Time Recovery - PITR:
- It is an enhanced version of on demand backup and restore feature, providing you
  the ability to perform point in time recoveries.
- With PITR in place, you can simply restore back to a specific time.
- Operates at the table level and provides you with the ability to perform point
  in time recovery and for any time between the current time and the last 35 days.
- The restoration will always be performed into a new table of which you specify
  the new table name.
- Table restoration can be performed in the same region as the original table, or
  into a different region altogether.

## DynamoDB Accelerator:
- Seamless cache for DynamoDB. No re-write of application required.
- The data is automatically replicated to different AZs and that replication usually
  happens in milliseconds but this synchronisation can take longer time. This is
  called as eventual consistency.
- There are certain kinds of queries and table scans that may return older version
  of data before the most recent copy.
- We might have a requirement where we need microsecond response times in a read-heavy
  workloads, this is where DynamoDB Accelerator comes into play.
- DAX is an in-memory cache delivering significant performance enhancement, upto
  10X as fast as default DynamoDB settings, allowing response times to decrease
  from milliseconds to microseconds.
- 5 minutes TTL for cache by default.
- DAX deployment can start with a multi-node cluster, containing a minimum of 3 nodes
  which you can quickly and easily modify and expand reaching a maximum of 10 nodes
  which could be 1 primary and 9 read replicas.
- DAX is a separate entity to DynamoDB and it sits outside of DynamoDB and is placed
  within your VPC.
- Writes go through DAX to DynamoDB.
- A DAX client is required to allow EC2 instances to interact with DAX cluster.
  This client then intercepts with and directs all DynamoDB API calls from your
  client to your new DAX cluster endpoint where the incoming request is then load
  balanced and distributed across all the nodes in the cluster.

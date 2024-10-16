# Brief document on Amazon ElastiCache Services.

## Introduction:

- Allows you to deploy, scale and operate open-source in-memory data stores in the cloud.
- This service improves the performance through caching, where web applications
  allow you to retrieve information from fast managed in-memory datastore rather than
  relying on slow disk based solutions.
- Helps makes your application stateless.
- ElastiCache supports both MemeCached and Redis engines.
- Users can be authenticated using Redis-Auth.
- Cache must have an invalidation strategy to make sure only the most current data is used.

## Amazon ElastiCache for MemeCached:
  - A high performance, sub-millisecond latency Memecached-compatible. It is in-memory, key-value store service, that can either be used as a cache.
  - Multi-node for partitioning of data (Known as Sharding)
  - No high availability
  - No persistence.
  - No backup and restore features.
  - Use Cases:
    - Session Store
    - Caching

## Amazon ElastiCache for Redis:
  - An in-memory data store designed for high performance and again providing sub-millisecond latency on a huge scale to real-time applications.
  - Support Multi-AZ with auto failover.
  - Read replicas to scale reads and high-availability.
  - Data durability, backup and restore features.
  - ElastiCache gives option to create upto 5 read replicas.
  - Redis Sorted sets guarantees both uniqueness and elemental ordering. (Useful in gaming leaderboards)
  - Use Cases:
    - Caching
    - Session store
    - Gaming Leaderboards
    - Chat and Messaging
    - Machine Learning
    - Queues
    - Geo-Spatial
    - Media Streaming
    - Real-Time Analytics.

## Components of ElastiCache:
  - **Nodes:**
    A fixed size, chunk of secure, network attached RAM essentially the building
    block of ElastiCache service and supports cluster.
  - **Shard:**
    Redis Shard (node group) a group of upto 6 ElastiCache nodes.
  - **Cluster:**
    A Redis Cluster is a group of 1-90 Shards depending on if cluster mode is enabled
    or disabled. Data is then partitioned across all of the Shards in a cluster.

### ElastiCache - Cache security:
- Do not support IAM Authentication
- IAM policies in ElastiCache is only used for AWS API-level security.
- **Redis AUTH**
  - You can set a password/token when you create the REDIS cluster.
  - Support SSL for in-flight encryption
- **Memecached:**
  - Support SASL based authentication.

### Patterns for ElastiCache:
- **Lazy Loading:**
  All the read data is cached, the data can become stale in cache.
- **Write Through:**
  Adds/update data in the cache when written to the DB (no stale cache)
- **Session Store:**
  Store temporary data in the cache (use TTL feature for session expiry)

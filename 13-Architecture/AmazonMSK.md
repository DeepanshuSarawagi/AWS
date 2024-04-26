# Amazon MSK

## Introduction:

- Managed streaming service for Apache Kafka (Amazon MSK).
- Alternative to Amazon Kinesis.
- Fully managed Apache Kafka cluster on AWS.
  - Allow you to perform CRUD operations on cluster.
- MSK creates and manages Kafka broker nodes and Zookeeper nodes.
- Automatic recovery from common Apache Kafka failures.
- Data is stored on EBS volumes for as long as one wants.

### MSK Serverless

- Run Apache Kafka on MSK without managing the capacity.
- MSK automatically provisions resources and scales compute and storage.

### Reference Architecture:

![MSK Architecture Solution](https://docs.aws.amazon.com/images/wellarchitected/latest/analytics-lens/images/streaming-data-analytics-reference-architecture.png)

[Referenced AWS Blog](https://docs.aws.amazon.com/wellarchitected/latest/analytics-lens/reference-architecture-2.html)

### Amazon Kinesis Data Streams vs. Amazon MSK:

| Kinesis Data Streams                      | Amazon MSK                                           |
|-------------------------------------------|------------------------------------------------------|
| 1 MS message size limit                   | 1 MB default, configurable to higher limit Ex. 10 MB |
| Data Streams with Shards                  | Kafka topics with partitions                         |
| Scalability - Shard splitting and Merging | Can only add partitions to a topic                   |
| TLS In-flight encryption                  | PLAINTEXT or TLS In-flight encryption                |
| KMS for encryption at rest                | KMS for encryption at rest                           |

### Amazon MSK Consumers:

- Kinesis Data Analytics for Apache Flink
- AWS Glue
- Lambda
- EC2

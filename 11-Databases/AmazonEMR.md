# Amazon EMR:

## Introduction:

- EMR helps creating Hadoop Clusters to analyze and process vast amount of data.
- The cluster can be made of 100s of EC2 instances.
- Supports Apache Spark, Flink, Presto, Hive, HBase..
- EMR takes care of all the provisioning and configuration of EC2 instances.
  - Configuration required for Hadoop clusters is done by EMR.
- Auto-Scaling with CloudWatch.
- **Use Cases:**
  - Data Processing
  - Machine Learning
  - Wed Indexing
  - Big Data

## EMR Integrations:

- EMR cluster is provisioned in single AZ.
- All EC2 instances are attached with EBS volumes called as HDFS (Hadoop Distributed File System).
  - This HDFS gives temporary storage.
  - Gives high performance for your temporary storage.
- However, if we need long storage/ retention of data then we need to use EMRFS.
  - This EMRFS natively integrates with S3.
- We can also run Apache Hive on EMR which directly reads data from DynamoDB table.
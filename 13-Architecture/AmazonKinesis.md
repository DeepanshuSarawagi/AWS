# Document explaining the components and architecture of Amazon Kinesis service

- Kinesis is a managed `data streaming` service.
- Amazon Kinesis was designed to address the complexity and cost of streaming data
  into AWS cloud.
- Kinesis makes it to easy to collect, process and analyze data from various data
  streams such as Event logs, IoT devices, Social media feeds, Click stream data,
  Application data in real time or near time.
- Kinesis contains four services such as Video Streams, Data Streams, Data Firehose
  and Data Analytics.
- Amazon Kinesis Video Stream is used to do stream processing on binary encoded data
  such as audio and video.
- Data is automatically replicated synchronously to 3AZs.
- Low latency streaming ingest at scale.
- Streams are divided into Shards / Partitions.
  - Shards should be provisioned in advance.
  - Producers will produce data to a Shard and consumers will consume it from Shard.
  - Data retention is 24 hours by default and can go upto 365 days.
- Amazon Kineses Data Stream, Kinesis Data Firehose and Kinesis Data Analytics is
  used to do stream processing on base64 encoded data such as logs, click stream
  data, social media feeds, financial transactions, in-game player activity, geospatial
  services and telemetry from IoT devices.



## Layers of Streaming:

There are 5 layers of streaming.

### Source:
  - Mobile Device
  - Metering
  - Click Streams
  - IoT sensors
  - logs

### Stream Ingestion:

  The data for streaming can be injested using following services/tools
  - Amazon Kinesis Agent
  - Amazon Kinesis Producer Library
  - Amazon SDK

### Stream Storage:

The data which is stored in this layer is done by Amazon Kinesis Data Streams which is called as Producer.

 - Inside Kinesis Data Streams, data can be stored but it cannot be modified. Hence,the data is immutable. However, the data can expire.
 - As of today, the Kinesis Data Stream can store data starting from 24 hours upto 365 days.
 - It is a high speed storage buffer.
 - Multiple applications at the same time can consume from same stream.
 - Real time processing with scale of throughput.

### Stream Processing:
The Stream Processing layer is managed by the Consumers.
  - Amazon Kinesis Data Analytics
  - Amazon Kineses Consumer Library
  - Amazon Kineses Data Firehose

### Destination:
Consumers send data to the destination layer which can be one of the following
  - Amazon S3
  - Amazon Redshift
  - Amazon Elasticsearch service
  - Splunk

## Amazon Kineses Video Stream:
- Designed to stream binary encoded data into AWS from millions of sources (audio
  and video but it can be any binary-encoded time series data)
- Underlying data is stored in S3.
- Cannot output the stream data directly to S3.
  - Need to build a custom solution for it.
- **Consumers:**
  - Consumed by Ec2 instances for real time analysis or in batch.
  - Can leverage the Kinesis video stream parser library.
  - Integration with Amazon Rekognition for facial recognition.
  - Example architecture below.

![kvs-rekognition](https://d2908q01vomqb2.cloudfront.net/f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59/2021/02/12/ML-2176-1.png)

## Amazon Kineses Data Stream:
- A highly customizable data streaming solution available from AWS.
- Highly customizable: All parts involved with stream processing - data ingestion,
  monitoring, scaling, elasticity and consumption are done programmatically when
  creating a stream.
- AWS will provision resources when requested.
- Does not have the ability to Auto scaling.
- To facilitate the development, management and usage of data stream, AWS provides
  APIs, AWS SDKs, AWS CLI, Kinesis agent for Windows and Linux.
- Producers put data records into Kinesis Data Stream.
- Producer can be created using SDKs, APIs or Kinesis Producer Library.
- Each Shard can give 1MBPS or 1000 messages per second.
- A Kinesis Data Stream is a set of shards. A shard contains a sequence of data records.
- Data Records are composed of a sequence number, a Partition key and a Data Blob
  and they are stored as a immutable sequence of bytes.
- Consumers - Amazon Kineses Data Stream Applications get records from Kinesis Data
  stream and process them.
- Consumers can be created using SDKs, APIs or Kinesis Client Library.
  - `For classic consumers`, in shared consumption - 2 MB/s per shard across for all consumers.
    - 5 API calls per second per SHARD across all consumers.
  - `In enhanced fan-out consumption` - 2MB/s per shard per consumer.
    - No API calls needed. (Push model)
- Once data is entered into Kinesis, it cant be deleted.
- Data storage from 1 to 365 days.
- Supports replay capability.
- KDS provides ordering of records, as well as the ability to read and/or replay records in the same order to
  multiple Amazon Kinesis Applications.

### There are two types of Consumers:
  - **Classic:**
    - Pulls data from the stream.
    - Also known as Polling mechanism.
    - There is a limit to number of times and amount of data, consumers can pull from the shard.
  - **Enhanced Fan-Out:**
    - Push Method: Consumer can subscribe to a shard.
    - Results in data being pushed from the shard into a consumer application.
    - Since polling is removed, Shard limits are removed, every consumer gets provisioned
      throughput of 2 MBs per second per shard.

### Capacity Modes:

  - **Provisioned Mode:**
    - You choose the number of shards provisioned, scale manually or using API.
    - You pay per shard provisioned per hour.
  **On demand Mode:**
    - No need to manage or provision the capacity.
    - Default capacity of 4 MB/s or 4000 messages/second
    - Scales automatically based on observed throughput peak of last 30 days.
    - Pay per stream per hour and data in/out in GB.

### Use Cases:

  AWS recommends Amazon Kinesis Data Streams for use cases with requirements that are similar to the following:

  - Routing related records to the same record processor (as in streaming MapReduce). For example, counting and aggregation
    are simpler when all records for a given key are routed to the same record processor.
  - Ordering of records. For example, you want to transfer log data from the application host to the processing/archival
    host while maintaining the order of log statements.
  - Ability for multiple applications to consume the same stream concurrently. For example, you have one application that
    updates a real-time dashboard and another that archives data to Amazon Redshift. You want both applications to consume
    data from the same stream concurrently and independently.
  - Ability to consume records in the same order a few hours later. For example, you have a billing application and an
    audit application that runs a few hours behind the billing application. Because Amazon Kinesis Data Streams stores
    data for up to 365 days, you can run the audit application up to 365 days behind the billing application.

## Amazon Kinesis Data Firehose:
- Data Firehose being fully managed is a streaming delivery service for data.
- Ingested data can be dynamically transformed, scaled automatically and can be
  automatically delivered to a data store.
- Following producers can produce data into Kinesis Data Firehose:
  - Applications
  - KPL Client
  - SDK
  - Kinesis Agent
  - Kinesis Data Streams
  - AWS IoT
  - AWS CloudWatch Logs and Events
- Not a streaming storage layer in the way that Data stream is.
- It uses Producers to load data into streams in batches and once inside a stream, it
  delivers data into a data store.
- Unlike Data Streams, Data Firehose buffers incoming streaming data before delivering
  data to its destination. The buffer size and buffer interval is chosen when creating
  delivery stream.
- The buffer size is in megabytes and the ranges can vary depending upon the destination.
- The buffer size has to be a minimum of 32MB in size and maximum of 128MB.
- The buffer interval can vary between 60 seconds to 900 seconds.
- Essentially, data buffers inside the stream, and it leaves the buffer either when its size is full or when buffer 
  interval expires. 
- For this reason, Kinesis Data Firehose is considered as a near real-time streaming solution.
  - Why near-real time?
    - Buffer Interval - 0 seconds or upto 900 seconds.
    - Buffer size: Min 1MB
- Kinesis Data Firehose can deliver data to four data stores - 
  - Amazon S3, 
  - Amazon Redshift, 
  - Amazon Elasticsearch
  - Now, it can also deliver data using generic HTTP endpoints and 3rd party solution providers such as 
    - MongoDB, 
    - DataDog, 
    - New Relic.
- Can send failed or all data to a backup S3 bucket.
- Automatic Scaling is possible in Data Firehose.
- It can also transform incoming data from JSON format to Apache Parquet or Apache ORC.
- Parquet and ORC are columnar data formats that save space and has faster queries
  compared to row-oriented data format like JSON.
- It can also invoke Lambda functions to transform incoming source data and deliver
  the transformed data to its destination.
- There is no Free tier for using Kinesis Data Firehose. Costs are only incurred when
  data is inside a Firehose stream. There is no bill for provisioned capacity, but only
  billed for used capacity.
- Doesn't support replay capability.

### Kinesis Data Firehose Delivery Diagram:

![Delivery Diagram](https://docs.aws.amazon.com/images/firehose/latest/dev/images/fh-flow-rs.png)

For Splunk destinations, streaming data is delivered to Splunk, and it can optionally be backed up to your S3 bucket concurrently.

![Splunk Delivery Diagram](https://docs.aws.amazon.com/images/firehose/latest/dev/images/fh-flow-splunk.png)

### Firehose buffer sizing:

- Firehose accumulates records in a buffer
- The buffer is flushed based on time and size rules.
- If the `Buffer Size` has reached example - 32 MB in size, then it is flushed.
- Or if the `Buffer Time` has reached example - 1 minute, then it is flushed.
- Firehose can automatically increase the buffer size to increase the throughput.
  - High Throughput => Buffer Size will be hit. 
  - Low Throughput => Buffer Time will be hit.

Note:

: If real time flush from Kinesis Data Streams to S3 is needed, use Lambda. Data Firehose will cost a lot more.

### Exam Tip:

| Dimension                 | Kinesis Data Stream                                                                 | Kinesis Data Firehose                                                                              |
|---------------------------|-------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| Purpose                   | Low latency streaming service for scale                                             | Data Transfer Service to load data into S3, Redshift, Opensearch, 3rd party tools                  |
| Message propagation delay | Real time ~200 ms latency for classic and ~70 ms for enhanced fanout                | Near real time, depends on Buffer Size and Buffer Time                                             |
| Provisioning              | Managed provisioning                                                                | Fully managed service                                                                              |
| Scaling                   | Manual scaling                                                                      | Automatic Scaling                                                                                  |
| Data Storage              | Configurable upto 1 to 365 days                                                     | Does not provide Data storage                                                                      |
| Replay capability         | Supports replay                                                                     | Does not replay capability                                                                         |
| Producers                 | Need to write code for producers, supports SDK, KPL, Kinesis Agent, CloudWatch, IoT | Need to write code for producers, supports SDK, KPL, Kinesis Agent, CloudWatch, IoT                |
| Consumers                 | Open ended. Supports multiple consumers and destinations. Supports KCL and Spark    | Close ended. Handled by Firehost and supports limited destinations. Does not support KCL and Spark |

## Amazon Kinesis Data Analytics:
- Kinesis Data Analytics has the ability to read the data from stream in real-time
  and perform aggregation and analysis while data is in motion.
- It does this by leveraging SQL queries, or with Apache Flink using Java or Scala
  to perform time-series analytics, feed real time dashboards and create real-time
  metrics.
- When using Data Firehose with Data Analytics, data can only be queried using SQL.
- Apache Flink with Java or Scala are only available for Kinesis Data Streams.
- Kinesis Data Analytics cannot directly ingest data from the source as it ingests data either from Kinesis Data
  Streams or Kinesis Data Firehose

### Use cases
- **Streaming ETL:** select columns, make simple transformations, on streaming data
- **Continuous metric generation:** live leaderboard for a mobile game
- **Responsive analytics:** look for certain criteria and build alerting (filtering)

### Features
- Pay only for resources consumed (but it's not cheap)
- Serverless; scales automatically
- Use IAM permissions to access streaming source and destination(s)
- SQL or Flink to write the computation
- Schema discovery
- Lambda can be used for pre-processing


## References:

Here are some great architectural patterns discussed at length. Refer to AWS blogs below.

1. [Architectural patterns for real time analytics](https://aws.amazon.com/blogs/big-data/architectural-patterns-for-real-time-analytics-using-amazon-kinesis-data-streams-part-1/)
2. [Amazon Kinesis Architecture](https://aws.amazon.com/blogs/architecture/category/analytics/amazon-kinesis/)
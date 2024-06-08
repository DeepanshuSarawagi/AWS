# Overview of S3 - Simple Storage Services

## Introduction:
- Amazon S3 supports the largest file size upto 5TB.
- The service operates on object storage system.
- S3 is a regional service. While uploading the data, we are required to specify the
  location in which AWS region we want to upload the data.
- It will then upload the data multiple times across multiple AZs thereby increasing the durability , availability and reducing the latency.
- Application can achieve at least 3,500 PUT/COPY/POST/DELETE or 5,500 GET/HEAD requests per second per prefix in a bucket.

- Amazon S3 offers durability of 99.999999999%
- The availability of S3 objects depends on the storage class used, therefore, it ranges from 99.5% to 99.99%


To store data in Amazon S3, we need to define a S3 bucket.
the name of the bucket should be unique. Since the buckets are created globally,
this is because of the flat address space.

By default, an AWS account can have 100 buckets and this is a soft limit.

## S3 CORS:
-  CORS is abbreviation for Cross Origin Resource Sharing.

## S3 Default Encryption:
-  We can enable the default encryption option while creating/modifying a bucket.

## S3 Cross Region and Same Region Replication:

### CRR:
  - Versioning must be enabled in both source and destination bucket.
  - Asynchronous replication happens between two different region buckets.
  - Buckets can be in different AWS accounts as well.
  - Must give proper IAM permission to S3.
  - After activating, only new objects will be replicated.
  - For replicating existing objects in the bucket, we can use S3 Batch Replication.
  - For DELETE options: we can replicate delete marker of the objects from source to target bucket.
  - There is no chaining of replication.
  - Permanent delete on objects are not replicated.

### Replication Time Control:
- Replicates most objects that you upload to S3 within seconds and 99.99% of the objects within 15 mains.

## S3 Pre-Signed URLs:
-  Can generate pre-signed URLs using SDK or CLIs.
-  They have a default TTL of 3600 seconds. It is possible to change the timeout using following argument --expires-in
   [TIME_IN_SECONDS] argument.
-  Users given a pre-signed URL inherit the permissions of user who generated the URL.
  - Use cases:
    - Allow only logged-in users to download a premium video on S3 bucket.
    - Allow an ever-changing list of users to download files by generating URLs dynamically.
    - Allow a user temporarily to upload a file in S3 bucket in precise location.

## S3 baseline performance:
-  Your application can achieve at least 3500 PUT/DELETE/COPY/POST per second and 5,500 GET/HEAD requests per second
   per prefix in a bucket.
- If a bucket has 4 folders, then we can say it has 4 prefixes and the total GET/HEADs/second would be 22,000.
- Scales high request rate with latency of just 100-200 ms.

## S3 Bytes ranges fetch:
-  Parallelize GETs by requesting specific Bytes ranges of the file.
-  Better resilience in case of failures.
-  Used for speeding up downloads
-  Another use case: Can be used to retrieve only partial file.

## S3 Select and Glacier Select:
-  Using S3 select we can retrieve fewer data using SQL by performing server side filtering
-  Can filter by rows and columns.
-  Less network transfer, less CPU cost client-side
-  Upto 400% faster and 80% cheaper

## S3 Event Notifications:
-  Any object related notification which can be sent to SNS, SQS, Lambda and Amazon EventBridge.

### Event Notifications with Amazon EventBridge:
- All the S3 events are going to be shared with EventBridge.
- Then we can configure complex set of rules to send events to 18 AWS services as destinations.

## S3 Requester Pays:
-  With Requester Pays bucket, the requester will pay for downloading objects from bucket, rather than bucket owner.
-  Here, Requester will pay for the networking cost and owner will only bear storage cost.
-  The requester will have to a AWS authenticated user so that amazon can bill them.

## Amazon Athena:
-  Serverless query service to perform analytics on S3 objects.
-  Amazon Athena can then be integrated with Amazon QuickSight for some dashboards.
-  Pricing is pay per query or $5 per TB for data scanned.
- Supports different formats such as 
  - Parquet
  - JSON
  - CSV
  - ORC
  - AVRO
- Pricing: $5.00 per TB of data scanned.
- **Use cases:**
  - BI
  - Analytics
  - Reporting
  - Analyze and query VPC flow logs, ELB logs, CloudTrail trails
- **Exam tip:** Any time analyze data on S3 using SQL with serverless solution, use Athena

### Athena - Performance Improvement:
-  Use compressed or columnar data for cost savings.
- Apache Parquet or ORC is recommended.
- Use Glue to convert data into Parquet or ORC.
- Partition datasets in S3 for easy querying on virtual columns.
- Use larger files > 128 MB to minimize overhead as compared to many smaller files.

### Amazon Athena - Federated Query:

- Allows you to run SQL queries across data stored in relations, non-relational, objects, and custom data sources (AWS or on-premises)
- Use Datasource connectors that run on Lambda to run federated queries on (CLoudWatch logs, RDS, DynamoDB)

![Federated Query](https://d2908q01vomqb2.cloudfront.net/b6692ea5df920cad691c20319a6fffd7a4a766b8/2019/11/27/AthenaQueryPic1.png)

[AWS Reference link](https://aws.amazon.com/blogs/big-data/query-any-data-source-with-amazon-athenas-new-federated-query/) 
for further reading.

## S3 Object Lock:
- Adopt a WORM model.
- Block an object version deletion for a specified amount of time.

## Glacier Vault Lock:
-  Adopt a WORM (Write Once Read Many) policy.
-  Lock the policy for future edits.
-  Helpful for data and compliance retention.
-  Once the data is written to Glacier Vault, it cannot be tampered when this policy is enabled.

## S3 Multi-part upload -- Remove incomplete parts:
- We can setup a lifecycle policy to see if there is an abortion/incomplete multi-part upload file, then remove it from the bucket.
- Sample lifecycle rule looks like this.

```json
{
  "Rules": [
    {
      "ID": "s3-mpu-incomplete-removal",
      "status": "Enabled",
      "Filter": { "Prefix":  "" },
      "AbortIncompleteMultipartUpload": {
        "DaysAfterInitiation": 7
      }
    }
  ]
}
```
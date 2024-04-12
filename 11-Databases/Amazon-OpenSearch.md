# Brief document on Amazon OpenSearch

- Successor of Amazon ElasticSearch service.
- Managed version of OpenSearch.
- With OpenSearch you can search data on any field, even partially matches.
- OpenSearch also has some usage for Big Data applications.
- Can provision cluster of instances.
  - There is no serverless offering.
- Can be integrated with Amazon Kinesis Data Firehose, AWS IoT and Amazon CloudWatch logs.
- Security through Cognito, IAM, KMS and SSL and VPC.
- Comes with OpenSearch dashboard.
- Can be in Multi-AZ.
- Pay per every node provisioned.

## OpenSearch + OS Dashboards + Logstash

- **OpenSearch (ex ElasticSearch):** 
  - provide search and indexing capability
  - You must specify instance types, multi-AZ, etc
- **OpenSearch Dashboards (ex Kibana):**
  - Provide real-time dashboards on top of the data that sits in OpenSearch
  - Alternative to CloudWatch dashboards (more advanced capabilities)
- **Logstash:**
  - Log ingestion mechanism, use the "Logstash Agent"
  - Alternative to CloudWatch Logs (you decide on retention and granularity)
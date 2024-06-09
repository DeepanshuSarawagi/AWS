# S3 Access Points

S3 Access points can be used to restrict access to certain bucket objects. This can be achieved by creating an access point
policy which is similar to bucket policy and is going to grant read/write access.

- Access Points simplify security management for S3 buckets.
- Each Access Point has:
  - Its own DNS names (Internet origin or VPC origin)
  - An access point policy

![S3-Access-Points](https://d2908q01vomqb2.cloudfront.net/e1822db470e60d090affd0956d743cb0e7cdf113/2020/10/12/One-example-of-how-you-can-use-S3-Access-Points-to-manage-access-to-shared-datasets-on-Amazon-S3..png)

## S3 - Access Points - VPC origin:

- We can define the access point to be accessible only from within the VPC.
- To get access to this VPC origin, we must create a VPC endpoint (Interface or Gateway) to access the Access Point.

## S3 - Multi-region access points:

- Provide a global endpoint that span S3 buckets in multiple AWS regions.
- Dynamically route requests to nearest S3 buckets. (Low latency)
- Bidirectional S3 buckets replication rules are created to keep buckets in sync across the regions.
- **Failover control** - Allows you to shift request to buckets in different AWS regions within minutes.

![Multi-region-access-points-failover-control](https://d1.awsstatic.com/reInvent/reinvent-2022/simple-storage-service/failover-hiw-diagram.a70520851388826ee6cfe43a67b7ee0020f01996.png)
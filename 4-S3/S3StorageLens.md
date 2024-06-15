# S3 - Storage Lens

## Introduction:
- Understand, analyze, optimize storage across entire AWS Organization.
- Discover anomalies, identify data cost efficiency and apply data protection best practices across entire AWS Organization.
- Aggregate data for Organization, Accounts, region, buckets or prefixes.
- Can be configured to export metrics daily to an S3 bucket.

## Storage Lens - Metrics:

### Summary Metrics:
- General insights about your S3 buckets.
- Gives insights such as `StorageBytes`, `ObjectCount`..
- **Use case:** Identify the fastest growing buckets and prefixes.

### Cost-Optimization metrics:
- Provide insights to manage and optimize your storage costs.
- `NonCurrentVersionStorageBytes`, `IncompleteMultipartUploadStorageBytes`..
- **Use cases:** Identify buckets with incomplete multi-part files uploaded older than 7 days, identify files in buckets which
  can be transitioned to lower cost storage class.

### Data Protection metrics:
- Provide insights for data protection features.
- `VersioningEnabledBucketCount, MFADeleteEnabledBucketCount, SSEKMSEnabledBucketCount, CrossRegionReplicationRuleCount`..
- **Use case:** Identify buckets that aren't following data protection best practices.

### Access Management metrics:
- Provide insights for S3 objects ownership.
- `ObjectOwnershipBucketOwnerEnforcedBucketCount`
- **Use case:** Which object ownership settings your buckets currently use.

### Event metrics:
- Provide insights for S3 event notifications.
- **Use case:** `EventNotificationEnabledBucketCount`

### Performance metrics:
- Provide insights for S3 Transfer Acceleration buckets.
- `TransferAccelerationEnabledBucketCount`

### Activity metrics:
- Provide insights about how your storage is requested.
- `AllRequests, GetRequests, PutRequests, ListRequests, BytesDownloaded`

### Detailed status code metrics:
- Provide insights for HTTP status codes.
- `2000OKStatusCount, 403ForbiddenErrorCount, 404NotFoundErrorCount`

## Storage Lens. Free vs. Paid:

### Free tier:
- Automatically available for customers.
- Contains around 28 usage metrics.
- Data is available for queries for 14 days.

### Advanced metrics and recommendations:
- Additional paid metrics and filters.
- **Advanced Metrics:** Advanced Cost Optimization, Advanced Data Protection, Status Codes, Activity insights.
- **CloudWatch Publishing:** Access metrics in cloudwatch without additional costs.
- **Prefix aggregation:** Collect metrics at prefix level.
- Data is available for queries for 15 months.
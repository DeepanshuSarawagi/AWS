# Different types of storage classes

## S3 Standard:
  - High Throughput
  - Low latency
  - Frequent access to data
  - Durability is 99.999999999%
  - Availability is 99.99%
  - SSL to encrypt data in transit and at rest
  - Lifecycle rules to automate data storage management

## S3 Intelligent Tier
  - Ideal for data which is not frequently accessed.
  - There are two types of classes within this type of storage class.
    - Infrequent access
    - Frequent access
    - Archive instant access
  - If the data is not accessed for more than 30 days, then Amazon S3 will automatically
    move the data to the Infrequent access storage class thereby optimizing storage costs.
  - Frequent and Infrequent access
  - Availability is 99.9%
  - Minimum storage duration of 30 days.
  - Object will be moved to Archive instant access tier if it is not accessed for 90 days.
  - Archive access tier - Configurable from 90 to 700+ days
  - Deep Archive access tier - Configurable from 180 to 700+ days

## S3 Standard Infrequent Access
  - Much like S3 Intelligent Tier Infrequent access.
  - Ideal for data which is not accessed very frequently.
  - Minimum storage duration of 30 days.

## S3 One-Zone Infrequent Access
  - Ideal Infrequent access
  - Durability is 99.999999999% but across a single availability zone.
  - 20% storage cost reduction when compared to S3 Standard
  - Availability is 99.5%
  - Minimum storage duration of 30 days.

## S3 Glacier Instant Retrieval:
  - Millisecond retrieval, great for data accessed in once a quarter.
  - Minimum Storage duration of 90 days.

## S3 Glacier Flexible Retrieval:
  - Doesn't offer high Throughput and low latency
  - Data is not accessible immediately like other S3 storage classes.
  - Referred to as Cold Storage ideally suited for long term backups and archival requirements.
  - Durability is 99.999999999%.
  - Retrieval of data will take several hours hence data is not accessible instantly.
  - Data is stored in Vaults. We need to specify a region in which region the vaults should reside.
  - S3 Glacier has different Retrieval options and pricing differs for each option.
### Expedited: 
- The data retrieval should be less than 250 MB, and it is typically made accessible within 2-5 minutes. 
- This is the most expensive form of retrieval. 
- Cost is $0.03 per GB and $0.01 per request. 
- Expedited — There are two types of Expedited retrievals: 
  - **On-Demand:**
    - On-Demand requests are similar to EC2 On-Demand instances and are available most of the time.
  - **Provisioned:**
    - Provisioned requests are guaranteed to be available when you need them, which is recommended for a DR plan.
    
### Standard:  
The data retrieval can be of any size and data will be made accessible in 3-5 hours. 
This is second most expensive retrieval type. Cost is $0.01 per GB and $0.05 per 1000 request.

### Bulk:      
- The data retrieval should be Petabytes in size, and it is made accessible somewhere between 5-12 hours. 
- Cheapest retrieval option. 
- Cost is $0.0025 per GB and $0.025 per 1000 request.

- Data in Glacier can be stored by creating vaults using Glacier console.
- We can create APIs, SDKs, CLIs to upload the data in the vaults.
- We need to create retrieval vaults as well to access the data.
- Minimum storage duration of 90 days.

## S3 Glacier Deep Archive:
  - Much like Glacier.
  - Standard Retrieval of data will be within 12 hours.
  - Bulk retrieval of data will be within 48 hours.
  - Minimum storage duration of 180 days.

## Comparison table:

| **Metrics**                      | **Standard**    | **Intelligent-Tier** | **Standard IA**  | **One Zone-IA**  | **Glacier Instant Retrieval** | **Glacier Flexible Retrieval** | **Glacier Deep Archive** |
|----------------------------------|-----------------|----------------------|------------------|------------------|-------------------------------|--------------------------------|--------------------------|
| **Durability**                   | 99.99999999999% | 99.99999999999%      | 99.99999999999%  | 99.99999999999%  | 99.99999999999%               | 99.99999999999%                | 99.99999999999%          | 
| **Availability Zone**            | >=3             | >=3                  | >=3              | 1                | >=3                           | >=3                            | >=3                      | 
| **Min. Storage Duration Charge** | None            | None                 | 30 Days          | 30 Days          | 90 Days                       | 90 Days                        | 180 Days                 |
| **Min. Billable Object Size**    | None            | None                 | 128 KB           | 128 KB           | 128 KB                        | 40 KB                          | 40KB                     |
| **Retrieval Fees**               | None            | None                 | Per GB Retrieved | Per GB Retrieved | Per GB Retrieved              | Per GB Retrieved               | Per GB Retrieved         | 
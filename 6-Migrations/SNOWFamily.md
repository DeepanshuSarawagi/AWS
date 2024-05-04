# AWS SNOW Family

Highly secure portable devices to collect and process data at the edge and migrate data into and out of AWS.

There are several types of devices available for different use cases:

**Data Migration:**
- Snowcone
- Snowball Edge
- Snowmobile

**Edge Computing:**
- Snowcone
- Snowball Edge

## Data Migration:

If it takes over a week to transfer over a network, use the Snowball devices to migrate data.

### Snowball Edge:

- Physical data transport solution: move TBs or PBs of data in or out of AWS
- Alternative to moving data over the network (and paying network fees)
- Pay per data transfer job
- Provide block storage and Amazon S3-compatible object storage
- **Snowball Edge Storage Optimized:**
  - 80 TB of HDD capacity for block volume and S3 compatible object storage
- **Snowball Edge Compute Optimized:**
  - 48TB of HDD or 28TB of NVMe capacity for block volume and 53
- Use cases: large data cloud migrations, DC decommission, disaster recovery

### Snowcone and Snowcone SSD:

- Small, portable computing, anywhere, rugged & secure,
- withstands harsh environments
- Light (4.5 pounds, 2.1 kg)
- Device used for edge computing, storage, and data transfer
- Snowcone - 8 TB of HDD Storage Snowcone SSD - 14 TB of SSD Storage
- Use Snowcone where Snowball does not fit (space-constrained environment)
- Must provide your own battery / cables
- Can be sent back to AWS offline, or connect it to internet and use AWS DataSync to send data

### Snowmobile:

- Transfer Exabytes of data. 1EB = 1000PB.
- Each Snowmobile has 100PB of capacity.

## Edge computing:

- Process data while its being created on an edge location.
- These locations have limited or no internet access.
- We setup Snowball Edge or Snowcone device for edge computing.
- **Use cases:**
  - Preprocess data
  - ML at the edge.
  - Transcoding media streams.
- Eventually we can ship back the device to AWS for transferring processed data to S3 if required.

### SNOW Family:

- Snowcone & Snowcone SSD (smaller)
- 2 CPUs, 4 GB of memory, wired or wireless access
- USB-C power using a cord or the optional battery
- **Snowball Edge - Compute Optimized**
  - 104 vCPUs, 416 GiB of RAM
  - Optional GPU (useful for video processing or machine learning)
  - 28 TB NVMe or 42TB HDD usable storage
  - Storage Clustering available (up to 16 nodes)
- **Snowball Edge - Storage Optimized**
  - Up to 40 vCPUs, 80 GiB of RAM, 80 TB storage
- All: Can run EC2 Instances & AWS Lambda functions (using AWS loT Greengrass)
- Long-term deployment options: I and 3 years discounted
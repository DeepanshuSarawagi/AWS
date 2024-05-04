# Disaster recovery and high availability using AWS

- **Recovery Time Objective -** is the time required to recover from a disaster.
- **Recovery Point Objective -** is the acceptable amount of data measured in time.
  time when the system can be restored before the event of disaster. 
  - Let's say that RPO is 1 hour and a disaster has occurred at 12:00PM then, the data before RPO
    time i.e., 1 hour - 11 AM should be restored

### Backup/Restore:
- Like using AWS as a virtual tape library.
- Backup and recovery using AWS S3, Amazon Glacier, Amazon Storage Gateway.
- RTO is 8-24 hours.
- RPO - Could be upto 24 hours.
- What is the retention time for media.
- Security of archives.
- Regular testing.
- Cost is low.

### Pilot Light:
- Minimal version of environment running on AWS which can be lit up and expanded to
  full size from this pilot light.
- Services used are AMIs, Bootstrapping, EIPs, ELBs, CloudFormation, Amazon RDS.
- RTO is 4-8 hours.
- RPO is based on last snapshot last available.
- Cost is low.

### Warm standby:

- Scaled down version of fully functional environment always running.
- Services used are AMIs, Bootstrapping, EIPs, ELBs, CloudFormation, Amazon RDS.
- RTO is <4 hours.
- RPO is based on last data write if a master/slave in a Multi-AZ DB.
- Cost is Medium.

### Multi-Site:

- Fully operational version of fully functional environment always running either
  running off-site or in another region.
- Services used are All AWS services.
- RTO is <60 minutes.
- RPO is based on last data write if a synchronous DB in a Multi-AZ DB.
- Cost is High.

## Replication Considerations:
- Distance between the sites - Larger the distance are typically subject to more
  latency or jitter
- Available bandwidth - The length and variability of interconnections
- Data required by your application - The data required should be less than the
  available bandwidth
- Replication technology - The replication technology should be parallel so that
  it can use the network effectively

### Replication basics:

**Synchronous replication:**
- Atomic write update to multiple clusters in multiple AZs.

**Asynchronous replication:**
- Non-Atomic update happens to secondary as network and bandwidth permit.


## Data Storage Solutions in DR

### Using AWS S3 as data backup solution:
- Huge capacity to scale
- Highly durable
- Highly reliable
- Store data from 1Byte to 5TB
- Multiple security features
- Different storage classes offering different benefits

### S3 Standard:

- Availability: 99.99%
- Durability: 99.999999999%
- Data management capabilities which can move data to different storage class
  based on how frequently it is accessed.

### S3 Standard - Infrequently Accessed:

- Availability: 99.9%
- Durability: 99.999999999%

### Amazon Glacier:

- Stores data in archives
- Upto 40 TB in size.
- Archives are stored within vaults.
- Primarily used for data archiving.

- To reduce data retrieval latency, it is recommended to enable CRR - Cross Region Replication.
- Use Multipart upload to upload the data in S3 if the size of the object is > 100MB.

### Using AWS Snowball:
- Used to securely transfer large amounts of data in and out of AWS in Petabytes scale.
- Data can be transferred either from on-premise datacenter to S3 or vice-versa using
  a physical device known as Snowball.
- The Snowball appliance comes as a 50TB or 80TB storage device.
- The device is dust, water and tamper resistant.
- Built for high speed data transfer which is compatible using RJ45, SFP + Copper
  or SFP + Optical Fiber.
- Data is automatically encrypted using 256 bit encryption key.
- End to End tracking using E Ink shipping label.
- The Snowball appliance can be tracked using SNS or using AWS Management console.

## Using AWS Storage Gateway as data backup solution:

### File Gateway:
- Allows you to securely store your files as objects in S3.
- Ability to mount or map drives to a S3 bucket as if it was a share held locally.
- We can create a NFS filesystem to access S3 buckets which can be used to store files.
- A local cache of your most accessed file would also be created thereby reducing the
  latency and cost of your egress traffic.

### Stored Volume Gateway:
- Used to backup your local storage volumes to Amazon S3.
- Your entire data set remains on-premise ensuring low latency data access.
- Volumes created and configured within the storage gateway are backed up by S3
  and are mounted as iSCSI devices that your applications then communicate with.
- as data is written to these iSCSI devices, the data is actually written locally
  which is then asynchronously backed as EBS Snapshots to S3.
- A Stored volume gateway can provide maximum storage of 512 TiB.
- A storage buffer using on-premise storage is used as a staging point for data.

### Cached Volume Gateways:
- Primary data storage is provided by S3.
- Local data storage is used for buffering and a local cache for recently accessed
  data to help maintain low latency.
- The creation of these volumes are presented as iSCSI devices which can be mounted
  by application service.
- Total storage capacity of 1024 TiB per cached volume gateway.
- Snapshots of volumes stored on S3 as EBS snapshots which can be incrementally
  backed up thereby reducing the S3 storage costs.

### Gateway Virtual Tape Library:
- Allows you to backup data to S3 from your on-premise datacenter.
- Leverage Amazon Glacier for data archiving.

####   VTL Components:

- Storage Gateway: This is configured as a Tape Gateway acting as a VTL with
  a capacity of 1500 virtual tapes.
- Virtual Tapes: Virtual equivalent to physical tape cartridge with a capacity
  of 100 GiB - 2.5TiB. Data stored on VTs are backed up Amazon S3 and are
  visible in VTL.
- Virtual Tape Library: This is equivalent to physical tape library containing
  virtual tapes.
- Tape Drives: Each VTL comes with 10 Tape Drives which are then presented as
  iSCSI devices to your backup applications.
- Media Changer: A virtual device presented as iSCSI device to your backup
  applications that manages tapes between your Tape Drives and VTLs.
- Archive: This is equivalent to an off-site storage facility giving you
  the ability to archive tapes from your VTL to Amazon Glacier.

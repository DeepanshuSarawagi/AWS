# Amazon FSx

## Introduction:

- Provides a fully managed native Microsoft Windows Filesystems on AWS.
- Easily move and migrate windows workloads requiring file storage.
- The solution is built on windows server.
- Operates as shared file storage.
- Full support for
  - SMB protocol.
  - Active Directory.
  - Windows NTFS.
  - Distributed File System.
- Uses SSD storage for enhanced performance and throughput providing sub-milliseconds
  latencies.
- Pay for the amount of storage provisioned per month and uses the metric of GB/month.
- The price varies over single and multi-AZ deployments.
- Cost also varies for amount of throughput configured on MBps/Month. Also, the
  throughput cost variation between single and multi-AZ deployments.
- Takes incremental backups thereby optimizing the storage costs.
- Data deduplication thereby removing the duplication of files from the Backups
  thereby saving 80% of the cost.
- Scale upto 10s of GBs, millions of IOPs, and PB of data.
- Storage options are SSd and HDD.
- Can be accessed from on-premise using VPN or DirectConnect.
- Can be configured to be Multi-AZ.
- Data is backedup daily to S3.

### FSx for Lustre:
  - A fully managed file system designed for compute-intensive workloads such as ML and High Performance Computing (HPC).
  - Ability to process massive data sets.
  - Performance can run upto 100s of GB per second of throughput, millions of IOPS
    and sub-milliseconds latencies.
  - Integration with S3.
  - Supports cloud-bursting workloads from on-premises using Direct-Connect or VPN
    connections.
  - Scale upto 100s of GBs, millions of IOPs, and PB of data.
  - Storage options are SSd and HDD.
  - Can write the computations back to S3 using FSx.
  - Can be accessed from on-premise using VPN or DirectConnect.

#### FSx for Lustre - Data Lazy Loading:
- Any data processing job on Lustre with S3 as input data source can be started without Lustre doing full download of the
  dataset first.
- Data is lazy loaded; meaning only the data that has been processed is loaded. This helps in reducing costs and latency.
- Data is also loaded only once. Therefore you reduce requests costs to S3 bucket.
  
### FSx Filesystem deployment options:
  - **Scratch File System:**
    - Temporary storage
    - Data is not replicated
    - High Performance
    - Short term processing of data, optimize costs.
  - **Persistent File System:**
    - Long-Term Storage
    - Data is replicated within same AZ.
    - Replace failed files within minutes.
    - Long term processing or sensitive data.

### FSx for NetApp ONTAP:

- Managed NetApp ONTAP on AWS.
- Compatible with NFS, SMB, iSCSI protocol
- Move workloads running on ONTAP or NAS to AWS.
- Works with:
  - Linux
  - Windows
  - MacOS
  - EC2, EKS, ECS
  - VMWare cloud on AWS.
  - Amazon WorkSpaces and AppStream 2.0.
- Storage shrinks or grows automatically.
- Snapshot, Compression, Data De-duplication and replication feature available.
- Point in time instantaneous cloning.

### FSx for OpenZFS:
- Managed OpenZFS on AWS.
- File System compatible with NFS (v3, v4, v4.1, v4.2)
- Move workloads running on ZFS to AWS.
- Works with:
  - Linux
  - Windows
  - MacOS
  - EC2, EKS, ECS
  - VMWare cloud on AWS.
- Upto 1,000,000 IOPs and < 0.5ms latency.
- Snapshot, Compression and replication feature available.
- Point in time instantaneous cloning.
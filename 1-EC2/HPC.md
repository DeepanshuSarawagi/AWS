## HPC - High Performance Computing:

- Can create high performing number of instances in no time.
- You can speed up time to results by adding more time.
- You can pay only for the systems you have used.

**HPC can be used in following areas:**

- Genomics
- Computation chemistry
- Financial risk
- Machine Learning
- Weather prediction
- Deep Learning
- Autonomous driving

### Which services help HPC?

### Data Management and transfer:

- AWS Direct Connect:
    - Move GBs of data to cloud over private secure network.
- AWS Snowball and Snowmobile:
    - Move PB data to the cloud.
- AWS DataSync:
    - Move large amount of data between On-prem and S3, EFS and FSx for windows.

### Compute and Networking:

- EC2 instances:
    - CPU optimized
    - GPU optimized
- EC2 placement groups:
    - Cluster placement group can provide high network performance of up to 10gbps.
    - Same AZ, same rack

**How to enhance EC2 network performance further?**

- EC2 enhanced networking (SR-IOV)
    - Higher bandwidth, higher PPS - packets per second, lower latency
    - Option1: ENA - Delivers 100 Gbps.
    - Option2: Intel 82599 VF - Delivers upto 10 Gbps, LEGACY ENA
- EFA - Elastic Fabric Adapter:
    - Improved ENA dedicated for HPC, only works on Linux
    - Works best for tightly coupled workloads, inter-node communications
    - Leverages Message Passing Interface standard.
    - Bypasses the underlying Linux OS to provide low latency, reliable transport.

### Storage:

**Instance attached storage:**
- **EBS:** Scale upto 256,000 IOPS with io2 block express.
- **Instance store:** Scale to millions of IOPs, linked to EC2 instance, low latency.

**Network storage:**

- Amazon S3: Large blob, not a filesystem.
- EFS: Scale IOPs based on total size or use provisioned IOPs.
- Amazon FSx for lustre:
    - HPC optimized distributed filesystem, millions of IOPs.
    - Backed by S3.

### Automation and Orchestration:

**AWS Batch:**

- Supports multi-node parallel jobs, can run single job that span across multiple EC2 instances.
- Easily schedule jobs and launch EC2 instances simultaneously.

**AWS ParallelCluster:**
- Open source cluster management tool to deploy HPC on AWS.
- Configure with text files.
- Automate creation of VPC, subnets, cluster type and instance types.
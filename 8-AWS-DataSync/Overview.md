# AWS DataSync

- AWS DataSync is an Amazon service which can be used to transfer data from on-premises / other cloud
to AWS storage services such as S3 or EFS. Agent is needed.

- Move data from one AWS to other AWS service (S3, EFS< FSx). No agent is needed.
  - Not a continuous replication. It is a scheduled task.

- It is natively integrated with Amazon S3, Amazon EFS, Amazon FSx, Amazon CloudWatch, and AWS CloudTrail

AWS DataSync has the following capabilities

  - Migrate an NFS from an Amazon EC2 to Amazon EFS within the same AWS region.
  - Replicate a NFS from an Amazon EC2 in one AWS region to an Amazon EFS in
    another region for disaster recovery.
  - Migrate an Amazon EFS with no lifecycle management to a EFS with lifecycle
    management enabled. 
  - Filesystems with lifecycle management enabled will automatically move the files to a lower-cost infrequently 
    accessed storage class based on a predefined lifecycle policy.
  - Migrate an Amazon EFS from one performance mode to another performance mode
    within the same AWS region.
  - Replicate an Amazon EFS from one AWS region to a different Amazon EFS in a
    different AWS region for disaster recovery.
  - Replications tasks can be scheduled hourly, daily, weekly.
  - File permissions and metadata are preserved. (NFS POSIX, SMB..)


## AWS Data Exchange
- Find, subscribe to and use third-party data in the cloud.
- Once subscribed to data product, you can use the Amazon Data Exchange API to load the data directly into S3 and analyze
  it with wide variety of AWS Analytics and ML services.

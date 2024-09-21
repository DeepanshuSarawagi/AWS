# AWS Batch

## Introduction:

- Managing and computing batch computing workload within AWS.
- We can seamlessly create cluster of resources, which is highly scalable taking advantage of the elasticity in AWS.
- Optimized distribution of the workload.
- Provisioning, Monitoring and Maintaining of the clusters is taking care by AWS.
- No need to manage clusters, fully serverless.
- Schedule Batch jobs using Amazon EventBridge.
- Orchestrate batch jobs using Step Functions.

## AWS Batch components:

### Jobs

- Jobs can be a containerized application within an EC2 instance.
- Jobs can have different state such as Pending, Submitted, Running, Failed.

### Job Definitions
- These define specific parameters for the job themselves and can dictate
- how the job will run and with what configuration.
- How many vCPUs, which IAM roles and EBS volumes to use to run a job.

### Job Queues

- Jobs that are scheduled are placed into queue until they run.
- Possible to have multiple queues with different priorities.
- On Demand and Spot instances are supported by AWS Batch.
- AWS Batch will bid on your behalf for spot instances.

### Job Scheduling

- Typically it will run on a FIFO.
- Ensures that high priority queues are run first.

### Compute environments

- These are the environments containing the resource to carry out the job

**Managed Environments:** 
- The service will handle the provisioning, scaling and termination of Compute Instances.
  - This environments are then created as Amazon ECS cluster.
- All the instances launched within VPC.
- We just need to set the min and max CPU requirement and if we have opted for Spot instances, following instance will get launched.
  - m5.xlarge
  - c5.xlarge
  - r5.2xlarge
  
**Unmanaged Environments:** 
  - These environments are provisioned and managed by the customer. 
  - It gives greater customization but requires greater administration and maintenance.

## AWS Batch Multi-Node mode:
- Large scale, good for HPC.
- Leverages multiple EC2/ECS instances at the same time.
- Good for tightly coupled workloads.
- Does not work with spot instances.
- Works better if EC2 launch mode is cluster placement group.

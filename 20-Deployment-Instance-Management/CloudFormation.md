# AWS CloudFormation

## Introduction:

- IaC in AWS.
  - Benefits of portability of stacks to another AWS accounts or regions.
- Backbone of Elastic BeanStalk, Service Catalog Service, SAM framework.

## How to retain data:

You can put a DeletionPolicy on any resource to control what happens when the CloudFormation template is deleted

### DeletionPolicy=Retain:

- Specify on resources to preserve / backup in case of CloudFormation deletes
- To keep a resource, specify Retain (works for any resource / nested stack)

### DeletionPolicy=Snapshot:

- EBS Volume, ElastiCache Cluster, ElastiCache Replication Group
- RDS DBInstance, RDS DBCluster, Redshift Cluster

### DeletePolicy=Delete (default behavior):

**Note:** for AWS::RDS::DBCluster resources, the default policy is Snapshot
**Note:** to delete an S3 bucket, you need to first empty the bucket of its

## CloudFormation custom resources:

CloudFormation can manage custom resources using lambda.

- An AWS service which is not yet supported by CloudFormation.
- An on-premise resource.
- Empty S3 bucket before deleting it.
- Fetch the AMI id.


# Brief document explaining how resource management in AWS can be done using AWS Config service

- AWS config service is designed to record and capture resource changes within AWS
  environment.
- Capture resource changes
- Act as resource inventory
- Store config history for individual resources
- Snapshot of current configurations
- An entire snapshot of all supported configurations can be captured within a region
- Notifications about changes; configured with SNS
- Provide information on who made changes and when using AWS CloudTrail integration.
- Use rules to check compliance of resources
- Perform security analysis against your resources such as encryption.
- Identify AWS network connectivity relationship
- This is not a deny service where you can restrict a resource to be created if it doesn't meet your rule criteria.
- However, you can apply the AWS Config: Remediation's against the resources which are marked as Non-Compliant using
  SSM Automation Documents.
- Questions that can be solved by AWS Config:
  - Is there unrestricted SSH access to security groups.
  - Do the buckets have any public access?
  - Has the ALB configuration changed over time? 

### Following services can be managed using AWS Config:
- AWS certificate manager
- AWS EC2
- AWS EC2 Systems manager
- AWS EBS
- AWS S3
- AWS ELB
- AWS VPC
- AWS CloudTrail
- AWS RDS
- AWS Redshift
- AWS IAM

- AWS Config is region specific and it has to be configured for each resource
  specific region.

## AWS Config Components:

### AWS Resources:
- AWS resources are typically classed as AWS Objects which can be created, updated
  and deleted

### Configuration Item:
- It is comprised of a JSON file that contains the configuration information, relationship
  information and other metadata as a point in time snapshot view.
- All the config that the AWS config can hold about a resource is recorded within CI.
- A CI is created whenever a supported resource has a change made to its configuration
  in any way.
- AWS config will also create CI which records direct related resources to ensure
  any change made to the resource doesn't directly affect them.

### Configuration Stream:
- When new CIs are created, they are sent to configuration streams.
- This configuration stream is in the form of a SNS topic.
- This configuration stream is also used on other Events such as
  - When configuration history files are delivered
  - When configuration snapshot are created
  - When state of compliance changes for a resource
  - When evaluation begins
  - When AWS Config fails to deliver notifications

### Configuration History:
- The Configuration History uses CIs to produce history of changes.
- This allows us to see complete set of changes made on a resource over a set period of time.
- $aws configservice get-resource-config-history -> This is the command used to see
  history of changes
- $aws configservice get-resource-config-history --resource-type AWS::EC2::Subnet
  --resource-id <subnetID>  -> command used to get history of changes made on subnet
- AWS Config send a history file to the S3 bucket for each change made
  on every resource. And it is delivered every 6 hours.

### Configuration Snapshot:
- Configuration Snapshot takes a snapshot of all supported resources configured for
  that region.
- It will generate CIs for each resource in your AWS account for this specific region,
  and this configuration snapshot can then be sent to an S3 bucket.

### Configuration Recorder:
- This is engine of the AWS Config service.
- This Configuration Recorder is responsible for recording all of the changes and
  generating the CIs for supported resources in a region.

### Config Rules:
- AWS Config Rules are a great way for you to help enforce specific compliance control
- Each rule is essentially a Lambda function
-  Each time a change is made to the resource, AWS Config Rule will check the compliance
  rules to determine if the change made on that resource is valid.
- If there is a violation of the rule, AWS Config Rule will send a SNS message via
  the Configuration Stream and the resource will be marked as non-compliant.
- We can use following number of predefined managed rules by AWS to check for security
  compliance:
  - Rds-storage-encrypted
  - Encrypted-volumes
  - Root-account-mfa-enabled
  - IAM-users-no-policy-check

### Resource Relationship:
- AWS Config identifies relationship between AWS resources.
- This allows AWS to build a logical mapping of AWS and how they connect.

### SNS Topic:
- SNS topic is used a Configuration Stream for Notifications.
- We can have various endpoints associated to SNS stream.
- Best practice is to use SQS and programmatically analyze results using SQS.

### S3 Bucket:
- It is used to store configuration history files for each resource type which are
  generated every six hours.
- Also, any configuration snapshot taken are stored in the same S3 bucket.
- The configuration used for SNS and S3 are classed as AWS Config delivery channel.

### AWS Config permissions:
- IAM role is required to allow AWS config to obtain the correct permissions to interact
  with other AWS services to carry and perform a number of functions.

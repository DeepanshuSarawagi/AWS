# Systems Manager

## Introduction:
- Patching automation for enhanced compliance.
- Get operational insights about the state of your infrastructure.
- Easily detect problems.

### How Systems manager works:

- We need to install the SSM agent onto the system we control.
- Installed by default on Amazon Linux AMI and some Ubuntu AMIs.
- If an instance can't be controlled with SSM, it is most likely problem with SSM agent.
  - Make sure EC2 instances have proper EC2 instance role to allow Systems Manager actions.

### Systems Manager Run commands:

- Execute a document (=script) or just run a command.
- Run command across multiple instances using resource groups.
- Integrated with IAM and CloudTrail.
- Results of the RUN command are available in the console.

### Send command before an ASG instance is terminated:

- Perform any action before an ASG instance is terminated.
- Create a ASG lifecycle hook that puts the instance in `Terminating:Wait` state.
- Monitor the `Terminating:Wait` state using the EventBridge.
- Trigger an SSM automation document to perform action on the instance before it gets terminated.

Here is a SSM automation example of executing actions on EC2 instance based on CloudWatch alarms.

![SSM automation](https://d2908q01vomqb2.cloudfront.net/972a67c48192728a34979d9a35164c1295401b71/2021/08/11/SSM-Blog-Fig-1-1.jpg)

### Systems Manager - Patch Managers steps:

- **Define a patch baseline** to use (or multiple if you have multiple environments)
- **Define patch groups:** define based on tags, example different environments (dev, test, prod) - use tag Patch Group
- **Define Maintenance Windows** (schedule, duration, registered targets/patch groups and registered tasks)
- Add the AWS-RunPatchBaseline Run
- Command as part of the registered tasks of the Maintenance Window (works cross platform Linux & Windows)
- Define Rate Control (concurrency & error threshold) for the task
- Monitor Patch Compliance using SSM

### Systems Manager - Session Manager:

- Allows you to start a secure shell on your
- EC2 and on-premises servers
- Access through AWS Console, AWS CLI, or Session Manager SDK
- Does not need SSH access, bastion hosts, or SSH keys
- Supports Linux, macOS, and Windows Log connections to your instances and executed commands
- Session log data can be sent to 53 or CloudWatch
- CloudTrail to intercept StartSessions events.

![Session Manager](https://d2908q01vomqb2.cloudfront.net/972a67c48192728a34979d9a35164c1295401b71/2019/08/15/VR-Beneficios-1.png)

[Blog](https://aws.amazon.com/blogs/mt/vr-beneficios-session-manager/) for reference.

### Systems Manager - Ops Center:

- Resolve Operational Issues (Opstems) related to AWS resources 
- OpsItems - issues, events and alerts
- Aggregates information to resolve issues on each OpsItems such as:
  - AWS Config changes and relationships
  - CloudTrail Logs
  - CloudWatch Alarms
  - CloudFormation Stack information
- Provides Automation Runbooks that you can use to resolve issues EventBridge or CloudWatch Alarms can create OpsItems

## SSM Parameter Store

- Secure storage for configuration and secrets.
- Optional seamless integration using KMS.
- Version tracking of configuration / secrets.
- Configuration management using path and IAM.
- Notifications with CloudWatch Events.
- Integration with CloudFormation.

### Standard Parameter Tier:
- Upto 10,000 parameters per AWS account region
- Parameter value - Max size 4KB
- Policies available - No
- no cost
- No storage pricing
- Standard throughput - free, higher throughput - $0.05 per 10,000 API interactions.

### Advanced Parameter Tier:
- Upto 100,000 parameters per AWS account region
- Parameter value - Max size 8KB
- Policies available - Yes
- Charges apply
- $0.05 per month
- Standard throughput - $0.05, higher throughput - $0.05 per 10,000 API interactions.

### Parameter policies:
- Applicable only for advanced parameters.
- Assign a TTL to the parameters to force updating or deleting the parameter.
- Can assign multiple policies at a time.
- Can monitor following event types using Amazon EventBridge:
  - Parameter expiration after TTL event (Expiration)
  - Expiration notification
  - Parameter which has not been changed since x amount of days (NoChangeNotification)
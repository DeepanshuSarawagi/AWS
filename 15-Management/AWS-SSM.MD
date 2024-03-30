# SSM Parameter Store

- Secure storage for configuration and secrets.
- Optional seamless integration using KMS.
- Version tracking of configuration / secrets.
- Configuration management using path and IAM.
- Notifications with CloudWatch Events.
- Integration with CloudFormation.

## Standard Parameter Tier:
- Upto 10,000 parameters per AWS account region
- Parameter value - Max size 4KB
- Policies available - No
- no cost
- No storage pricing
- Standard throughput - free, higher throughput - $0.05 per 10,000 API interactions.

## Advanced Parameter Tier:
- Upto 100,000 parameters per AWS account region
- Parameter value - Max size 8KB
- Policies available - Yes
- Charges apply
- $0.05 per month
- Standard throughput - $0.05, higher throughput - $0.05 per 10,000 API interactions.

## Parameter policies:
- Applicable only for advanced parameters.
- Assign a TTL to the parameters to force updating or deleting the parameter.
- Can assign multiple policies at a time.
- Can monitor following event types using Amazon EventBridge:
  - Parameter expiration after TTL event (Expiration)
  - Expiration notification
  - Parameter which has not been changed since x amount of days (NoChangeNotification)
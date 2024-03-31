# Amazon GuardDuty

- Intelligent threat discovery to protect AWS account.
- Uses ML, anomaly detection.
- Input logs include
  - CloudTrail Logs
    - CloudTrail Management events: Create VPC subnets, create trails, etc..
    - CloudTrail S3 Data events: Get/List/Delete objects
  - VPC Flow logs
  - DNS Logs
  - Kubernetes Audit Logs
  - RDS and Aurora
  - EBS
  - S3 Data Events
  - Lambda network activity
- Can setup EventBridge rules in case of any findings.
- Can protect against Cryptocurrency attack
- Amazon GuardDuty offers threat detection that enables you to continuously monitor and protect your AWS accounts,
  workloads, and data stored in Amazon S3. GuardDuty analyzes continuous streams of meta-data generated from your
  account and network activity found in AWS CloudTrail Events, Amazon VPC Flow Logs, and DNS Logs.
  It also uses integrated threat intelligence such as known malicious IP addresses, anomaly detection,
  and machine learning to identify threats more accurately.

## Delegated Administrator:
- AWS Organization member accounts can be designates to be GuardDuty Delegated Administrator.
- Have full permissions to enable and manage GuardDut for all accounts in the Organization.

## Difference between Disabling and suspending GuardDuty:

Disable the service in the general settings - Disabling the service will delete all remaining data, including your
findings and configurations before relinquishing the service permissions and resetting the service.

Suspend the service in the general settings - You can stop Amazon GuardDuty from analyzing your data sources at any time
 by choosing to suspend the service in the general settings. This will immediately stop the service from analyzing data,
 but does not delete your existing findings or configurations.
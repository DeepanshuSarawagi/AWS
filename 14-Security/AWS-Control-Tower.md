# AWS-Control-Tower

Easy to set-up and govern a secure and compliant multi-account environment based on best practices.

## Benefits

- Automate the setup of environment in few clicks.
- Automate the ongoing policy management using guardrails.
- Detect policy violations and remediate them.
- Monitor compliance through an interactive dashboard.

AWS control runs on top of AWS Organizations and automatically sets up AWS Organizations to organize account and 
implement SCPs.

## Account factory:

- Automates account provisioning and deployments
- Enables you to create pre-approved baselines and configurations options for your AWS accounts such as VPC, subnets, regions..
- Uses AWS Service Catalog to provision new accounts.

## Detect and remediate policy violations:

### Guardrails:
- Provides ongoing governance for your AWS Control Tower environment.
- Two types of guardrails:
  - Preventive: Using SCPs. (E.g., which disallows creation of KMS key for root user)
  - Detective: Using AWS Config. (E.g., Detect whether MFA for root user is enabled)

#### Guardrail levels:
- Mandatory:
  - Automatically enabled and enforced by AWS Control Tower.
  - Example: Disallow public read access to log archive account.
- Strongly recommended:
  - Based on AWS best practices. (Optional)
  - Example: Enable encryption for EBS volumes attached to EC2 instances.
- Elective:
  - Commonly used by enterprises. (Optional)
  - Example: Disallow delete actions without MFA in S3 bucket.
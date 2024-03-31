# Brief document on AWS Firewall Manager Service

- The core function of AWS Firewall Manager is to help you simplify management to help
  you provide security to different resources across different AWS accounts.
- Manage rules in all accounts of AWS Organization.
- The service works across multiple AWS account infrastructure.
- Once you configured security policies, to govern the protection that you require for
  your resources, AWS Firewall Manager will then automatically apply this protection
  in addition to managing this protection for newly created resources across any of
  your accounts that it has responsibility for.
- AWS Firewall Manager can provide protection to following AWS services or resources
  - AWS WAF
  - AWS Shield Advanced
  - AWS Network Firewall
  - VPC Security Groups
  - Amazon Route 53 Resolver DNS Firewall
- Running AWS Organization is a pre-requisite for using AWS Firewall Manager.
- Rules are applied to new resources as they are created in any accounts of AWS Organization.

## Pre-requisites:
- Choose the AWS account which will be used as Firewall Manager Administrator which
  will be essentially used to manage security Policies.
- Need to ensure that account is part of AWS Organizations.
- Configure Firewall Manager administrative account.
- Enable config for any AWS account which is in AWS Organization that you want to
  manage resource security for.
- Enable sharing to share the configs for different resources across AWS accounts in
  AWS Organization. to Enable this, we need to enable sharing using AWS Resource Manager.
- Enable regions in the AWS Management Account in addition to the account which
  Firewall Manager Administrator.

## Policies
- We need to create policies for different resources which we want to protect from threats using AWS Firewall Manager.
- A resource can have multiple policies managed.
- We can create policies for following resources for multiple AWS accounts across AWS Organizations
  - AWS WAF (ALB, API Gateway, CloudFront)
  - AWS Shield Advanced (CLB, ALB, NLB, EIP, CloudFront)
  - AWS Network Firewall
  - VPC Security Groups
  - Amazon Route 53 Resolver DNS Firewall

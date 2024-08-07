# Brief document explaining the key components and use of AWS Organizations service

## Table of contents:

1. [How to perform administrative tasks on AWS Member account?](#1-how-to-perform-administrative-tasks-on-aws-member-account)
2. [AWS Organizations components](#2-aws-organizations-components)
   1. [Organizations](#2a-organizations)
   2. [Root](#2b-root)
   3. [Organizational Units](#2c-organizational-units)
   4. [Account](#2d-accounts)
   5. [Service Control Policies](#2e-service-control-policies)
   6. [Benefits](#2f-benefits)
   7. [Service Control Policies process](#2h-service-control-policies-process)

- AWS Organizations can be used to manage multiple AWS accounts in an Organization.
- Cost optimization and billing (Consolidated)
- Security and governance
- Management and control of workloads
- Resource grouping
- Helping to define business units

## 1. How to perform administrative tasks on AWS Member account?
- If an AWS account is created from the Management account using the Organization service, then a special IAM is created
  in the Member account ```OrganizationAccountAccessRole```.
- This IAM role grants full administrator access to the Management account in Member account.
- Could be assumed by IAM users in the Management account.
- Must be created manually if you invite an existing member account.

## 2. AWS Organizations components:
### 2a. Organizations:
- An Organization is an element that serves to form a hierarchical structure of multiple
  AWS accounts.
- It provides a graphical view of your entire AWS account structure.

### 2b. Root:
- It is a container that resides on top of your Organization. All of your AWS
  accounts and Organizational Units will sit underneath this Root.
- There can only be one single Root object.

### 2c. Organizational Units
- They provide means of categorizing multiple AWS accounts.
- Like Root, they are just containers, that allow you to group together specific
  AWS accounts together.
- They can connect directly below Root or another OU. OUs can be nested 5 times.

### 2d. Accounts:
- These are essentially AWS accounts which you use to configure AWS resources.

### 2e. Service Control Policies:
- They control what services and features are accessible from within an AWS account.
- These SCPs can either be associated with a Root, OU or directly AWS accounts.
- When an SCP is applied to any of these objects, its associated controls are fed
  down to all of its child objects.
- SCP is applied to all users and groups including root user.
- SCPs does not affect service linked roles.
  - Service Linked Roles enables other AWS services to integrate with AWS Organizations and cannot be restricted using SCPs.
- SCP must have an explicit ```Allow```.
- 

### 2f. Benefits:
- Centrally manage policies of all AWS accounts from Master account.
- Consolidated billing of all AWS account.
- Categorization and grouping of AWS accounts.
  - #### Reserved instances benefits:
    - For billing purposes, the consolidated billing feature of AWS organizations treats all the accounts in the organizations
      as one.
    - This means that all the accounts in the organizations can receive hourly cost benefit of reserved instances even though
      they are purchased by any other account.
    - The Payer account (Management) of AWS organization can turn off Reserved Instance and savings plan discount sharing
      for any other AWS accounts in that organization. 

### 2g. Process of setting up AWS organizations:
- Setting up of AWS Organizations requires a Master account. This Master account should not be used
  for anything else such as configuring resources. The sole purpose of this AWS master account is
  to centrally manage other AWS accounts using AWS Organizations service.
 - If we want to setup service control policies, we need to enable all features in AWS master account.

### 2h. Service Control Policies process:
- SCP is different from both identity based and resource based policies which grants permissions to the AWS resources.
- SCPs do not grant permissions themselves.
- They set boundary permissions for an AWS account.
- For example, if a user has full permission to S3 and RDS, however, there is a SCP associated with the account
  which restricts permission to read only permission, then the user will not be able to perform any write
  operation for these services.
- SCP overrides the permission set for resources via both identity and resource based policy.
- SCP do not grant access, they act as guard rail to what is allowed.
- Inheritance of SCP - based on the SCPs attached to the child right from root account will take in place.
 For example, if root account has SCPs 1,2,3,4,5,6 and under Dev (OU) we have AWS account. If Dev(OU) has SCPs 2,3,4
 then AWS account under DEV(OU) will be governed by SCPs 2,3,4. Hence, the hierarchy of objects determines the
 SCPs in effect for each AWS account.
- Another Example, if root account has SCPs 1,2,3,4 and under Dev (OU) we have AWS account. If Dev(OU) has SCPs 2,3,4,5,6
 then AWS account under DEV(OU) will be governed by SCPs 2,3,4 since SCPs 5,6 is not available at parent object Root account.
 Hence, the hierarchy of objects determines the SCPs in effect for each AWS account.
- Final Example, if root account has FullAWSAccess SCP and under Dev (OU) we have AWS account. If Dev(OU) has SCPs 2,3,4,5,6
 then AWS account under DEV(OU) will be governed by SCPs 2,3,4,5,6.
 Hence, the hierarchy of objects determines the SCPs in effect for each AWS account.
- SCPs do not affect resource based policies. They only affect the principals managed by your accounts in your organization.
- SCPs affect all users and roles in addition to the root user. However, root user will still be able to change password including
  MFA settings and also root access keys.
- If you disabled SCPs in AWS Organizations, then it will remove and delete all SCPs in all AWS organizations managed accounts.
  if we re-enable SCPs, then the default SCP will be in place which is FullAWSAccess.
- Following elements are not affected by SCPs
  - SCPs do not affect the master account.
  - **SCPs do not affect the service-linked roles.**
  - Managing AWS CloudFront keys.

## 3. Using SCP to restrict creating resources without appropriate tags:

- Prevent IAM Users/Roles in the affected member accounts if they don`t have specific tags.
- Example below is to restrict running EC2 instances if IAM user/role does not have tags.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyRunEC2InstanceWithNoProjectTag",
      "Effect": "Deny",
      "Action": "ec2:RunInstances",
      "Resource": "*",
      "Condition": {
        "Null": {
          "aws:RequestTag/Project": "true"
        }
      }
    },
    {
      "Sid": "DenyRunEC2InstanceWithNoProjectTag",
      "Effect": "Deny",
      "Action": "ec2:RunInstances",
      "Resource": "*",
      "Condition": {
        "Null": {
          "aws:RequestTag/CostCenter": "true"
        }
      }
    }
  ]
}
```
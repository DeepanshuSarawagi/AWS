# Brief document on Identity and Access Management

Best practices of implementing IAM in any AWS account:

- Grant the least privileges. Ensuring a principle of least principles ensures that
  identities are permitted to perform most minimal set of functions to fulfil a specific
  task by granting least access without affecting usability and efficiency.
- Enable identity federation. Centrally manage all the users and groups for all the
  applications in AWS account. For managing users and groups across multiple AWS accounts
  in an Organization, we can use AWS Single Sign On.
- Enable MFA
- Rotate credentials regularly.
- Enable IAM Access Analyzer, to enable public and cross-organization access.
- Attach IAM policies to the IAM user groups to restrict access to the AWS services.

## IAM Roles
- IAM Roles allows Users, other AWS services and applications to adopt a set of
  temporary IAM permissions to access AWS resources.
- IAM roles allow trusted users to set of AWS resources or applications to adopt a
  set of temporary credentials.
- Much like identities, Roles have certain set of permissions defined what resources can and
  can't be accessed.
- IAM roles are designed to be assumed by multiple entities unlike Users which is
  defined for single entity/identity.
- Roles are used for temporary access to gain access to resources. And each time
  a Role is used by a user/entity to access a AWS resource or application, a temporary
  credential is generated for that particular session.
- IAM Roles can be used for a user from one account to access the resources from
  another AWS account.
- When you assume a Role to access resource, you give your original permission and
  take the permission assigned to the role.
- IAM Roles can be used by federated users to access AWS resources temporarily.
- IAM roles can also be used by AWS services to access services from your behalf
  or an application requires access to resources which can be used by Roles instead
  of embedding credentials within an application.
- When a user assumes a Role, all the existing permissions are temporarily replaced.
- Whenever a Role is created, a user cannot simply get access to the resources as defined
  in the roles. A policy should be attached to the Role and the user must have the
  permissions to assume the role. For users to assume the Role, we must create an
  in-line policy for the user and attach to it.
- We can use WebIdentity or SAML2.0 federation to allow federated users to assume Roles
  for accessing specific AWS services.

## IAM Policies
- IAM Policies are written in JSON document and these define what can and can't be
  accessed. These policies can be attached to Users, User groups and Roles.
- Policies include Managed Policies and In-line policies.
- Managed Policies are viewed as library of usable policies. Managed Policies can be
  applied to multiple users and groups and Roles.
- These are list of predefined policies granting varied access to different AWS services.
- Unlike Managed Policies, In-line policies are not stored in a library, instead they
  have to be written and explicitly embedded within a User, User Group, Role. As a
  result, same policy cant be applied to another identity like Managed Policies.

## Identity Providers
- Used to provides federated access to AWS resources. Federated Access allows credentials
  external to AWS to be used as a means for authentication. Identity providers such
  as ADFS servers, Google, Facebook. This prevents you from having to create individual
  IAM user accounts.

## Security Token Service Endpoints
- STS service is used to allow you to request temporary, limited privilege credentials with
  for both IAM users and federated users.
- Token is valid for 1 hour.
- You can AssumeRole using STS Token.

## Session tags in STS
- Tags that you pass when you assume an IAM role or federate user in STS.
  - **Why do this?**
  - So that we can use `aws:PrincipalTag` condition in policy.
  - Compares the tag attached to the principal making the request with the tag you specified in the policy.
  - Example: Allow principal to pass session tags only if the principal making the request has the specified tags.
- Refer to below S3 policy which makes use of session tags.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3::::hr-docs/*",
      "Condition": {
        "StringEquals": {
          "aws:PrincipalTag/Department": "HR" 
        }
      }
    }
  ]
}
```

## STS important APIs:

- AssumeRole: Access the role within your account or cross account you own.
- AssumeRoleWithSAML: Return credentials for users logged in with SAML.
- AssumeRoleWithWebIdentity: Returns creds for users logged in with IdP.
- GetSessionToken: For MFA, for user or account root user.

## Service Control policies
- Service Control Policies are different from Identity based policies as SCPs do not
  grant permissions themselves.
- Instead, SCPs are used with AWS Organizations, to implement and set a boundary of
  permissions for AWS accounts.
- For example, if a user has full permissions to S3, RDS and EC2 via identity policy,
  however, if a there is a SCP associated with the AWS account which denies access
  to S3 then the user will not be able to access S3 despite having full access via
  identity policy.

## Access Keys
- Access keys are used for programmatic access to your AWS resources.
- It comprises two elements - Access Key ID (20 random uppercase alpha-num chars)
  and Secret Access key (40 random upper and lowercase alpha-num and non alpha-num chars).

## IAM Services Roles to access AWS resources on your behalf
- An AWS service Roles allows access to other AWS service resource within your own
  account on your behalf.
- This is commonly used for EC2 instances to assume access to resources on your behalf.
- For example, we have an EC2 instance running an application which requires access to
  AWS S3 to perform relevant PUT and GET API calls. Instead of embedding credentials
  within the application, it is better to use the EC2 Roles to allow EC2 to access
  S3 on your behalf. This also helps us in reducing the administrative burden of
  rotating credentials for security purposes.
- Difference between Service-Roles and Service-Linked Roles is that it comes with predefined
  managed roles and they (Service-Linked) Roles cannot be edited. They are one setup
  when service is used first time and can only be used by that particular service.

# Implementing Cross Account Access using IAM

- Cross account access is nothing but a User from one AWS account requesting access to
  services/resources with another AWS account using IAM roles.
- To understand the process, lets assume that there are two AWS accounts, one for Dev
  and one for Production. A developer has access to DEV account and may occasionally
  require access to Production account.
- For our understanding, lets call Dev as Trusted Account and Production as Trusting Account.
- Create a new role from within the Trusting account. This is required to establish a
  trust relationship between Trusted and Trusting accounts.
- Specify the permissions attached to these newly created Roles which the users in
  Trusted account would assume to carry out their required actions and tasks.
- You must switch to the Trusted account to grant permissions to your developers
  to allow them to assume the newly created role in the trusting account.
- Finally switch between AWS accounts to test the configured access.

## IAM Conditions
- We can restrict resources in AWS based on source IP of the client. aws:SourceIP
- AWS:RequestedRegion, restrict the region the API calls are made to.

## IAM Permission Boundaries:
- Supported for users and roles and not groups.
- IAM feature to use a managed policy to set the maximum permission an IAM entity can get.
- Can be in combination of AWS Organizations SCPs + Identity-based Policy + Permissions Boundary.

## IAM Policies evaluation
- Explicit Deny?
- SCP
- Resource Based Policy
- Identity Based Policy
- IAM Permission Boundaries
- Session Policies

This is a fantastic [document](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-denyallow) 
which shows the evaluation logic of IAM policies.

Refer the following ![image](https://docs.aws.amazon.com/images/IAM/latest/UserGuide/images/PolicyEvaluationHorizontal111621.png)

## Restricting Tags with IAM policies:

We can restrict specific tags on AWS resources. Example: Allow only IAM users which has Env and CostCenter tags to create EBS
volumes.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:CreateVolume",
      "Resource": "arn:aws:ec2:*:*:volume/*",
      "Condition": {
        "ForAllValues:StringEquals": {
          "aws:TagKeys": ["Env", "CostCenter"]
        } 
      }
    }
  ]
}
```
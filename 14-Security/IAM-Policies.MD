# Brief document on different types of AWS IAM policies

- There are four different types of policies:
  - Identity Policy:
    - These policies can be attached to users, user groups or IAM roles.
    - These can either be managed or inline policies.
    - Managed policies are saved within the IAM library of policies.
    - Managed policies are of two different flavours as well: AWS Managed Policies and
      Customer Managed Policies.
    - AWS Managed policies are preconfigured by AWS and can be used by the users to
      manage some of the most common permissions to access AWS resources.
    - Customer managed policies are created by the AWS customer which can be used to
      managed access to the resources. These can also be assigned to IAM Users/Groups/Roles.
    - Inline policies are embedded directly into the entity. The policy is not saved/stored
      in the IAM library of policies.
    - It cant be replicated to other entities. It is specific to that one user it is
      attached.

  - Resource Based Policy
    - Instead of attaching to the identity, these policies are attached in-line to
      resources themselves.
    - They are inline policies which are effectively tied to a resource instead of an identity.
    - AWS S3 bucket policy is a common resource based policy.
    - Resourced based policy has the principal parameter to determine which identity
      the permissions relate to.

  - Permission Boundaries
    - These policies can be associated with a role or a user but then dont actually
      grant permissions themselves. Instead, they define the maximum level of permissions
      that can be granted to an entity.
    - These can only be applied to a user or a role since it is not possible to set
      boundaries to a group.

  - Organization Service Control Policies
    - These are very similar to permission boundaries in the fact that they do not
      grant permissions. Instead, they define a boundary of maximum permissions.
      These SCPs are associated at AWS account or Organizational Unit level and
      govern the maximum permissions to the members of that account.
    - The SCP would serve to prevent service from being used by an identity within
      AWS account.
    - The SCP can't be edited using IAM. It has to be managed using the AWS Organization.


## Policy Evaluation steps
- By default, all access to a resource is denied.
- Access will only be allowed if Allow access has been specified within a policy
  associated with the principle.
- If any Deny is specified within any policy associated with the same principle against
  the same resource then Deny will overrule Allow access.
- Policies are evaluated in following order:
  - Organizational SCPs
  - Resource based SCPs
  - Permission Boundaries
  - Identity Policies.

## Sample IAM Policy example:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:AttachVolume",
        "ec2:DescribeVolume"
      ],
      "Resource": "arn:aws:ec2:*:*:instance/*",
      "Condition": {
          "StringEquals": {
            "ec2:ResourceTag/Department": "Development"
          }
        }
      },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:AttachVolume",
        "ec2:DescribeVolume"
      ],
      "Resource": "arn:aws:ec2:*:*:instance/*",
      "Condition": {
        "StringEquals": {
          "ec2:ResourceTag/VolumeUser": "${aws:username}"
        }
      }
    }
  ]
}
```
## Sample IAM policy with NotAction
```json
{
  "Version": "2012=10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "NotAction": [
        "iam:*",
        "organizations:*",
        "account:*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "iam:CreateServiceLinkedRole",
        "iam:DescribeServiceLinkedRole",
        "iam:ListRoles",
        "organizations:DescribeOrganizations",
        "account:ListRegions"
      ],
      "Resource": "*"
    }
  ]
}
```

The above sample NotAction policy is very useful where you want your IAM principals to restrict certain but not all Actions for a
service. This helps us to get rid of using explicit Deny.

## Condition Operators in Policy Statements:

### String operators:
- StringEquals
- StringNotEquals
- StringLike

### Numeric operators:
- NumericEquals
- NumericNotEquals
- NumericLessThan

### Date operators:
- DateEquals
- DateNotEquals
- DateLessThan

### Boolean operators:
- true
- false

### Ip operator:
- IpAddress
- NotIpAddress

### Arn operator:
- ArnEquals
- ArnLike

### Null condition:

```json
{
  "Condition": {
    "Bool": {
      "aws:SecureTransport": "true",
      "aws:MultiFactorAuthPresent": "true"
    },
    "StringEquals": {
      "aws:PrincipalTag/job-category": "iamuser-admin"
    },
    "IpAddress": {
      "aws:SourceIp": "192.168.0.0/24"
    },
    "Null": {
      "aws:TokenIssueTime": "true"
    }
  }
}
```

## IAM Policies variables and tags:

- Aws username:
  - "Resource": ["aws:arn:iam::::/${aws:username}/*"]
- AWS Specific:
  - aws:CurrentTime
  - aws:TokenIssueTime
  - aws:PrincipleType
  - aws:SecureTransport
  - aws:SourceIp
  - aws:userid
  - ec2:SourceInstanceArn
- Service specific:
  - s3:prefix
  - s3:max-keys
  - sns:Endpoint
  - sns:Protocol
- Tag based:
  - iam:ResourceTag/key-name
  - aws:PrincipalTag/key-name

## IAM roles v. resource based policies:
- When you assume a role, you give your original permissions and take the permission assigned to the role.
- However, when using a resource based policy, user/IAM principal doesn't have to give up any permissions.
- Classic usecase:
  - User needs to scan a DynamoDB table in account A and dump it in S3 bucket in account B.
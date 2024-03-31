# How to use access policies to get access to S3 resources.

- We can control access to S3 resources using both policies - Identity policies
  and resource based policies.

## IAM Policies:
  - Identity based policies are attached to the IAM Identity requiring policies using
    IAM permissions policies, either in-line or managed.
  - Associated to the user, to a group that the user belongs to or via a role that
    the user has permission to assume.
  - IAM based policies, define the resource in the policy, for example the bucket name.
  - Centrally manage your access control methods all in one service
  - Use 1 or 2 policies across multiple buckets rather than creating policies for every bucket.
  - Can control access for service more than one service at a time.
  - IAM policies can be 2KB in size for users, 5KB for groups and 10 KB for roles.

## Resource based policies:
  - This policy is associated with the resource rather than the Identity.
  - Comes in the form of Access Control Lists or Bucket policies.
  - Bucket policies are directly attached to the buckets by another means of granting
    and restricting access controls.
  - Must specify a Principal element which defines the principal who is associated
    with the action and effect defined in the statement.
  - Only control access to S3 buckets.
  - Use only if you want to maintain the policies within your S3 bucket alone.
  - Can grant cross account access without having to create or assume roles that created within IAM.
  - Resource policies can be 20 KB in size.

## S3 Bucket Policies:

- Use S3 bucket policy to:
  - Grant public access to the bucket.
  - Force objects to be encrypted at upload.
  - Grant access to cross-accounts.
- Optional conditions on:
  - `SourceIp`: `PublicIp` or `PrivateIp` | `VpcSourceIp` through private VPC endpoint.
  - Source VPC or Source VPC endpoint - Only works with VPC endpoints.
  - CloudFront origin identity.
  - MFA.

## Access Control Lists:
  - Allows control of access to buckets and specific objects within a buckets by groupings
    and AWS accounts.
  - Can set different permission per object.
  - ACLs do not follow the same JSON format as predefined by the IAM or bucket policies.
  - Different permissions can be applied depending on where the ACL is applied
    (Bucket level or object level)
  - It is not possible to implicitly deny access using the ACLs or to implement the
    conditional elements like with Identity-Based access.
  - If you want to add other AWS accounts to get access to your buckets using ACL,
    we need to add the canonical ID of the respective AWS account as a grantee in the ACL.
  - There is no WRITE access available when we use ACLs for objects.

## Policy evaluation and Precedence if a bucket has following:
  - IAM Policies.
  - Bucket Policies.
  - Bucket ACLs.

  - As per AWS security policies, all of these policies will be scanned together
    for what is called as Principle of lease-privileged.
  - By default, AWS states that access is denied to an object even if there is any explicit
    Deny stated in the policy.
  - To gain access, there has to be a Allow within a policy that the principal is associated to,
    or defined by within a bucket or ACL.
  - Note that, if Deny is explicitly stated in any of the above three policy documents then
    the access to the bucket or its objects will be denied since Deny takes precedence over Allow.

## Object Retention:
  - Retention Period: Specifies a fixed period.
  - Legal Hold: Same protection, no expiry data.

- The difference between compliance mode and governance mode - compliance prevents objects from being updated or
  deleted by any user including the root user. When object is locked in compliance mode, its retention period cant be changed,
  and its retention period can't be shortened.

- Governance only prevents deletion unless they have special permissions.

- Default Retention periods can be set at bucket level and then applied to all objects uploaded into the bucket.
- Otherwise, they have to be set at an object version level.
- Legal holds have no specific time frame associated with them, and cannot be configured at a bucket level.
  They must be configured at an object version level.
- Object lock settings cannot be configured via batch operations.
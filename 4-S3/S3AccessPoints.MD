# S3 Access Points

S3 Access points can be used to restrict access to certain bucket objects. This can be achieved by creating an access point
policy which is similar to bucket policy and is going to grant read/write access.

- Access Points simplify security management for S3 buckets.
- Each Access Point has:
  - Its own DNS names (Internet origin or VPC origin)
  - An access point policy

## S3 - Access Points - VPC origin:

- We can define the access point to be accessible only from within the VPC.
- To get access to this VPC origin, we must create a VPC endpoint (Interface or Gateway) to access the Access Point.

# Brief document on AWS Transfer family

- A fully managed service for file transfers into and out of Amazon S3 or EFS using FTP protocol.
- Supported Protocols:
  - FTP
  - FTPS
  - SFTP
- Managed infrastructure, Scalable, Reliable, High Available
- Pay for per provisioned endpoint per hour + data transfers in GB
- Integrate with Authentication systems as MS AD, LDAP, OKTA, Amazon Cognito.
- **Use case:** Sharing files, public datasets, CRM, ERP..

## Endpoint types:

### Public endpoint:
- Uses AWS managed public IP address. The IP address can change over time. 
- Create a DNS name for this.
- Cant setup allow lists by source IP address.

### VPC endpoint:
- The endpoint is going to be deployed within private VPC and EC2 instances can access it privately.
- Static private IPs.
- Setup allow lists - SGs and NACLs.

### VPC endpoint with internet facing:
- Same like private VPC endpoints.
- However, can attach EIP to the endpoint which enabled internet access.
- Can control the access using SGs.
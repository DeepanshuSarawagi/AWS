# AWS Service Catalog

## Introduction:

- Users that are new to AWS may create stacks that may not be compliant / in line with the rest of the organization.
- Service Catalog solves this problem of launching authorized AWS services pre-defined by admins.

### Admin tasks:

- Admins write the CloudFormation templates for the products which can be provisioned.
- The collection of all these products put together is called portfolio.
- IAM roles are created which define who can access portfolios.

### User tasks:

- Users are then presented with product list in the service catalog.
- Products which the users see are the products that are authorized by IAM.
- Therefore, users can now browse through this set of products which they can use to provision AWS service.

Hence, Service Catalog is a srt of CloudFormation templates which the users can use based on IAM permissions.
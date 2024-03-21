# Identity federation in AWS:

- Give users outside of AWS relevant permissions to access AWS resources in your account.
- You don't need to create IAM users for this.
- Can have many flavors:
  - SAML 2.0
  - Web identity federation with(out) AWS Cognito
  - Single Sign-On

## AWS SSO:
- AWS SSO allows you to create a Single Sign-On approach to access multiple AWS
  accounts within an AWS Organization using a single identity provider for all.
- AWS IAM Identity Center = AWS Single Sign-On (SSO)
- Supports SAML 2.0 and also integration with On-prem AD.

## AWS IAM:
- AWS IAM allows you to configure different OpenID or SAML identity providers for
  each of your AWS account.

### SAML 2.0:
  - To integrate AD/ADFS with AWS.
  - Provides access to console or CLI or AWS API using temporary credentials.
    - No need to create IAM users for each of your employees.
    - Need to setup trust relationship between AWS IAM and SAML 2.0 idP.
  - Uses the STS API ```AssumeRoleWithSAML``` call to give temporary credentials using saml assertion to access AWS services.
  - Amazon SSO is the new managed and simpler way.

## AWS Cognito
- AWS Cognito enables secure authentication to your web and mobile application using
  both SAML2.0 and web-identity federation.

### Web identity federation with AWS Cognito:
- Create IAM Roles using Cognito with least privilege needed.
- Build the trust between OIDC IdP and AWS.
- Login Flow:
  - Client authenticates itself using 3rd party IdP.
  - Receives ID token.
  - The token is then exchanged with Cognito and gets Cognito token in return.
  - The Cognito token is then sent to STS to receive temporary AWS credentials.
  - Using this, client can access AWS resources.
- Cognito benefits:
  - Supports anonymous users.
  - Supports MFA.
  - Data synchronization.


- You have an on-premises identity provider that does not support SAML 2.0, and you want to give your on-premises
  users access to your resources in the AWS Accounts that you manage. What should you do?

  - Use a Custom Identity Broker to authenticate your users and get temporary credentials from
    AWS ST using AssumeRole or GetFederationToken STS API calls.
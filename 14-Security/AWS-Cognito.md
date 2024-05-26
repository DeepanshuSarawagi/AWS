# Brief document on AWS Cognito service

- It is a User authentication and management service.
- Has strong integration with third party identity providers such as Google, Facebook,
  Apple.
- Allows you to federate identities from your own Active Directory service so that
  your users can access to your own external web and mobile applications.

## Amazon Cognito User Pool

- To create and maintain a directory of your Users for your mobile and web applications.
- Deals with both signing-up and signing-in.
- Has following features
  - Password policy for authentication service
  - Enabling MFA
  - Account recovery and password reset
  - Integrated with ADFS server
  - SSO mechanism
  - Integration with third party IDP
  - Customizable WebUI with OAuth2.0 compliant authentication server
  - Integration with AWS Lambda and API Gateway

## Amazon Cognito Identity Pool

- Also knows as federated identities helps to provide temporary access to AWS
  credentials for your users and guests.
- Integration with third party IDP.
- Helps to identify authenticated and unauthenticated identities.
- Each identity has a role associated with policies attached to them.
- Identity pool is used to provide authentication mechanism for your users to access
  AWS service called upon by your web/mobile application.
- The ID Token provided by SAML is normalized to CUP (Cognito User Pool).
- This CUP token can then be used by several AWS services like AWS Lambda or AWS
  API Gateway to access its services by authenticating users.
- However, not all AWS services will allow CUP tokens for authentication. Example,
  S3 or DynamoDB.
- In this case, the CUP token is then sent to Identity Pool via STS and this STS token
  is then sent back to application.
- Application can then use credentials to call upon AWS services like S3 or DynamoDB.

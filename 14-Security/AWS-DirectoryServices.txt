# Brief document on AWS Directory services

- Provides way to create Active Directory on AWS.
- It has following three flavours.
  - AWS managed Microsoft AD.
    - Create your own AD in AWS.
    - Manage users locally and supports MFA.
    - Can establish trust between On-Prem AD and AWS AD.

  - AD Connector
    - Directory Gateway to redirect to On-prem AD using proxy, supports MFA.
    - Users are managed on on-prem AD.
    - A small AD connector can support upto 500 users and a large AD connector can support upto 5000 users.

  - Simple AD:
    - AD-Compatible managed directory on AWS.
    - Cannot be joined/linked with on-prem AD.
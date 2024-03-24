# Brief document on AWS Directory services

- Provides way to create Active Directory on AWS.
- It has following three flavours.

## AWS managed Microsoft AD.
- Create your own AD in AWS.
- Manage users locally and supports MFA.
- Can establish trust between On-Prem AD and AWS AD.
- EC2 windows instances can join the AD and run the traditional AD applications.
- Seamlessly Domain Join the Amazon EC2 instances from multiple accounts and VPCs. 
### Integrations:
- RDS for SQL server and AWS Workspaces, Quicksight, Connect, SSO, WorkDocs. 
- AWS SSO to provide access to 3rd party applications.
### Features:
- Automated backups.
- Automated Multi-region replication of your directory.
### Connect to On-prem AD:
- Can establish trust between On-Prem AD and AWS AD.
- Must use Direct Connect or VPN to connect to on-prem AD.
- Can set up three kinds of forest trust:
  - One-way trust; AWS => On-prem
  - One-way trust; On-prem => AWS
  - Two-way trust; AWS <=> AWS
  - Forest trust is different from synchronization (Replication is not supported)
    - It means, user can reside on any of the domain controller. Be it On-prem AD or AWS AD.
    - Since we have the forest trust established, an On-prem AD application can ask AWS AD to check whether the user can be
      trusted.
### How to establish replication then?
- Create a replica of your on-prem AD on EC2 instance.
- Set up replication between On-prem AD and AD running on EC2 instance.
- Finally, establish forest trust between AD running on EC2 instance and AWS managed AD.

## AD Connector
- Directory Gateway to redirect to On-prem AD using proxy, supports MFA.
- Users are managed on on-prem AD.
- A small AD connector can support upto 500 users and a large AD connector can support upto 5000 users.
- Doesn't work with SQL server, can't perform seamless joining and can't share directory. 

## Simple AD:
- AD-Compatible managed directory on AWS.
- Cannot be joined/linked with on-prem AD.
- Does not support MFA.
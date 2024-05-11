# Amazon WorkSpaces

## Introduction:

- Managed secure, cloud desktop.
- Great to eliminate management of on-r=premise VDI.
- Pricing is either on-demand or monthly subscription.
- Secure encrypted network isolation.
- Can be integrated with Microsoft AD.

### WorkSpaces Application Manager:

- WorkSpaces Application Manager (WAM)
- Deploy and Manage applications as virtualized application containers
- Provision at scale, and keep the applications updated using WAM

### Windows Updates:
- By default, Amazon Workspaces are configured to install software updates
- Amazon WorkSpaces with Windows will have Windows Update turned on
- You have full control over the Windows Update frequency

### Maintenance Windows:
- Updates are installed during maintenance windows (you define them)
- Always On WorkSpaces: default is from 00h00 to 04h00 on Sunday morning
- AutoStop WorkSpaces: automatically starts once a month to install updates.
- Manual maintenance window: You define your windows and perform maintenance.

## Amazon WorkSpaces Cross Region Redirection:

- We have the users connect from primary region to secondary region to connect to Amazon WorkSpaces.
- If it is integrated with AWS Managed Microsof AD, then we need to use AD connector in the secondary region.
- However, the data between the primary and failover region for WorkSpace is not in sync since this is a region specific service.
  - For persistent data using Amazon WorkDocs.

### Amazon WorkSpaces IP Access Control Groups:

- Similar to security groups for Amazon WorkSpaces.
- List of IP addresses / CIDR address ranges that users are authorized to connect from.
- If users access WorkSpaces through VPN or NAT, the IP Access Control Group must authorize the public IP of these.
# Migration services

## Application Directory Services

- Plan migration projects by gathering information about on-premises data centers.
- Server utilization data and dependency mapping are important for migrations.

There are two kinds of `Application Discovery Services:`

### Agentless discovery (Application Discovery Agentless Connector):
- Open Virtual Appliance (OVA) package that can be deployed to a VMware host
- VM inventory, configuration, and performance history such as CPU, memory, and disk usage
- OS agnostic

### Agent-based discovery:

- system configuration, system performance, running processes, and details of the network connections between systems
- Supports Microsoft Server, Amazon Linux, Ubuntu, RedHat, CentOS, SUSE...

Note:
: - Resulting data can be exported as CSV or viewed within AWS Migration Hub.
: - Data can be explorer using pre-defined queries in Amazon Athena.

## Migration Hub Data Exploration:

- Allows you to use Amazon Athena to analyze data collected from on-premises servers using discovery.
- Data is automatically stored in S3 buckets at regular intervals.
- Use pre-defined or custom queries to analyze data using Athena.
- **Example:** Type of processes running on each server.
- Ability to upload additional data sources such as Configuration Management Database (CMDB) exports.
- Integrate data with QuickSight to visualize data.
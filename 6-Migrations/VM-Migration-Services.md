# Migration services

## Application Discovery Services

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
: - Data can be explored using pre-defined queries in Amazon Athena.

## Migration Hub Data Exploration:

- Allows you to use Amazon Athena to analyze data collected from on-premises servers using discovery.
- Data is automatically stored in S3 buckets at regular intervals.
- Use pre-defined or custom queries to analyze data using Athena.
- **Example:** Type of processes running on each server.
- Ability to upload additional data sources such as Configuration Management Database (CMDB) exports.
- Integrate data with QuickSight to visualize data.

## AWS Application Migration Service (MGN):

- Replacement of AWS Server Migration Service.
- Lift and Shift solution (rehost) which simplifies migration to AWS.
- Converts your physical, virtual and cloud based servers to run natively on AWS.

### How does the process work?

- We need to create a staging environment using AWS Application Migration Service.
- Then we install the Replication Agent on the on-premises servers.
- The replication agent continuously replicates the data onto the staging environment which will correspond to an EC2 instance
  and EBS volumes.
- When the data replication is complete, we can perform cut-over to production environment with large sized EC2 instances.

### Architecture diagram:

![AWS MGN](https://d2908q01vomqb2.cloudfront.net/da4b9237bacccdf19c0760cab7aec4a8359010b0/2021/04/15/2021-aws-mgn-how-it-works.jpg)

**Reference docs:** [Blog](https://aws.amazon.com/blogs/aws/how-to-use-the-new-aws-application-migration-service-for-lift-and-shift-migrations/) for reference.

## AWS Elastic Disaster Recovery (DRS):

- Quickly and easily recover physical, virtual and cloud based servers on AWS.
- Example: Protect your most critical databases from ransomware attack..
- Continuous block level replication for your servers.
- The architecture is pretty much similar to AWS Application Migration Service.
- It requires a replication agent to run on on-premises servers.
- The replication agent will continuously perform replication of data every 1 second in cloud.
- In case of disaster recovery event, we can cutover to fully blown production environment.

### Architecture diagrams:

Here are some architecture diagrams for reference.

1. ![DRS-On-premise-Scenario](https://d2908q01vomqb2.cloudfront.net/e1822db470e60d090affd0956d743cb0e7cdf113/2022/05/04/AWS-Elastic-Disaster-Recovery-replicates-workloads-from-source-to-AWS-Region.png)
2. ![DRS-AWS-Cross-Region-Scenario](https://d2908q01vomqb2.cloudfront.net/da4b9237bacccdf19c0760cab7aec4a8359010b0/2022/11/17/DRS-Cross-Region-Diagram.jpg)

### Reference docs:

[DRS for On-prem](https://aws.amazon.com/blogs/storage/disaster-recovery-monitoring-of-aws-elastic-disaster-recovery/)

[DRS-For-AWS-Cross-Region](https://aws.amazon.com/blogs/aws/automated-in-aws-failback-for-aws-elastic-disaster-recovery/)
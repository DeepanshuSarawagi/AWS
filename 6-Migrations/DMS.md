# AWS Database Migration Service

## Introduction:

- Quickly and securely migrate databased to AWS. It is resilient and self-healing.
- The source database remains available during the migration.
- Supports:
  - **Homogeneous migrations:** Example oracle to RDS oracle.
  - **Heterogeneous migrations:** Example MS SQL to Aurora.
- Continuous data replication using CDC.
- You must create an EC2 instance to perform the replication tasks.

## DMS Sources and Targets:

### Sources:

- On-premise and EC2 instance databases: Oracle, MSSQL, MySQL, PostgreSQL, MariaDB, MongoDB, SAP, DB2.
- Azure SQL database.
- Amazon RDS: All including Aurora.
- Amazon S3
- DocumentDB.

### Targets:
- On-premise and EC2 instance databases: Oracle, MSSQL, MySQL, PostgreSQL, MariaDB, MongoDB, SAP, DB2.
- Amazon RDS including Aurora.
- RedShift.
- DynamoDB.
- S3.
- Kinesis Data Streams.
- OpenSearch service.
- DocumentDB.

## Schema Conversion Tool:

- Convert your database's schema from one engine to another engine.
- Example: OLTP (Oracle or SQL Server) to PostgreSQL, Aurora, MySQL.
- Example: OLAP (Teradata or Oracle) to Amazon RedShift.
- You dont need to use SCT if you are migrating to same database engine.
  - Example: Migrating from on-prem postgresql to RDS postgresql.

## DMS - Must know:

- Works over VPC Peering, VPN (site to site, software), Direct Connect Supports Full Load, Full Load + CDC, or CDC only 
- O**racle:**
  - Source: Supports TDE for the source using "BinaryReader"
  - Target: Supports BLOBs in tables that have a primary key, and TDE
- **OpenSearch:**
  - Source: does not exist
  - Target: possible to migrate from a relational database using DMS
  - Therefore, DMS cannot be used to replicate OpenSearch

## Snowball + Database Migration Service (DMS)
- Larger data migrations can include many terabytes of information.
- Can be limited due to network bandwidth or size of data
- AWS DMS can use Snowball Edge & Amazon S3 to speed up migration
- **Following stages:**
1. You use the AWS Schema Conversion Tool (AWS SCT) to extract the data locally and move it to an Edge device.
2. You ship the Edge device or devices back to AWS.
3. After AWS receives your shipment, the Edge device automatically loads its data into an Amazon S3 bucket.
4. AWS DMS takes the files and migrates the data to the target data store. If you are using change data capture (CDC), 
   those updates are written to the Amazon 53 bucket and then applied to the target data
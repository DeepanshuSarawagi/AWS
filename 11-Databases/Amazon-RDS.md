# Brief document on Amazon Relational Database Services

- This service helps to provision, scale and create relational databases.
- Available database engines
  - MySQL
  - MariaDB
  - Postgresql
  - Amazon Aurora
  - Oracle
  - SQL Server
  - IBM DB2

- Amazon Aurora uses the share cluster storage architecture. We have option to select
  the storage option.
- Benefits of Aurora is we are only billed for storage used and I/Os processed.
- however, other DB engines such as MariaDB, MySQL, Postgresql, Oracle, SQL Server
  we are billed for storage provisioned
- When Multi-AZ is configured, a secondary RDS instance is deployed in a secondary
  availability zone.
- When a production RDS instance is crashed/down, Amazon updates the DNS record to
  point the record to secondary RDS instance which is deployed in secondary AZ.
- The replication of data between primary and secondary DB instance is synchronous.
- During failure, RDS will update the DNS record to point to the secondary instane.
- RDS provides automatic backup feature.
- Amazon Aurora backtrack allows you to go back in time on the database to recover
  from the error.
- All the databases uses the EBS for storage, however, Amazon Aurora uses the shared
  cluster architecture.
- Using RDS Auto-scaling feature, the database instance storage can be scaled automatically.
- We need to specify the maximum storage threshold, i.e., to what maximum extent our database
  storage can scale automatically.
- RDS backups allows you to automatically takes backup
- Transaction logs are backed up every 5 minutes.
- ability to restore to any point right from 5 mins old to oldest backup.
- Data retention period is 7 days and it can be increased to 35 days.
- Snapshots are manual backup of database.
- Data retention of Snapshot can be as long as you want.
- The database instance classes are standard(m), memory optimized(r and x) and burstable(t).
- IAM authentication for PostgreSQL, MySQL and MariaDB.
- Authorization still happens with RDS.

### General Purpose SSD storage:
- Provides single digit millisecond latencies
- Cost effective
- SSD storage for primary data:
  - Minimum 20 GiB
  - Maximum 64 TiB (SQL Server 16 TiB)

### Provisioned IOPs:

- Minimum of 8000 IOPs
- Maximum of 80000 IOPs (SQL Server 40000 IOPs)
- SSD storage for primary data:
  - Minimum 100 GiB
  - Maximum 64 TiB (SQL Server 16 TiB)

### Horizontal Scaling of Amazon RDS:
- If the READ operation is more on the production database, then performance may
  take a hit. Hence, a Read Replica instance can be created by creating a snapshot
  of the primary instance to serve just the READ ONLY traffic. The data between the primary instance and the read
  replica instance is linked asynchronously.

## RDS Encryption:

### At Rest encryption:
 - Possibility to encrypt the data of master and read replica at rest using AWS KMS AES 256 encryption
 - If master is not encrypted, then read-replicas cannot be encrypted.
 - Encryption has to be defined at launch time.
 - Transparent Data Encryption available for Oracle and SQL Server.

### In-flight encryption:
 - SSL certificates to encrypt data to RDS in-flight.
 - Provide SSL options with trust certificate when connecting to database.

### Encrypting RDS backups:

 - Snapshots of un-encrypted databases are un-encrypted.
 - Can copy a snapshot into an encrypted one.

### How to encrypt an unencrypted database:

 - Create a snapshot of unencrypted database.
 - Make a copy of unencrypted snapshot and enable encryption.
 - Restore the database from the encrypted snapshot.
 - Update the database connection to the new encrypted database.

### Access Management:

 - IAM roles and policies can be used to control who can manage the database.
 - IAM authentication can be used to login to RDS MySQL and Postgres.
 - IAM Authentication token has a lifetime of 15 minutes.

### RDS Events:
- Get notified via SNS for events.

## RDS IAM Authentication:
- IAM authentication for PostgreSQL, MySQL and MariaDB.
- You dont need a password, just an IAM authentication token obtained using IAM and RDS API calls with a validity of 15 minutes.
- Network In/Out must be encrypted using SSL.
- IAM to centrally manage users instead of DB.
- Can leverage IAM roles and EC2 instance profile for easy integration.

## RDS For Oracle - Exam Tips:

### RDS Oracle Backups:
- Use RDS Backups for backups and restore to Amazon RDS for Oracle.
- Or use the Oracle RMAN (Recovery Manager) to back from Amazon RDS for Oracle and restore to Non-RDS oracle instance.

### Real Application Clusters:
- RDS for Oracle does not support RAC.
- RAC is working on Oracle on EC2 instances since we have full control.

- RDS for Oracle supports Transparent Data Encryption to encrypt data before its written to storage.
- DMS works on RDS oracle.

### RDS for MySQL:
- You can use the native `mysqldump` to migrate a MySQL RDS Db to Non-RDS.
- The external MySQL database can run on Amazon EC2 instance.

### RDS Proxy for Lambda:
- When using Lambda functions with RSD, it opens and maintains a database connection.
- This can result in a `TooManyConnections` exceptions.
- With `RDS Proxy`, you no longer need code to handle the cleaning up of idle connections and managing it.
- RDS Proxy supports IAM Authentication, DB Authentication and autoscaling.
- **Note:** Lambda function must have connectivity to Proxy.
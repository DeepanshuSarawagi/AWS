# AWS RDS Security

- KMS encryption at rest for underlying EBS volumes / snapshots.
- Transparent Data Encryption for Oracle and SQL server.
- SSL encryption to RDS is possible for all DB (in-flight).
- IAM authentication for MySQL, PostgreSQL and MariaDB.
- Authorization still happens within RDS.
- Can copy an un-encrypted RDS snapshot into an encrypted one.
- CloudTrail cannot be used within to track queries made within RDS. 

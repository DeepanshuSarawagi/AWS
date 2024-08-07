# Overview of AWS Glue service

- It is a managed ETL service.
- Used to prepare and transform data for analytics.
- Fully serverless service.
- It can Extract and transform data from S3 or RDS and load into Redshift for further analytics.

## Glue Data Catalog:
- Catalog of datasets.
- Glue Data Crawler will be used to collect the metadata from S3, DynamoDB, RDS or any JDBC compatible.
- Glue Data Crawler will then load the data into Data Catalog which will contain tables about the metadata.
- Glue Data Catalog can be used by Glue Jobs to perform ETL.
- Data Catalog can be used by Athena, Redshift Spectrum, Amazon EMR for data analytics.
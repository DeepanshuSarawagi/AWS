# Cloud Migrations

## The 6R:

### Rehosting: Called as Lift and Shift

- Simple migrations by rehosting on AWS (Applications, databases)
- No cloud optimizations being done, application is migrated as is.
- Upto 30% cloud savings.
- Can leverage AWS services such as AWS VM Import/Export, AWS Server Migration Service.

### Replatforming:

- **Example 1:** Migrate the on-prem Oracle to RDS Oracle to gain following cloud cost benefits on
  - Backup and restore features
  - Multi-AZ read replicas
- **Example 2:** Migrate your application to Elastic BeanStalk (Java with Tomcat)
- Not changing the core architecture but leveraging cloud optimizations.

### Repurchase: Called as Drop and Shop

- Moving to a different product while moving to the cloud.
- Often you move to the SaaS platform.
- Expensive in short team but quick to deploy.

### Refactoring / Re-architecting:

- Reimagining how the application is re-architected using Cloud native features.
- Driven by the needs of the business to add scale, features and performances.
- **Example:** Move an application to serverless architecture, use SNS/SQS, use S3.

### Retire:

- Turn off things you don't need (maybe as a result of Re-architecting)
- Helps with reducing the surface areas for attacks (more security)
- Save cost, maybe up to 10% to 20%
- Focus your attention on resources that must be

### Retain:

- Do nothing for now.
- It is still a decision to make in cloud migration.

![The 6R's](https://d2908q01vomqb2.cloudfront.net/c5b76da3e608d34edb07244cd9b875ee86906328/2022/03/02/Screen-Shot-2022-03-02-at-12.57.44-PM.png)

## AWS Cloud Adoption Readiness Tool:

- Helps organizations develop effective and effective plans for cloud migration and adoptions.
- Transforms your idea of moving to cloud into a detailed plan that follows AWS best practices.
- We need to answer set of questions across 6 different perspectives
  - Business
  - People
  - Security
  - Process
  - Platform
  - Operations
- Generates a custom report on your level of migration readiness.


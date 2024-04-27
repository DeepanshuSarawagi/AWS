# Amazon QuickSight

## Introduction:

- Serverless machine-learning powered business intelligence service to create interactive dashboards.
- Fast, automatically scalable, per-session pricing.
- **Use cases:**
  - Business Analytics
  - Building visualizations
  - Performing Adhoc analysis
  - Getting business insights using data
- Integrated with Aurora, RDS, Redshift, S3, Athena
- In-memory computation using SPICE engine if data is imported into QuickSight.
  - It doesnt work if Amazon QuickSight is connected to another database.
- **Enterprise Edition:** Possible to setup CLS (Column Level Security)
  - To prevent some column from getting displayed to some users if they dont have enough access rights.

![Amazon QuickSight Workflow](https://docs.aws.amazon.com/images/quicksight/latest/user/images/quicksight-workflow-overview.png)

## QuickSight Integrations:

![QuickSight Integrations](https://d2908q01vomqb2.cloudfront.net/b6692ea5df920cad691c20319a6fffd7a4a766b8/2021/06/29/bdb1341-image001.png)

## QuickSight Users and Groups:

- Define Users (Standard version) or Groups (Enterprise version).
  - These groups only exist within QuickSight, and not in IAM.
-  A dashboard is a read-only snapshot of analysis you can share.
  - Preserves the configuration of analysis (Filtering, parameters, controls, sort)
- You can share the dashboard with users or groups.
- To share a dashboard, it must be published first.
- Users who can view the dashboard would also get access to the underlying data.
# AWS CI/CD

For Continuous Integration we have the following AWS servicesL

- **CodeCommit:** Code repository to host the application code.
- **CodeBuild:** To build and test the code. Alternative to Jenkins CI server.
- **CodeDeploy:** Deploys the application on the server

The above three stages of pipeline can be orchestrated using **CodePipeline.**

![CodePipeline](https://docs.aws.amazon.com/images/whitepapers/latest/cicd_for_5g_networks_on_aws/images/cicd_5g3.png)

# Amazon CodeGuru

## Introduction:

- A ML powered service for `automated code reviews` and `application performance recommendation.`
- Provides two functionalities:
  - **CodeGuru Reviewer:** Automated code reviews for static code analysis.
    - Identify critical issues, security vulnerabilities, and hard-to-find bugs Example: common coding best practices, resource leaks, security detection, input validation
    - Uses Machine Learning and automated reasoning
    - Hard-learned lessons across millions of code reviews on 1000s of open-source and Amazon repositories
    - Supports Java and Python
    - Integrates with GitHub, Bitbucket, and AWS CodeCommit
  - **CodeGuru Profiler:** Recommendation about application performance. Detects and optimizes lines of code pre-production.
    - Helps understand the runtime behavior of your application
    - Example: identify if your application is consuming excessive CPU capacity on a logging routine
    - Features:
      - Identify and remove code inefficiencies
      - unirate application performance (eg, reduce CPU
      - Decrease compute costs
      - Provides heap summary (identify which objects using up memory)
      - Anomaly Detection
    - Support applications running on AWS or on-premise
    - Minimal overhead on application
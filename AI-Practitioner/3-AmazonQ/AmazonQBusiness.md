# AI-Practitioner/3-AmazonQ/AmazonQBusiness

## Introduction:
- Fully managed GenAI assistant for your employees.
- Based on your company's knowledge and data.
  - Answer questions, provide summaries, generate content, automate tasks.
  - Perform routine tasks.
- Built on Amazon Bedrock but we cant choose the underlying FM.

### Architecture:
- Data Connectors (Fully managed RAG) - connects to 40+ popular data sources.
- Built-in integration with following services:
  - Amazon S3, RDS, Aurora, WorkDocs, etc..
  - Microsoft 365, Salesforce, GDrive, Gmail, Slack, Sharepoint..
- Amazon Q will crawl these sources and perform tasks such as search and query them.
- Plugins—Allows you to interact with third-party services such as
  - Jira, ServiceNow, Zendesk, Salesforce

## Amazon Q Business - IAM Identity Center:

- Users can be authenticated through IAM identity center.
- Users receive responses generated only from the documents they have access to.
- Integrate IAM Identity Center with external Identity Providers.

## Admin Controls:
- Control and customize responses to your organization needs.
- Admin controls == Guardrails
  - Block specific words or topics.
- Respond only with internal information (vs external knowledge)
- Can setup Global controls and topic-level controls

Refer to following [AWS Blog on Amazon Q Business](https://aws.amazon.com/blogs/industries/unleashing-the-power-of-generative-ai-amazon-q-business-for-manufacturing-excellence/) for Generative AI.
![Amazon-Q-Business](https://d2908q01vomqb2.cloudfront.net/c5b76da3e608d34edb07244cd9b875ee86906328/2024/06/17/Amazon-Q-blog-1024x967.jpg)

## Amazon Q Apps (Q Business):
- Create GenAI powered apps without coding by using natural language.
- Create app based on company's internal data.

## Amazon Q Developer:
There are two use cases for Amazon Q Developer.

### Answer questions about AWS:

- Answer questions about the AWS documentation and AWS service selection.
- Answers questions about resources in your AWS account.
- Suggest CLI to run to make changes to your account.
- Helps you to do bills analysis, resolve errors and troubleshooting..

### AI Code Companion:
- AI code companion to help you code new applications (Similar to GitHub Copilot)
- Supports many languages.
- Ability to give real time code suggestions.
- Can perform security scan.
- Software agent to implement features, generate documentation for code, bootstrapping new projects.
- Integrates with IDE to help with your software development needs.
- Debugging, optimizations, improvements.

Following is the good use case referenced from AWS blog which gives us a guidance on how we can leverage Amazon Q Developer
for creating a customized coding companion.

![Customized-Coding-Companion](Amazon-Q-Developer-usecase.png)
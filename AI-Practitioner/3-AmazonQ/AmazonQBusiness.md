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

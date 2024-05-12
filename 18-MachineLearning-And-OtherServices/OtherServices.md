# Amazon Services - Good to know

## Amazon AppStream:

- Desktop application streaming service.
- Deliver to any computer without acquiring, provisioning infrastructure.
- The application is delivered from a web browser.

### Comparison between WorkSpaces and AppStream

| **WorkSpaces**                                               | **AppStream**                                                         |
|--------------------------------------------------------------|-----------------------------------------------------------------------|
| Fully managed VDI and desktop available                      | Stream a desktop application to web browsers (No need of VDI)         |
| The users connect to VDI and open native or WAM applications | Works with any device that has a web browser.                         |
| WorkSpaces are on-demand or always on                        | Allow to configure instance type per application type (CPU, RAM, GPU) |

## DeviceFarm

- Application testing service for your mobile and web applications.
- Test across real browsers and real mobile devices.
- Fully automated testing using framework.
- Improve the quality of web and mobile app.
- Generates videos and logs to document the issue encountered.
- Can remotely login to devices for debugging.

## Amazon Macie:

- Macie is a fully managed data security and data privacy service that uses machine learning and pattern matching to discover
  and protect sensitive data in AWS.
- Macie helps identity and alert you to ssensitive data, such as personally identifiable information. (PII)

## Amazon SES:

- Simple Email Service.
- Fully managed service to send emails securely, globally and at scale.
- Allows inbound/outbound emails.
- Reputation dashboard, performance insights, anti-spam feedback.
- Provides statistics such as email deliveries, bounces, feedbac kloop results email open
- Supports security such as `DomainKeys Identified Mail ` and `Sender Policy Framework`.
- **Flexible IP deployment:** shared, dedicated and customer-owned IPs. This is to send emails from a specific IP address.

### SES - Configuration sets:

- Configuration sets helps you customize and analyze your email send events.
- **Event destinations:**
  - **Kinesis Data Firehose:** receives metrics such as number of sends, deliveries, opens, clicks, bounces and complaints for each email.
  - **SNS:** for immediate feedback on bounce and complaint information.
- **IP Pool Management:** Use IP pools to send particular types of emails.
  - That is one IP pool set to send transactional emails.
  - Other IP pool set to send marketing emails.

## Amazon PinPoint:

- Scalable 2-Way outboubd/inbound marketing communication service.
- Supports email, SMS, push, voice, and in-app messaging.
- Ability to segment and personalize messages with the right content to customers.
- Possibility to receive replies.
- Scales to billions of messages per day.
- **Use cases:**
  - run campaigns by sending marketing
  - Bulk transactional SMS messages
- **Versus Amazon SNS or Amazon SES:**
  - In SNS and SES you manage each message's audience, content and delivery schedule.
  - In Amazon PinPoint, you create message templates, delivery schedules,highly-targeted segments and full campaigns.
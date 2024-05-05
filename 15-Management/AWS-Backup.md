# AWS Backup service

- Fully managed service
- Can take automated backup across almost all AWS services.
- Supports cross-region backups.
- Supports cross-account backups.
- Supports PITR for supported services.
- On demand and scheduled backups.
- tag-based backup policies.
- You create backup policies known as Backup Plans
  - Backup frequency (every 12 hours, daily, weekly, monthly, cron expression)
  - Backup window
  - Transition to Cold Storage (Never, Days, Weeks, Months, Years)
  - Retention Period (Always, Days, Weeks, Months, Years)

## AWS Backup Vault Lock:
- Enforce a WORM (Write Once Read Many) state for all the backups that you store in your AWS Backup Vault
- Additional layer of defense to protect your backups against:
  - Inadvertent or malicious delete operations
  - Updates that shorten or alter retention periods
- Even the root user cannot delete backups when enabled

### Architecture solution:

Centralized AWS Backup solution.

![AWS Backup Centralized](https://d2908q01vomqb2.cloudfront.net/e1822db470e60d090affd0956d743cb0e7cdf113/2021/07/28/Automate-centralized-backup-at-scale-across-AWS-services-using-AWS-Backup-1.jpg)

#### Reference docs

[Blog](https://aws.amazon.com/blogs/storage/automate-centralized-backup-at-scale-across-aws-services-using-aws-backup/)
for reference.
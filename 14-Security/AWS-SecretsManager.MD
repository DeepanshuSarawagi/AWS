# AWS Secrets Manager

- Only meant for storing secrets.
- Capability to force rotation of keys every X days.
- Automation to generate rotation of secrets using Lambda.
- Integration with Amazon RDS (MySQL, PostgreSQL, Aurora, RedShift, DocumentDB)
- Secrets are encrypted with KMS.
- Custom lambda function needs to be written rotating secrets for other AWS services.
- Resource based policy can be used for accessing secrets.
- Integration with other AWS services to pull secrets:
  - CloudFormation
  - EKS
  - ECS
  - Fargate
  - Parameter Store
  - EMR
  - CodeBuild

## Secrets Manager - Sharing across accounts:

Use case:

- We have a dev user in the developer account who wants to access secret in Account B 
  which is secured and encrypted using KMS key.

Solution:

- First thing to do is to allow the ```Dev``` user to perform KMS key:Decrypt using KMS key. And this can be achieved
  by attaching a resource based policy to KMS key.
- This KMS resource based policy should allow decrypt operation only if its invoked via service SecretsManager.

```json
{
  "Action": "kms:Decrypt",
  "kms:ViaService": "secretsmanager.{region}.amazonaws.com"
}
```
- As we can notice in above resource based policy snippet, we allow KMS decrypt operation only if its invoked via Service
  ```secrets manager```.
- Then, we attached a resource based policy to ```SecretsManager``` which allows ```Dev``` user from ```Dev Account``` to
  access the secret.

## Difference between SSM parameter store and Secrets manager:

### SSM Parameter store:
- Simple API
- No secret rotation.
- KMS encryption is optional.
- Can integrate with CloudFormation.
- Can pull a secrets manager secrets using SSM parameter store API call.

### Secrets manager:

- More expensive than parameter store.
- Automatic rotation of secrets using AWS Lambda.
- Lambda function is provided for RDS, RedShift and DocumentDB.
- KMS encryption is mandatory.
- Can integrate with CloudFormation.
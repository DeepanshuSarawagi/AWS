# S3 Object Lambda

- Use the AWS Lambda functions to change the object before it is retrieved by another application.
- Only one S3 bucket is needed, on top of which we create S3 Access Point and S3 Object Lambda Access Point.

## Use cases:
- Redacting PII for analytics or non-production environments.
- Converting across data formats, such as converting from XML to JSON.
- Resizing or watermarking images on the fly using the caller specific details such as the user who requested it.
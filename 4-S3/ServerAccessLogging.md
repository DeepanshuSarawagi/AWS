# Brief overview of server access logging in S3 buckets

- Server access logging will enable AWS S3 to write the access logs in the bucket
  whenever an object is accessed.
- It will log all the information about the request made to an object.
- All the access logs are stored in a S3 bucket.
- There should be specific permissions set when we enable the server access logging.
- When we enable the server access logging, we need to specify parameters
  such as
  target bucket - where we want to write the logs of our source bucket.
  prefix - The name which will be prefixed in every log file.
- Specific permissions group is required to deliver the log files to the target bucket.
- When server access logging is enabled using AWS management console, the enablement
  of logging automatically adds the Log Delivery Group to the ACL of the target
  buckets.
- **Source and target buckets should be in the same region.**

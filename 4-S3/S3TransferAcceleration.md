# Brief overview of transfer acceleration in AWS S3.

- Speedup long distance data transfer using transfer acceleration.
- The data to or from the S3 bucket can be accessed with better speed if transfer
  acceleration is enabled. It utilizes the AWS' CloudFront service which is a
  CDN service to deliver the contents across different regions from the Edge Locations.
- Additional cost would incur per gigabyte depending on which Edge Location used.
- Also there is an increased cost out of S3 either to the internet or to the another
  region again due to the Edge Location acceleration involved.
- Can be compatible with S3 Multi-part upload feature.
- Following S3 operations are not supported when Transfer Acceleration is enabled.
  - GET
  - DELETE Bucket
  - PUT Bucket
  - Cross region copies using PUT object - copy

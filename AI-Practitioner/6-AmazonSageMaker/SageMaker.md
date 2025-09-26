# SageMaker AI

## Introduction:
- Fully managed AI service for developers/data scientist to build ML models.
- Helpful in performing all the tasks and provision servers for ML models and training them, monitoring the performance of model.
- has built-in algorithms.
- has ability for Automatic Model Tuning.

## Model deployment and inference:

### Real-Time:
- One prediction at a time.
- Offers low latency.
- Max payload size of 6 MB.
- Processing time of max 60s.
- Fast near-instant predictions for mobile/web apps.

### Serverless:
- Idle period between traffic spikes.
- Max payload size of 4 MB.
- Processing time of max 60s.
- Can tolerate more latency (cold starts)

### Asynchronous:
- Asynchronous deployments for payloads more than 1 GB in size.
- Long time processing, max processing time of 1 hour.
- provides near real-time latency requirements.
- request and response are on S3.

### Batch deployments:
- Batch deployments are for predictions on entire dataset; request and response are on S3.
- Max payload of 100 MB per batch invocation.
- Max processing time of 1 hour.

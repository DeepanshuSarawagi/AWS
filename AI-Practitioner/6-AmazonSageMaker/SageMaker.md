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
- Asynchronous deployments for payloads more than `1 GB` in size.
- Long time processing, max processing time of 1 hour.
- provides `near real-time` latency requirements.
- request and response are on S3.

### Batch deployments:
- Batch deployments are for predictions on entire dataset; request and response are on S3.
- Max payload of 100 MB per batch invocation.
- Max processing time of 1 hour.

## SageMaker Studio:
- End-to-end development from a unified interface.
- Tune, deploy and train ML models.

## SageMaker Data Tools:

### Data Wrangler:
- Prepare tabular and image data for machine learning.
- Data preparation, transformation and feature engineering.
- Single interface for
  - Data selection
  - Cleansing
  - Exploration
  - Visualization
  - Processing
- SQL support
- Can also do Data Quality tool
- Can export data flow.

### Feature stores:
- Ingests features from a variety of sources.

### SageMaker Clarify:
- Evaluate Foundation Models.
- Give some tasks and Clarify will evaluate models.
- Use built-in datasets or BYO datasets.
- Built-in metrics and algorithms.
- **Model Explainability:**
  - Help understand how the model is working and why it is making certain predictions.
  - Debug predictions provided by the model.
  - Helps detect bias.

### Ground Truth:

- RLHF- Reinforcement Learning from Human Feedback.
- Align model to human preferences.
- Helps model review, customization and evaluation.

### ML Governance:
- 
# AI-Practitioner/1-Amazon-Bedrock-GenAI

- Build GenAI applications on AWS.
- Fully managed service.
- Keep control of your data used to train the model.
- Pay-per-use pricing model.
- Unified APIs
- Leverage wide array of foundation models.
- Features like RAG, LLM Agents
- Amazon Bedrock makes a copy of the foundation model, makes available only to you which you can
  train it with your own data.

## Foundation Model:
- Choose foundation model based on model requirements, performance, capabilities, constraints, compliance.
  - Level of customization, model size, inference options, licensing agreements, context windows, latency
- Smaller models are more cost effective but they have been trained on less data.

### Amazon Titan:
- High performing foundation model.
- Images, Texts, Multimodal choices.
- Can be customized with your own data.


### Custom models:

#### Fine-tuning:
- Provide labeled data to train a model to improve performance on specific tasks.

#### Distillation:
- Generate synthetic data from a large foundation model and use the synthetic data to fine-tune a smaller model.

#### Continued pre-training:
- Provide un-labeled data to pre-train a foundation model by familiarizing it with certain input types.


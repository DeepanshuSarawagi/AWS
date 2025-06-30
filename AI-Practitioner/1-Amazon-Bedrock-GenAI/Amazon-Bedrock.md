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

## Fine tuning a Model:
- Adapt a copy of foundation model with your own data.
- Fine tuning will change the weights of the base foundation model.
- Training data must:
  - Adhere to a specific format.
  - Be stored in Amazon S3.
- You must use `Provisioned Throughput` to fine tune a model.
- **Note:** Not all model can be fine tuned.

### Instruction-based fine tuning:
- Improves the performance on a pre-trained FM on a specific domain tasks.
  - Which means, the model is further trained on a particular field or area of knowledge.
- Instruction-based fine-tuning uses labeled examples that are prompt-response pairs.

### Continued pre-training:
- Provide un-labeled data to continue the training of a foundation model.
- Also called domain-adaptation fine tuning to make a model expert in specific domain.
- **Example:** Feeding the entire AWS documentation to a model to make it AWS expert.
- Can continue to train model as more data becomes available.

There are two subsets of `Instruction-based fine-tuning` a foundational model. 

#### Single-Turn Messaging:
- Part of `Instruction-based fine-tuning`.
- Provide context for the conversation.
- **messages:** An array of message objects, each containing:
  - **role:** Either user or assistant.
  - **content:** The text content of the message.

#### Multi-turn Messaging:
- To provide instruction-based fine-tuning for a conversation.
- Chatbots=Multi-turn environment.
- You must alternate between `user` and `assistant` roles.

### Fine-tuning good to know:

- Re-training an FM requires a higher budget.
- **Instruction-based fine tuning is usually cheaper since computations are less intense and amount of data required is usually less**
- It also requires experienced ML engineers to perform the task.
- You must prepare the data, perform fine-tuning, evaluate the model.
- Running a fine-tuned model is also more expensive since it requires provisioned throughput.

### Transfer Learning:


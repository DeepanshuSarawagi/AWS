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
- The broader concept of re-using a pre-trained model to adapt it to a new related task.
- Widely used for image classification.
- Useful for NLP models such as `BERT, GPT`.
- Fine-tuning is a specific kind of Transfer-Learning.

### Fine-tuning use cases:
- A chatbot designed with a particular persona or tone, or geared towards a specific-purpose(e.g., assisting customers, drafting ads)
- Train using more up-to-date informationt than what the model previously accessed.
- Training with exclusive data such as:
  - Customer emails/Messages
  - Records from customer service interaction.
- Targeted use cases such as:
  - Categorization
  - Assessing accuracy
 
## Evaluating a model:

### Automatic Evaluation:
- Evaluate a model for QA.
- Utilize the built-in task types:
  - Text summarization
  - Question and Answer
  - Text classification
  - open-ended text generation
- We can then specify the job to a task and supply a dataset to evaluate the model:
  - We can either use the `built-in` curated prompt dataset or `bring your own` prompt dataset.
- Once the prompt dataset is configured to the task type, benchmark is performed and scores are calculated automatically.

### Benchmark datasets:
- Curated collection of data designed specifically at evaluating the performance of LLMs.
- It supports wide range of topics, complexities, speeed, accuracy and efficiency.
- Some benchmark datasets allow you to very quickly detect any kind of bias and potential discrimination against a group of people.
- You can also create your own benchmark dataset that it specific to your business.

The Following illustration shows the flow to benchmark model evaluation.

![model-evaluation-flow](https://miro.medium.com/v2/resize:fit:836/1*b9k5iLw5Lo6NnN3O09uulQ.png)

### Automated metrics to evaluate an FM:
- ROUGE: Recall-Oriented Understudy for Gisting Evaluation
  - Evaluating automatic summarization and machine translation systems.
  - ROUGE-N: Measure the number of matching n-grams between reference and generated text.
    - Define how many words are matching between reference text and generated text.
  - ROUGE-L: Longest common subsequence between reference and generated text.
- BLEU: Bilingual Evaluation Understudy
  - Evaluate the quality of generated texxt, especially for translations.
  - Considers both precision and penalises brevity.
  - Looks at the combination of n-grams.
- BERTScore:
  - Semantic similarity between generated text.
    - Meaning, compare actual meaning of the text and ssee if meanings are similar.
  - Uses pre-trained BERT models `(Bidirectional Encoder Representations from Transformers)` to compare the contextualized embeddings of both texts and computes the cosine similarity between them.
  - Capable of cpaturing more nuance between the texts.
- Perplexity: How well the model predicts the next token. (lower is better)

Refer to the following image for the simple comparison between different evaluation scores.

![evaluation-methods](https://cdn.analyticsvidhya.com/wp-content/uploads/2025/04/1-1.webp)


## Amazon Bedrock - Guardrails:

- Control the interaction between users and Foundation Models.
- Filter undesirable and harmful content.
- Use it to remove any PII.
- Enhanced privacy.
- Reduce hallucinations.
- Ability to create multiple Guardrails and monitor and analyze user inputs that can violate the Guardrails.

## Amazon Bedrock - Agents:

 Instead of performing response to prompts, the model can as well start thinking and perform multi-tasks. This is possible with the help of AI Agents.
An AI agent can perform following tasks.

- Manage and carry out various multi-step tasks related to infrastructure provisioning, application deployment, and operation
  activities.
- **Task coordination:** Perform tasks in the correct order and ensure information is passed correctly between tasks.
- Agents are configured to perform specific pre-defined action groups.
- It can integrate with other systems, services, databases and API to exchange data or initiate actions.
- Leverage RAG to retrieve information when necessary.

Following [architecture-reference](https://d1.awsstatic.com/solutions/guidance/architecture-diagrams/automating-tasks-using-agents-for-amazon-bedrock.pdf)
from AWS demonstrates how Amazon Bedrock Agents works. For easy access, please find the snippets for reference.

![Amazon-Bedrock-Agents1](Amazon-Bedrock-Agents-1.png)

![Amazon-Bedrock-Agents-2](Amazon-Bedrock-Agents-2.png)

## Amazon Bedrock - CloudWatch Integration:

- Model invocation logging.
  - Send logs of all invocations to CW or S3.
  - Can include text, images and embeddings.
  - Analyze further and build alerting using CW Logs Insights.

### CloudWatch Metrics:
- Published metrics from Bedrock to CloudWatch.
  - SOme metrics maybe related to Amazon Bedrock Guardrails. For example, metrics
  - Including `ContentFilteredCount`, which helps to see if Guardrails are functioning.
- Can build CloudWatch Alarms on top of Metrics.

## Amazon Bedrock - Pricing:

- **On-demand:** Pay as you go. Charged for text models, Embedding models, Image Models. Works only on base models.
- **Batch:** Multiple predictions at time. Can provide discount upto 50%.
- **Provisioned Throughput:** Purchase model units for a certain period of time. Throughput is max number of input/output tokens processed per minute.
                              Works with Base, Custom and Fine-tuned models.

### Model Improvement Techniques Cost Order:

#### Prompt Engineering:
- No model training needed (No additional computation or fine-tuning)

#### Retrieval Augmented Generation:
- Uses external knowledge-base. NO FM changes.

#### Instruction-based fine tuning:
- FM is fine-tuned with specific instructions.

#### Domain Adaptation Fine-tuning:
- Model is trained on a domain specific dataset.

Usually a smaller model is cheaper. 

Number of inputs and outputs tokens is the main driver of the cost.
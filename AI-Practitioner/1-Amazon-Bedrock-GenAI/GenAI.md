# AI-Practitioner/1-Amazon-Bedrock-GenAI

- Generative AI is a subset of Deep learning.
- Used to generate new data that is similar to the data it was to train on
  - Text
  - Image
  - Audio
  - Code
  - Video
- Unlabeled data is going to be trained into a foundational model.
- Upon successful training of foundational model, it would be capable enough to perform following tasks such as
  - Text generation
  - Text Extraction
  - Text Summarization
  - Information Extraction
  - Image Generation
  - Chatbot
  - Question Answering

## Foundation Model:
- To generate data, we must rely on a foundation model.
- Foundation models are trained on a wide variety of input data.
- The model may cost tens of millions of dollars to train.

## Large Language Models:
- Type of AI designed to generate human like text.
- One notable example is GPT-4o model, ChatGPT is built on this model.
- Usually very big models.
  - Billions of parameters
  - Trained on books, articles, texts and other forms of textual data.
- We usually interact with LLM by giving it a prompt.
- Then the model will leverage all the existing content it has learned from to generate new content.
  - The generated response could be Non-deterministic: Meaning it maybe different for every user who uses the same prompt.

## Tokenization:
- Process of converting raw text into sequence of tokens.
  - **Word based tokenization:** Text is split into individual words.
  - **Subword tokenization:** Some words can be split too. Helpful for longer words.
- Each token has an ID.
- **Context Window:** The number of tokens an LLM can consider when generating text.
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
- **Context Window:** 
  - The number of tokens an LLM can consider when generating text.
  - The larger the windows, the more information and coherence.
- Large context window requires more memory and processing power.
- First factor to look at when considering a model.

## Embeddings:
- Create vectors out of text, images or audio.
- Upon tokenization, every word will have a tokenID.
- Create a vector for each token.
- All these vectors are then going to be stored in a vector database.

### Why do we convert token into vectors?
- When we have vector with very high dimensionality, we can actually encode many features for one input token.
  - We can add meaning of the word, synthetic role, sentiment (positive or negative).
- Hence, a model is able to capture lot of information about the word.
- This is what is done in Vector Databases and RAG.
- This is how embedding models can be used with vector embeddings for a search application.
- Words with sematic relationship will have similar embeddings.

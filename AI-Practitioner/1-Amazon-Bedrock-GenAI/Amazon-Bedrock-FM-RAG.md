# RAG and Knowledge base:

## RAG - Retrieval-Augmented-Generation:
- Allows a foundation model to reference a datasource outside its training data.
- Below is the process:
  - Knowledge base is built and managed by Amazon Bedrock.
  - Knowledge base should have a datasource, for example Amazon S3.
  - User asks a question to FM.
    - It realizes that its not trained on the prompt user has given.
  - Hence, the FM performs a search in the knowledge base performing a lookup.
  - This knowledge base is backed up Vector database.
  - Bedrock takes care of creating Vector Embeddings in the database of your choice based on your choice of data.
  - FM model then retrieves the information from this knowledge base and responds to the user prompt.
- All this is going to go as an augmented prompt (Query + Retrieved text)
  - Retrieved text since the information is retrieved from the knowledge base which is outside of the foundation model.
  - And this is called as augmented generation since the response has been augmented from the external data.
- Use where real-time data is needed to be fed to the foundation model.

![Amazon-Bedrock-Knowledge-Base](https://docs.aws.amazon.com/images/bedrock/latest/userguide/images/kb/rag-runtime.png)

Refer to the following [blog](https://docs.aws.amazon.com/bedrock/latest/userguide/kb-how-it-works.html) for further reading.

### RAG - Vector Databases:

- Vector databases on Amazon Bedrock can be of several kinds backed by:
  - Amazon OpenSearch
  - Amazon Aurora
  - Pinecone
  - MongoDB
  - Redis
- **Embedding Models:** Converts the data into vectors. Could be `Amazon Titan` or `Cohere`.
- Amazon S3 will contain the document chunks.
- These document chunks will be fed into Embeddings Model.
- Embedding Models will generate the vectors from this S3 datasource and place it in the vector database.

### Amazon OpenSearch Service: 
- Most preferred database for vector embeddings. Search and Analytics database.
- Used for real time similarity queries, stores millions of vector embeddigs, scalable index management and fast nearest-neighbor search capability.

### Amazon DocumentDB:
- Used for real time similarity queries, stores millions of vector embeddigs.

### Amazon Aurora and RDS for PostgreSQL: 
- Relational database.

### Amazon Neptune:
- Graph database.

## RAG Data Sources:
- S3
- Confluence
- MS SharePoint
- Salesforce
- Web Pages

## Use cases:
- Customer Service Chatbot:
  - Knowledge base - products, features, specifications, troubleshooting guides and FAQs
  - RAG Application - chatbot that can answer custom queries
- Legal Search and Analysis:
  - Knowkedge base: laws, regulations, case precedents, legal opinions, and expert analysis.

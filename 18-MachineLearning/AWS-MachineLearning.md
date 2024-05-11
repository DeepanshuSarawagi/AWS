## Machine Learning Services

### Amazon Rekognition:

- Find objects, people, text, scenes in images and videos.
- Facial Analysis and Facial Recognition.
- Create a database of familar faces or compare against the database of celebrities.

**Use cases:**
- Image and video labeling
- Content moderation
- Text detection
- Face detection and analysis (Gender, age, rage, emotions..)
- Face search and verification
- Celebrity detection
- Pathing (Ex: for sports game analysis)

#### Content Moderation:

- Detect content that is inappropriate, unwanted or abusive (image and videos) in social media.
- Used in social media, broadcast media, advertising and e-commerce solutions to create a safe user experience.
- Flag sensitive content for manual review in Amazon Augmented AI.

### Amazon Transcribe:

- Automatically convert speech to text.
- Uses a deep learning process called `automatic speech recognition (ASR)` to automatically convert speech to text quickly
  and accurately.
- Automatically remove **Personally Identifiable Information using Redaction.**
- **Supports Automatic Language Identification for multi-lingual audio.**
- **Use cases:**
  - Transcribe customer service calls.
  - Automated closed captioning and subtitling.
  - Generate metadata for media assets to create a fully searchable archive.
- 

### Amazon Polly:

- It is oppposite of AWS Transcribe.
- Use text into speech using ML.
- Uses Lexicon and SSML.
- Customize the pronunciation of words with Pronunciation lexicons
  - Acronyms: AWS => "Amazon Web Services"
  - Upload the lexicons and use them in the SynthesizeSpeech operation
- Generate speech from plain text or from documents marked up with Speech Synthesis Markup Language (SSML) - 
  - enables more customization emphasizing specific words or phrases using phonetic pronunciation
  - Including breathing sounds, whispering using the Newscaster speaking style.

### Amazon Translate:

- Used for natural language translation.
- Allows you to localize content such as website and applications for international users and to easily translate large
  volumes of text easily.

### Amazon lex + Connect:

#### Amazon lex:

- Same technology that powers Alexa.
- Automatic Speech Recognition to convert speech to text.
- Natural language understanding to understand the intent of text, callers.
- Helps build chatbots, call center bots.

#### Amazon Connect:

- Receive calls, create contact flows, cloud-based virtual contact center.
- Can integrate with other CRM systems or AWS.
- 80% cheaper than traditional contact center solutions.

### Amazon SageMaker:

- Fully managed service to build ML Models.
- Typically difficult to process in on place plus we need to provision servers.

### Amazon Forecast:

- Fully managed service that uses ML to deliver forecast on data provided.
- Example: Predict future sales of a product.
- Reduce forecasting time from months to hours.
- **Use cases:**
  - Product demand planning
  - Resource planning
  - Financial planning

### Amazon Kendra:

- Fully managed document search service. 
- Extract answers from within a document.
  - Text
  - HTML
  - Word
  - Powerpoint
  - FAQs
  - pdf
- Natural language search capability.
- Knowledge index ML model.
- Ability to fine-tune search results.

### Amazon Comprehend:

- For Natural Language Processing
- Fully managed and serverless service.
- Uses machine learning to find insights and relationships in texts:
  - Language of the text
  - Extracts key phrases, places, people, brands, or events
  - Understands how positive or negative the text is
  - Analyzes text using tokenization and parts of speech
  - Automatically organizes a collection of text files by topic
- **Use cases:**
  - Analyze customer interaction emails to find what leads to positive or negative experience.
  - Helps to deliver the business insights based on customer experience.
  - Create and group articles by topic that Comprehend will uncover.

### Amazon Comprehend Medical:

- Amazon Comprehend Medical detects and returns useful information in unstructured clinical text:
  - Physician's notes
  - Discharge summaries
  - Test results
  - Case notes
- Uses NLP to detect Protected Health Information (PHI) - `DetectPHI API`
- Store your documents in Amazon S3, analyze real-time data with Kinesis Data Firehose, or use Amazon Transcribe to 
  transcribe patient narratives into text that can be analyzed by Amazon Comprehend Medical.

### Amazon Personalize:

Fully managed ML service with real-time personalized recommendations. Example, product recommendations on Amazon.

### Amazon Textract:

Used to extract text using AI and ML from any scanned documents, forms, tables, images, PDFs.
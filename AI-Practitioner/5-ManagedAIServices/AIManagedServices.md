# AI Managed Services offered by AWS

## Amazon Comprehend:
- Used for Natural Language Processing.
- Uses ML to find insights and relationships in text.
  - Language of the text
  - Extracts people, phrases, brand, places or events
  - Understands how positive or negative the text is
  - Analyzes text using tokenization and parts of speech
  - Automatically organizes a collection of text files by categories
- Sample use cases:
  - Analyze customer interaction emails.
  - Create and group articles by topic that Comprehend will uncover.

### Named Entity Recognition:
- Extracts pre-defined general purpose entities like people, places, organizations, dates, and other standard categories from text.

### Custom Entity Recognition:
- Option to make Comprehend recognise custom entities.
- Analyze text for specific terms and noun-based phrases.
- Extract terms like policy numbers or phrases that imply customer escalation, anything specific to your business.
- Train the model with custom data such as list of entities and documents that contain them.

## Amazon Translate:
- Natural and accurate language translation.
- Allows you to localize content such as websites and applications for international users, and to easily translate large
  volumes of text efficiently.

## Amazon Transcribe:
- Automatically convert speech to text.
- Uses a deep learning process called `automatic speech recognition` (ASR) to convert speech to text quickly and accurately.
- Automatically remove PII using Redaction.
- Supports Automation Language Identification for multi-lingual audio.
- **Use cases:**
  - transcribe customer service calls.
  - automate closed captioning and subtitling
  - generate metadata for media assets to create a fully searchable archive.

### Improving Accuracy:
- Allows Transcribe to capture domain-specific or non-standard terms (technical terms, acronyms, jargons)
- **Custom Vocabularies**(For words)
  - Add specific words, phrases, domain-specific terms
  - Good for brand names and acronyms
  - Increase recognition of new words by providing hits (such as pronunciation)
- **Custom Language Models**(For context)
  - Train Transcribe model on your domain-specific data.
  - Good for transcribing large volumes of domain-specific speech.
  - Learn the context associated with a given word.
- Use above both for the highest transcription accuracy.

### Toxicity Detection:
- ML powered Voice based toxicity detection capability.
- Leverages speech cues: tone and pitch and, text-based cues.


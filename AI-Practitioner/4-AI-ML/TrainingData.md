# Training Data

Training data in context of ML is to train the model with data. If data is not relevant, it can impact the output.

- Most critical stage to build a model.
- Several options to model our data, which will impact the types of algorithms we can use to train our models.
- Data can be classified into different types:
  - Labeled vs Unlabeled data.
  - Structured vs Unstructured data.

## Labeled Data:
- Data includes both input features and output labels.
- Example: dataset with images of animals where each image is labeled with corresponding animal type.
- Use case: Supervised learning, where the model is trained to map inputs to known outputs.

## Unlabeled Data:
- Data includes only input features without any output labels.
- Example: a collection of images without any associated labels.
- use case: Unsupervised learning, where the model tries to find patterns or structures in the data.

## Structured Data:
- Data is organized in a structured format, often in rows and columns. (Like Excel)
- Tabular data:
  - Data is arranged in a table with rows representing records and columns representing features.
  - Example: Customers database with fields such as name, age, and total purchase amount.
- Time Series Data:
  - Example: stock price of the company, data recorded/collected at successive points in time.
 
## Unstructured Data:
- Data that doesn't follow a specific structure and is often text-heavy or multimedia content.
- Text Data:
  - Unstructured text such as articles, social media posts or customer reviews.
  - Example: a collection of product reviews from an e-commerce website.
- Image Data:
  - Data in the form of images which can vary widely in format and content.

## ML Algorithms:

### Supervised Learning:
- Learn a mapping function that can predict the output for new unseen input data.
- Needs labeled data: very powerful; but difficult to perform on millions of datapoints.

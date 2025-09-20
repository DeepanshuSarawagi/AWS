# Training Data

Training data in context of ML is to train the model with data. If data is not relevant, it can impact the output.

- Most critical stage to build a model.
- Several options to model our data, which will impact the types of algorithms we can use to train our models.
- Data can be classified into different types:
  - Labeled vs Unlabeled data.
  - Structured vs Unstructured data.

## Labeled Data:
- Data includes both input features and output labels.
- **Example:** dataset with images of animals where each image is labeled with corresponding animal type.
- **Use case:** Supervised learning, where the model is trained to map inputs to known outputs.

## Unlabeled Data:
- Data includes only input features without any output labels.
- **Example:** a collection of images without any associated labels.
- **Use case:** Unsupervised learning, where the model tries to find patterns or structures in the data.

## Structured Data:
- Data is organized in a structured format, often in rows and columns. (Like Excel)
- **Tabular data:**
  - Data is arranged in a table with rows representing records and columns representing features.
  - **Example:** Customers database with fields such as name, age, and total purchase amount.
- **Time Series Data:**
  - **Example:** stock price of the company, data recorded/collected at successive points in time.
 
## Unstructured Data:
- Data that doesn't follow a specific structure and is often text-heavy or multimedia content.
- **Text Data:**
  - Unstructured text such as articles, social media posts or customer reviews.
  - **Example:** a collection of product reviews from an e-commerce website.
- **Image Data:**
  - Data in the form of images which can vary widely in format and content.

## ML Algorithms:

### Supervised Learning:
- Learn a mapping function that can predict the output for new unseen input data.
- Needs labeled data: very powerful; but difficult to perform on millions of datapoints.
There are two kinds of models:

#### Linear Regression:
- This is basically performed on a single-set (kind) of data, even though there could be millions of data points.
- Used to predict numeric value based on input-data.
- The output variable is continuous meaning it can take any value within the range.
- Use cases: Used in the case when the goal is to predict any real value or quantity.
- **Examples:**
  - Predicting house prices.
  - Stock price prediction
  - Predict weather forecasting

Note:

: These examples are a two-dimension regression but there can be more complex dimensional regression examples.

![Supervised-Learning-Linear-Regression](https://doimages.nyc3.cdn.digitaloceanspaces.com/002Blog/Simple%20linear%20regression.png)

Reference: [Digital-Ocean-Blog](https://www.digitalocean.com/resources/articles/what-is-linear-regression)

#### Classification:
- Classification is a supervised learning task where a model learns to assign labels (or classes) to input data. 
- The goal is to build a decision boundary that separates the data points into distinct classes based on the input features.
- Used to predict between different categories. (Fraud, image classification, customer retention, diagnostics)
- **Examples:**
  - Binary classification: Classify emails is `spam` or `not spam`.
    - Train a classification model based on emails in inbox classifying as spam or not spam.
    - hence, based on labels, the classification model, the incoming model can be used to mark emails as spam.
  - Multi-class classification: Classify different kinds of animals in zoo as `mammal, bird, reptiles`.
  - Multi-label classification: Assign more than one label. Example, a movie can be labeled as both `action` and `comedy`.

Most common ML algorithm is `K-Nn -- K-Nearest neighbors` model.

![Classification](https://miro.medium.com/v2/resize:fit:942/format:webp/1*s3GqPfKY_kphH9HKmNoSIA.png)

Reference from following [medium-blog](https://medium.com/@aakash013/master-supervised-learning-with-top-classification-techniques-af870f710c82)

#### Training vs Validation vs Test set:

**Training:**
- Used to train the model.
- Typically, 60-80% of the data set.
- Example: 800 labeled images from the dataset of 1000 images.

**Validation:**
- Used to tune model parameters and validate performance.
- Typically, 10-20% of dataset. Tune the settings of algorithm to make it more efficient.
- Example: 100 labeled images for the hyperparameter tuning.

**Test set:**
- Used to evaluate the final performance of the model.
- Typically 10-20% of the dataset.
- Example: 100 labeled images to test the model accuracy.

#### Feature Engineering:
- The process of using domain knowledge to transform raw data into meaningful features.
- Helps enhance the performance of machine learning models.
- Techniques:
  - **Feature Extraction:** Extracting useful information from raw data such as deriving age from data of birth.
  - **Feature Selection:** Selecting a subset of relevant features, like choosing important predictors in a regression model.
  - **Feature Transformation:** Transforming data for better model performance, such as normalizing numerical data.
- Particularly meaningful for supervised learning.

**Example:** 
: A table has column with fields related to customer name, DOB, purchase amount. Now, this data can be transformed
for meaningful learning for the model, if the DOB field can be converted to Age field, which would give better prediction.

##### Feature Engineering on Structured data:

Predicting house prices based on features like location, size of house, number of bedrooms, amenities, realty developer.

**Feature Engineering tasks:**
- Feature Creation: Deriving new features like `price per square foot`.
- Feature Selection: Identifying and retaining important features such as location, number of bedrooms.
- Feature Transformation: Normalizing features to ensure they are on a similar scale, which helps algorithms converge faster.

### Unsupervised Learning:


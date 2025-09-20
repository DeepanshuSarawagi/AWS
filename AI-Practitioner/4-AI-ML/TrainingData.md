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

##### Feature Engineering on Unstructured data:

Unstructured data such as text, images.
Example: Sentiment analysis of customer reviews.

**Feature Engineering tasks:**
- Text data: Converting text data into numerical features using techniques like TF-IDF or word embeddings.
- Image Data: Extracting features such as edges or textures using techniques like Convolutional neural networks.

### Unsupervised Learning:

Machine learning algorithms on unlabeled data.

- The goal is to discover patterns, structures, relationships within the input data.
- The machine must uncover and create the groups itself but human must still put labels on output groups.
- Common techniques include `Clustering`, `Anomaly Detection`, `Association Rule learning`.
- Clustering use cases: Customer segmentation, targeted marketing, recommender systems.

#### Clustering technique:
- Used to group similar datapoints into cluster based on their features.

- Example: Customer Segmentation:
  - Scenario: e-commerce company wants to segment its customers based on their purchase history for targeted marketing emails.
  - Data: A dataset containing purchase history.
  - Goal: Identify distinct group of customers based on purchase behavior.
  - Technique: K-means clustering.

![Clustering](https://developers.google.com/static/machine-learning/clustering/images/clustering_example.png)

#### Association Rule Learning Technique:

- Example: Market Basket Analysis.
  - Scenario: a supermarket wants to know which products are frequently bought together.
  - Data: transaction records from customer purchases.
  - Goal: Identify associations between products to optimize product placements and associations.
  - Technique: Apiori Algorithm

**Outcome:** The supermarket can place associated products together to boost sales.

![Association-Rule-Learning](https://media.licdn.com/dms/image/v2/D4D12AQE0yvWDBJZsyg/article-inline_image-shrink_1000_1488/B4DZUpmUl6HIAQ-/0/1740159667726?e=2147483647&v=beta&t=iCEfvcFlgE-YCsSuU2e3afS0zBAftD5_10gvrrQkUmc)

Reference from [LinkedIn-Blog](https://www.linkedin.com/pulse/unsupervised-learning-power-self-taught-machines-sobia-noor-mvfsf)

#### Anomaly Detection Technique:

- Example: Fraud Detection.
  - Scenario: Detect Fraudulent credit card transactions.
  - Data: Transaction data including amount, location, time.
  - Goal: Identify transactions that deviate significantly from typical behaviour.
  - Technique: Isolation Forest.

**Outcome:** The system flags potentially fraudulent transaction for further investigation.

[//]: # (![Anomaly-Detection]&#40;https://miro.medium.com/v2/resize:fit:1400/format:webp/0*eNc-PZX1mFdqhF0V&#41;)

Blog on Anomaly detection [medium-blog](https://medium.com/@y.s.yoon/isolation-forest-anomaly-detection-identify-outliers-101123a9ff63)

### Semi-supervised Learning:

- Use a small amount of labeled data and large amount of unlabeled data to train the model.
- After that, the partial trained algorithm itself labels the unlabeled data.
- This is called pseudo-labeling.
- The model is then retrained on the resulting data mix without explicit programming.

### Self-Supervised Learning:
- Have a model generate pseudo-label for its own data without having humans label any data first.
- Then using pseudo-labels solve problems traditionally solved by Supervised Learning.
- Widely used in Natural Language Processing.

### Reinforcement Learning:
- A type of Machine Learning where an agent learns to make decisions by performing actions in an environment to maximize
  cumulative rewards.
- **Key concepts:**
  - **Agent:** The learner or decision maker
  - **Environment:** The external agent the system interacts with
  - **Action:** The choices made by the agent
  - **Reward:** The feedback from the environment based on the agent's actions.
  - **State:** The current situation of the environment
  - **Policy:** The strategy the agent uses to determine actions based on the state
- **Learning Process:**
  - The Agent observes the current state of the environment.
  - It selects an action based on its policy.
  - The environment transitions to a new state and provides a Reward.
  - The Agent updates its policy to improve future decisions.

#### Applications of Reinforcement Learning:

- **Gaming:** Teaching AI to play complex games.
- **Robotics:** Navigating and manipulating objects in dynamic environments.
- **Finance:** Portfolio management and trading strategies.
- **Healthcare:** Optimizing treatment plans.
- **Autonomous vehicles:** Path planning and decision-making.

### Reinforcement Learning from Human Feedback:
- Use human feedback to help ML models to self-learn more efficiently.
- As we know, in reinforcement learning there is a reward function
- `RLHF` incorporates human feedback in the reward function, to be more aligned with human goals, wants and needs.
  - First the model's responses are compared to human responses
  - Then, a human assesses the quality of the model's responses
- `RLHF` is used throughout GenAI applications including LLM models.
- `RLHF` significantly enhances the model performance.
- Example: grading text translations from "technically correct" to "human".

#### How does `RLHF` work?

**Example: Internal company knowledge chatbot**
- **Data Collection:**
  - Set of human generated prompts and responses are created.
- **Supervised fine tuning of a language model:**
  - Fine-tune an existing model with internal knowledge.
  - Then the model creates responses based on the human-generated prompts.
  - Responses are mathematically compared with human-generated answers.
- **Build a separate reward model:**
  - Humans can indicate which response they prefer from the same prompt.
  - The reward model can now estimate which how a human would prefer a prompt response.
- **Optimize the language model with the reward based model:**
  - Use the reward model as reward function for Reinforcement Learning

Refer to following RLHF process referenced from [AWS-Blog-On-RLHF](https://aws.amazon.com/what-is/reinforcement-learning-from-human-feedback/)

![RLHF-Process](https://d2908q01vomqb2.cloudfront.net/f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59/2023/08/31/ML-14874_image001.jpg)


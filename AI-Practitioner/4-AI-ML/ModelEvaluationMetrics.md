# Model Evaluation Metrics

## Binary Classification Example
- Lets consider the email classification example, which classifies emails as `spam` or `not spam` based on labels.
- Then the model is going to make the predictions and compare the true values with what was predicted.
  - This creates a confusion matrix.

![confusion-matrix](https://cdn.prod.website-files.com/660ef16a9e0687d9cc27474a/662c42677529a0f4e97e4f9c_644aec2628bc14d83ca873a2_class_guide_cm10.png)

### Precision:

- In a confusion matrix, precision is the ratio of true positive predictions to the total number of positive predictions, 
answering the question: `"Of all the instances the model predicted as positive, how many were actually positive?"`
- Mathematically, it is calculated as TP / (TP + FP), where TP is True Positives and FP is False Positives.

### Recall:

- In a confusion matrix, recall (also known as sensitivity or true positive rate) measures the proportion of actual positive instances that were correctly identified by a classification model.
- It is calculated as the number of True Positives (TP) divided by the sum of True Positives and False Negatives (FN), using the formula: TP / (TP + FN). 
- A high recall indicates the model is good at detecting all positive cases, which is crucial for applications like disease detection where missing a positive case has serious consequences.

### F1 score:

- The F1 score is a single performance metric, derived from a confusion matrix, that combines precision and recall using their harmonic mean. 
- It is particularly useful for imbalanced datasets where a model needs to perform well on both positive and negative classes, 
  providing a balanced measure of accuracy when one metric might otherwise be misleading.
- **Formula:** $2 * (Precision * Recall) / (Precision + Recall)$

### Accuracy:

- The Accuracy score in a confusion matrix represents the overall proportion of correctly classified instances (both positive and negative) out of the total number of predictions made. 
- It's calculated as the sum of True Positives (TP) and True Negatives (TN) divided by the total number of classifications (TP + TN + False Positives (FP) + False Negatives (FN)). 
- While simple and intuitive, accuracy can be misleading on imbalanced datasets, where one class significantly outnumbers others.
- **Formula:** $(TP + TN) / (TP + TN + FP + FN)$

### Note:

- Confusion matrix can be multi-dimension too.
- It is the best way to evaluate the performance of a model that does classification.
- Metrics:
  - **Precision:** Best when false positives are costly.
  - **Recall:** Best when false negatives are costly.
  - **F1:** Best when you want a balance between precision and recall; especially in imbalanced datasets.
  - **Accuracy:** Best for balanced datasets.

## AUC-ROC:

AUC-ROC is `Area Under the Curve-Receiver Operator characteristic Curve`

- An AUC-ROC curve evaluates binary classification models by plotting the True Positive Rate (TPR) against the False Positive Rate (FPR) at various thresholds. 
- The Area Under the Curve (AUC) is a single-value metric summarizing the ROC curve, representing the model's overall ability to distinguish between positive and negative classes. 
- A perfect model has an AUC of 1.0, while random guessing results in an AUC of 0.5.

### What is the ROC Curve?

**It's a performance graph:** The ROC curve is a graph that shows a classifier's performance across all possible classification thresholds.

**It plots two key metrics:**

- True Positive Rate (TPR): (also known as Sensitivity or Recall): The proportion of actual positive cases that the model correctly identifies as positive.

- False Positive Rate (FPR): The proportion of actual negative cases that the model incorrectly identifies as positive.

- It separates signal from noise: By varying the threshold for classifying cases, the ROC curve helps visualize how well 
the model distinguishes between "signal" (true positives) and "noise" (false positives).

### What is the AUC?

- It's the area under the ROC curve: The AUC is the area enclosed by the ROC curve and the x-axis.

- It's a single performance score: It provides a comprehensive measure of the model's ability to differentiate between positive and negative classes.

- In more concrete terms, a spam classifier with AUC of 1.0 always assigns a random spam email a higher probability of being spam than a random legitimate email. 
- The actual classification of each email depends on the threshold that you choose.

#### Interpretation of AUC values:

**AUC = 1.0:** The model perfectly distinguishes between classes.
**AUC = 0.5:** The model's performance is no better than random guessing.
**AUC < 0.5:** The model is performing worse than random guessing.
**Higher AUC:** Indicates better model performance.


AUC is a useful measure for comparing the performance of two different models, as long as the dataset is roughly balanced. 
The model with greater area under the curve is generally the better one.

In the following model performance comparison, model performance in ImageA with AUC = 0.93 is better when compared to
model performance in ImageB with AUC = 0.65.

![Better-AUC-ROC](https://developers.google.com/static/machine-learning/crash-course/images/auc_0-93.png)

![Lower-AUC-ROC](https://developers.google.com/static/machine-learning/crash-course/images/auc_0-65.png)


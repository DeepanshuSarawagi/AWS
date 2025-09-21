# Model Evaluation Metrics

## Binary Classification Example
- Lets consider the email classification example, which classifies emails as `spam` or `not spam` based on labels.
- Then the model is going to make the predictions and compare the true values with what was predicted.
  - This creates a confusion matrix.

![confusion-matrix](https://cdn.prod.website-files.com/660ef16a9e0687d9cc27474a/662c42677529a0f4e97e4f9c_644aec2628bc14d83ca873a2_class_guide_cm10.png)

### Precision:

- In a confusion matrix, precision is the ratio of true positive predictions to the total number of positive predictions, 
answering the question: "Of all the instances the model predicted as positive, how many were actually positive?"
- Mathematically, it is calculated as TP / (TP + FP), where TP is True Positives and FP is False Positives.

### Recall:

- In a confusion matrix, recall (also known as sensitivity or true positive rate) measures the proportion of actual positive instances that were correctly identified by a classification model.
- It is calculated as the number of True Positives (TP) divided by the sum of True Positives and False Negatives (FN), using the formula: TP / (TP + FN). 
- A high recall indicates the model is good at detecting all positive cases, which is crucial for applications like disease detection where missing a positive case has serious consequences.
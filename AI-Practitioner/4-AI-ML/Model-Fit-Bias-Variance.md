# Model Fit, Bias and Variance

## Model Fit:

- In case your model has poor performance, you need to look at its fit.
- **Overfitting:**
  - Performs well on the training data
  - Doesn't perform well on the evaluation data
- **Underfitting:**
  - Model performs poorly on training data
  - Could be a problem of having a model too simple or poor data features.
- **Balanced:**
  - Neither overfitting nor underfitting

## Bias:

- Difference or error between predicted and actual value.
- Occurs due to the wrong choice in the ML process.

### High Bias:
- The model doesn't closely match the training data.
- Example: Linear regression function on a non-linear dataset.
- Considered as underfitting.

### Reducing the Bias:
- Use a more complex model.
- Increase the number of features.

## Variance:
- How much the performance of a model changes if trained on a different dataset that has similar distribution.

### High Variance:
- Model is very sensitive to changes in the training data.
- This is the case when overfitting; performs well on training data but poorly on unseen test data.

### Reducing the variance:
- Feature selection (more important features)
- Split into training and test datasets multiple times.

Read the following medium blog on [Bias-And-Variance](https://python.plainenglish.io/bias-variance-trade-off-in-machine-learning-74b51295689e)

![Bias-And-Variance](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*73rrO1LlrJ7Ns-19WElVWw.png)

**Model performance based on Bias and Variance:**

- High Bias and High Variance (Worst Case)
- Low Bias and Low Variance (Best Case)
- Low Bias and High Variance (Overfitting)
- High Bias and Low Variance (Underfitting)

## Hyperparameters tuning:

### Hyperparameter:
- Settings that define the model structure and learning algorithm and process.
- Set before training begins.
- Example: Learning rate, batch size, number of epochs and regularization:
- **Learning Rate:** How fast you want to model to incorporate new data.
- **Batch Size:** How many data points to consider at a time.
- **Number of Epochs:** How many times you want to iterate over your model until it is converged to a good result.
- **Regularization:** How flexible the model should be.
- 
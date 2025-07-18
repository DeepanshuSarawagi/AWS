# AI-Practitioner/2-Prompt-Engineering

## Introduction to Prompt Engineering:

- Prompt gives little guidance and leaves a lot to model's interpretation.
- `Prompt Engineering` = developing, designing, and optimizing prompts to enhance the outputs of FMs for your needs.
- Improved prompt technique consists of:
  - **Instructions:** A task for the model to do
  - **Context:** External information to guide this model.
  - **Input data:** the input for which you want a response.
  - **Output indicator:** the output type or format.

## Negative Prompting:

- A technique where you explicitly instruct the model on what not to include or do in its response.
  - **Avoid unwanted content:** explicitly states what not to include, reducing the chances of irrelevant or inappropriate
      content.
  - **Maintain Focus:** helps the model stay on topic and not stray into area that are no useful or desired.
  - **Enhance Clarity:** prevents the use of complex terminology or detailed data, making the output clearer and more accessible.

## Prompt Performance Optimization:

- **System Prompts:** how the model should behave and reply.
- **Temperature (0-1):** creativity of the models output.
  - Low (ex: 0.2)- outputs are more conservative, repetitive, focused on most likely response.
  - High (ex: 1.0)- outputs are more diverse, creative, and unpredictable, maybe less coherent.
- **Top P:** Value is 0 to 1. Considers the most likely words as distribution.
  - Low P (0.25): consider the 25% of most likely words, will make a more coherent response.
  - High P (0.99): consider a broad range of possible words, possibly more creative and diverse outputs.
- **Top K:** limits the number of probable words
  - Low K (ex: 10): more coherent response, less probable words.
  - High K (ex: 500): more probable words, more diverse and creative.
- **Length:** maximum length of answer.
- **Stop Sequences:** tokens that signal the model to stop generating output.

### Prompt Latency:

- Latency is how fast the model responds.
- - Its impacted by a few parameters:
  - The model size.
  - The model type.
  - The number of tokens in the input.
  - The number of tokens in the output.
- Latency is not impacted by Top P, Top K, Temperature.

## Prompt Engineering Techniques:

### Zero-Shot Prompting:
- Present a task to the model without providing examples or explicit training for that specific task.
- You fully rely on the model's general knowledge.
- The larger and more capable the model, the more likely you will get good results.

### Few-shots Prompting:
- Provide examples of a task to the model to guide its output.
- we provide a few shots to the model to perform the task.
- If we provide one example, it is also called as single-shot or one-shot prompting.

### Chain of thought Prompting:
- Divide the task into a sequence of reasoning steps, leading to more structure and coherence.
- Using a sentence like `Think step by step` helps.
- Helpful when solving a problem as a human usually requires several steps.

### RAG Prompting:
- Combine the model's capability withexternal data sources to generate a more informed and contextually rich response.
- The initial prompt is then augmented with external information.
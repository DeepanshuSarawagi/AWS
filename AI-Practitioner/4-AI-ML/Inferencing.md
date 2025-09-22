# Inferencing

Inferencing is when model is making prediction on new data.

## Real Time:
- Systems have to make decisions quickly as soon as new data arrives.
- Speed is preferred over perfect accuracy.
- Example: chatbots

## Batch Inferencing:
- Large amount of data that is analyzed all at once.
- The response can take several mins, hours or even days.
- Speed of the results is usually not a concern, accuracy is.

## Inferencing at the Edge:
- Edge devices are usually devices with less computing power that are close to where data is generated,
  in places where internet connections can be limited.
- `Small Language Model`(SLM) on the Edge device
  - Runs on edge server like RaspberryPi.
  - Very low latency.
  - Low compute footprint.
  - Offline capability, local inference.
- `Large Language Model` on remote server
  - High latency
    - Since Edge device will make API calls to remote server where LLMs are deployed.
  - Requires Edge device to have Online capability
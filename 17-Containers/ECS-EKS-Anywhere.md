# Amazon ECS EKS Anywhere

## Amazon ECS Anywhere:

- Easily containers on customer managed infrastructure.
- Allows customers to deploy any native Amazon ECS tasks in any environment.
- Fully managed Amazon ECS control plane.
- We are going to leverage ECS Service, ECS Control Plane to manage the ECS tasks/containers on-premises.
  - For this we need to install ECS agent and SSM agent on the on-prem servers.
  - And then we need to specify `EXTERNAL` launch type for ECS services and tasks.
  - Therefore, the ECS agent will register with ECS cluster and SSM agent will register with SSM service.
  - Now we can start using the ECS service directly from console to launch the containers on-prem.

## Amazon EKS Anywhere:
- Create and operate Kubernetes cluster outside of AWS.
- Leverage the Amazon EKS Distro (AWS' bundled release of Kubernetes).
- Advantage:
  - Reduce support cost and avoid running 3rd party tool.
- Install using the EKS Anywhere installer.
- Optionally use the `EKS Connector` to connect the EKS Anywhere servers to AWS to leverage the EKS console.
- `Fully disconnected:` mode, no connection to AWS.
- `Fully connected/Partially disconnected:` Leverage the EKS console to manage EKS clusters on-prem.
- 
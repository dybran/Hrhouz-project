## Build Dockerfile and Publish to ECR

Create an S3 bucket for Terraform state storage.

__Workflows:__

__hrhouz-workflow.yml:__ This workflow performs the following actions in two stages:

- _Stage 1:_ Utilizes terraform to create an ECR repository on AWS.

- _Stage 2:_ Builds and pushes a Docker image to the newly created ECR repository.

__terraform-destroy.yml:__ This workflow destroys the infrastructure created by __hrhouz-workflow.yml__.

_Secrets:_

AWS_SECRET_ACCESS_KEY

AWS_ACCESS_KEY_ID

_Variables:_

AWS_REGION

ECR_REPOSITORY_NAME

__Note:__ To use this workflow, you need to configure the required secrets and variables in your GitHub environment.
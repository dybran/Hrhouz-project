## Build Dockerfile and Publish to ECR

__Workflows:__

__hrhouz-workflow.yml:__ This workflow performs the following actions in two stages:

__Stage 1:__ Utilizes Terraform to create an ECR repository on AWS.

__Stage 2:__ Builds and pushes a Docker image to the newly created ECR repository.

__terraform-destroy.yml:__ This workflow eliminates the infrastructure established by __hrhouz-workflow.yml.__

_Secrets:_

AWS_SECRET_ACCESS_KEY

AWS_ACCESS_KEY_ID

_Variables:_

AWS_REGION

ECR_REPOSITORY_NAME

__Note:__ To use this workflow, you need to configure the required secrets and variables in your GitHub environment.
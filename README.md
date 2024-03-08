## Build Dockerfile and Publish to ECR

Create an S3 bucket for Terraform state storage.

__Workflows:__

__hrhouz-workflow.yml:__ This workflow performs the following actions in two stages:

- _Stage 1:_ Utilizes terraform to create an ECR repository and EC2 instance and all needed network resources.

- _Stage 2:_ Builds and pushes a Docker image to the newly created ECR repository.


```
Secrets:

AWS_SECRET_ACCESS_KEY

AWS_ACCESS_KEY_ID

Variables:

AWS_REGION

ECR_REPOSITORY_NAME
```


__Note:__ To use this workflow, you need to configure the required secrets and variables in your GitHub environment.

## __Run containers on EC2 Instance__

SSH into the EC2 instance, create the __install.sh__ and __login-run.sh__ file and make it executable - (You can find them in the repository)

`sudo vi install.sh`

`sudo chmod +x install.sh`

and

`sudo vi login-run.sh`

`sudo chmod +x login-run.sh`

 Run the __install.sh__ file

 `./install.sh`

 Exit the instance and login again.

 Then run the __login-run.sh__ file

 `./login-run.sh <ECR_URL> <INSTANCE_IP>` `<ECR_IMAGE>`

 Access the parse sever using the IP address on port `4040`

 `INSTANCE_IP:4040`

 You can destroy the infrastructure created by __hrhouz-workflow.yml__ using the __Destroy Infrastructure Workflow__..
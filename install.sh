#!/bin/bash

# install docker and add user to the docker group
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#install the latest version of docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


# start and enable docker
sudo systemctl start docker && sudo systemctl enable docker

# Add docker to user group
sudo usermod -aG docker $USER

# Ensure Docker Engine installation
sudo docker run hello-world

# Install awscli
sudo apt install awscli -y

# # Authenticate docker with ECR
# aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin 939895954199.dkr.ecr.us-west-1.amazonaws.com/hrhouz-ecr

# # Docker pull and run
# docker pull 939895954199.dkr.ecr.us-west-1.amazonaws.com/hrhouz-ecr
# docker run -d -p 1337:80 939895954199.dkr.ecr.us-west-1.amazonaws.com/hrhouz-ecr:latest
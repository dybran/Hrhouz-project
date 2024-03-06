# Create an ECR repository
resource "aws_ecr_repository" "hrhouz-ecr" {
  name                 = "${var.name}-ecr"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}

# Find the latest Ubuntu AMI
data "aws_ami" "latest_ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.owner] # Canonical ID for Ubuntu AMIs
}

# Launch EC2 instance with IAM Role
resource "aws_instance" "hrhouz-server" {
  ami                  = data.aws_ami.latest_ubuntu.id
  instance_type        = var.inst-type
  subnet_id            = aws_subnet.hrhouz-subnet.id
  associate_public_ip_address = true
  key_name             = var.key-pair
  vpc_security_group_ids      = [aws_security_group.hrhouz-sg.id]

  





  iam_instance_profile = aws_iam_instance_profile.hrhouz-instance-profile.name

  tags = {
    Name = "hrhouz-server"
  }
}






# Create an ECR repository
resource "aws_ecr_repository" "hrhouz-ecr" {
  name                 = "${var.name}-ecr"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}

# Launch EC2 instance with IAM Role
resource "aws_instance" "hrhouz-server" {
  ami                  = var.ami
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






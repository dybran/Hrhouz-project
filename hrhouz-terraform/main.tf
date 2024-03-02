
# Create an EC2 instance
resource "aws_instance" "hrhouz-server" {
  ami           = "ami-02bfcfbf6fc7e8ce4"
  instance_type = var.instance-type
  key_name        = var.keypair
  security_groups = [aws_security_group.hrhouz_sg.name]
  iam_instance_profile = aws_iam_instance_profile.hrhouz.name

  tags = merge(
    var.tags,
    {
      Name = format("%s-ec2", var.name)
    }
  )
}

# Create an IAM instance profile and attach the EC2 role
resource "aws_iam_instance_profile" "hrhouz" {
  name = "hrhouz"
  role = aws_iam_role.ec2_role.name
}

# Create an ECR repository
resource "aws_ecr_repository" "hrhouz-ecr" {
  name = "hrhouz-ecr"
}

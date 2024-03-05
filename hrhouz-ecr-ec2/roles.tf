# IAM Role for ECR
resource "aws_iam_role" "ecr-role" {
  name = "${var.name}-ecr-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecr.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach an IAM policy to the ECR role
resource "aws_iam_role_policy_attachment" "ecr-policy-attachment" {
  role       = aws_iam_role.ecr-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}


# Create IAM Role for EC2 instance
resource "aws_iam_role" "hrhouz-ec2-role" {
  name               = "${var.name}-ec2-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Create IAM Instance Profile
resource "aws_iam_instance_profile" "hrhouz-instance-profile" {
  name = "hrhouz-instance-profile"
  role = aws_iam_role.hrhouz-ec2-role.name
}

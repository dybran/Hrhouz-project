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

# IAM role for EC2 to pull from ECR and AWS SSM to connect to EC2
resource "aws_iam_role" "ec2_role" {
  name               = "ec2_ecr_ssm_role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}


resource "aws_iam_policy" "ssm_session_policy" {
  name = "ec2_instance_ssm_session_policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ssmmessages:StartSession",
        "ssmmessages:SendCommand",
        "ssmmessages:ReceiveCommandOutput"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_session_access" {
  role = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ssm_session_policy.arn
}

resource "aws_iam_role_policy_attachment" "ec2_ecr_access" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}




resource "aws_iam_instance_profile" "hrhouz-instance-profile" {
  name = "hrhouz-instance-profile"
  role = aws_iam_role.ec2_role.name
}

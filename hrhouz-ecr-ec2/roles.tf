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


# IAM Role for SSM to Access EC2

resource "aws_iam_role" "ssm_role" {
  name               = "SSM_EC2_Access_Role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ssm.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_role_attachment" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# IAM Role for EC2 Instances

resource "aws_iam_role" "ec2_role" {
  name               = "EC2_Instance_Role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "EC2_Instance_Profile"
  role = aws_iam_role.ec2_role.name
}


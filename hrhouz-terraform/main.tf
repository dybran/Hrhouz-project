# Create an ECR repository
resource "aws_ecr_repository" "hrhouz-ecr" {
  name = "hrhouz-ecr"
}


# Create an ECS cluster
resource "aws_ecs_cluster" "hrhouz_cluster" {
  name = "hrhouz-cluster"
}

# Define the Task Definition (replace with your container image details)
resource "aws_ecs_task_definition" "hrhouz_task_definition" {
  family = "hrhouz-task-definition"
  cpu    = "256"
  memory = "512"

  
  container_definitions = <<EOF
[
  {
    "name": "hrhouz-container",
    "image": "939895954199.dkr.ecr.us-west-1.amazonaws.com/hrhouz-ecr:latest",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
EOF
}

# Create the ECS Service
resource "aws_ecs_service" "hrhouz_service" {
  name            = "hrhouz-ecs-service"
  cluster         = aws_ecs_cluster.hrhouz_cluster.arn
  task_definition = aws_ecs_task_definition.hrhouz_task_definition.arn
  launch_type     = "EC2"
  desired_count   = 1
}






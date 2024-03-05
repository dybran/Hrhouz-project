variable "region" {
  type        = string
  description = "aws region"
}

variable "name" {
  type        = string
  description = "default name given resources"
}

variable "name_prefix" {
  default = "hrhouz"
}

variable "az_count" {
  default = "2"
}

variable "healthcheck_path" {
  default = "/"
}

variable "fargate_cpu" {
  default = "1024"
}

variable "fargate_memory" {
  default = "2048"
}

variable "ecs_task_execution_role" {
  default = "arn:aws:iam::939895954199:role/ecsTaskExecutionRole"
}

variable "ecs_autoscale_role" {
  default = "arn:aws:iam::939895954199:role/ecsAutoscaleRole"
}

variable "min_capacity" {
  default = "2"
}

variable "max_capacity" {
  default = "5"
}

variable "container_port" {
  default = "80"
}

variable "alb_protocol" {
  default = "HTTP"
}

variable "balanced_container_name" {
  default = "hrhouz-api"
}

variable "app_image" {
  default = "nginx:latest"
}

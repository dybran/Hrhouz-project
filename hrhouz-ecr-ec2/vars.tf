variable "region" {
  type        = string
  description = "aws region"
}

variable "name" {
  type        = string
  description = "default name"
}


variable "vpc-cidr" {
  type        = string
  description = "vpc cidr"
}

variable "sub-cidr" {
  type        = string
  description = "subnet cidr"
}

variable "inst-type" {
  type        = string
  description = "EC2 instance type"
}

variable "ami" {
  type        = string
  description = "AMI for Ec2 instance"
}

variable "owner" {
  type        = string
  description = "AMI owner"
}

variable "key-pair" {
  type        = string
  description = "EC2 instance keypair"
}






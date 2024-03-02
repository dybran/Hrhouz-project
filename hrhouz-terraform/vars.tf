variable "region" {
  type        = string
  description = "aws region"
}

variable "name" {
  type    = string
  description = "default name"
}

variable "instance-type" {
  type    = string
  description = "instance type"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "keypair" {
  type        = string
  description = "key pair for the instances"
}
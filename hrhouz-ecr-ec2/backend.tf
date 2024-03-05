terraform {
  backend "s3" {
    bucket = "hrhouz-task-bucket"
    key    = "global/s3/terraform.tfstate"
    region = "us-west-1"
  }
}
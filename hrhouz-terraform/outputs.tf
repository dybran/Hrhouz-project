output "ecr_repo_url" {
  value = aws_ecr_repository.hrhouz-ecr.repository_url
}

# get ALB DNS name
output "alb_hostname" {
  value = "${aws_alb.alb.dns_name}"
}
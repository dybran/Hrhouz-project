# outputs.tf

output "ecr_repo_url" {
  value = aws_ecr_repository.hrhouz-ecr.repository_url
}

output "instance_ip" {
  value = aws_instance.hrhouz-server.public_ip
}

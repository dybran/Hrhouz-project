# outputs.tf

output "ecr_repo_url" {
  value = aws_ecr_repository.hrhouz-ecr.repository_url
}

output "instance_id" {
  value = aws_instance.hrhouz-server.id
}
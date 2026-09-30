output "alb_dns_name" {
  description = "Public DNS name for the application load balancer"
  value       = module.compute.alb_dns_name
}

output "ecr_repository_url" {
  description = "ECR repository URL for the backend image"
  value       = module.compute.ecr_repository_url
}

output "ecs_cluster_name" {
  value = module.compute.ecs_cluster_name
}

output "ecs_service_name" {
  value = module.compute.ecs_service_name
}

output "ecs_task_definition_family" {
  value = module.compute.ecs_task_definition_family
}

output "db_endpoint" {
  value = module.database.db_endpoint
}

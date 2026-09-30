variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "cloudapp"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "db_password" {
  description = "Password for the PostgreSQL application user"
  type      = string
  sensitive = true
}

variable "db_username" {
  description = "PostgreSQL application username"
  type        = string
  default     = "postgres"
}

variable "db_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "cloudapp"
}

variable "backend_image" {
  description = "Full ECR image URI and tag for the ECS backend. Leave empty to create infrastructure before the first image is pushed."
  type        = string
  default     = ""
}

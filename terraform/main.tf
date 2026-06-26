module "networking" {

  source = "./modules/networking"

  project_name = var.project_name
  environment  = var.environment
}

module "security" {

  source = "./modules/security"

  vpc_id = module.networking.vpc_id
}

module "database" {

  source = "./modules/database"

  database_subnet_ids = module.networking.database_subnet_ids

  rds_security_group_id = module.security.rds_sg_id

  environment = var.environment

  db_password = var.db_password
}




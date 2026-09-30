module "networking" {

  source = "./modules/networking"

  project_name = var.project_name
  environment  = var.environment
}

module "security" {

  source = "./modules/security"

  vpc_id       = module.networking.vpc_id
  project_name = var.project_name
}

module "database" {

  source = "./modules/database"

  database_subnet_ids = module.networking.database_subnet_ids

  rds_security_group_id = module.security.rds_sg_id

  environment  = var.environment
  project_name = var.project_name

  db_password = var.db_password
  db_username = var.db_username
  db_name     = var.db_name
}

module "compute" {
  source = "./modules/compute"

  project_name          = var.project_name
  environment           = var.environment
  aws_region            = var.aws_region
  vpc_id                = module.networking.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  private_subnet_ids    = module.networking.private_subnet_ids
  alb_security_group_id = module.security.alb_sg_id
  ecs_security_group_id = module.security.ecs_sg_id
  db_host               = module.database.db_host
  db_name               = var.db_name
  db_secret_arn         = module.database.secret_arn
}


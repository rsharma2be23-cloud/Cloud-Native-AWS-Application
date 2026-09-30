resource "aws_db_subnet_group" "main" {

  name = "${var.project_name}-db-subnet-group"

  subnet_ids = var.database_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_secretsmanager_secret" "db_secret" {

  name = "${var.project_name}-db-secret"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {

  secret_id = aws_secretsmanager_secret.db_secret.id

  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
  })
}

resource "aws_db_instance" "postgres" {

  identifier = "${var.project_name}-postgres"

  engine = "postgres"

  engine_version = "15"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  storage_type = "gp3"

  db_name = var.db_name

  username = var.db_username

  password = var.db_password

  publicly_accessible = false

  skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.main.name

  vpc_security_group_ids = [
    var.rds_security_group_id
  ]

  backup_retention_period = 7

  storage_encrypted = true

  multi_az = false
}

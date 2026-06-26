resource "aws_db_subnet_group" "main" {

  name = "cloudapp-db-subnet-group"

  subnet_ids = var.database_subnet_ids

  tags = {
    Name = "cloudapp-db-subnet-group"
  }
}

resource "aws_secretsmanager_secret" "db_secret" {

  name = "cloudapp-db-secret"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {

  secret_id = aws_secretsmanager_secret.db_secret.id

  secret_string = jsonencode({

    username = "postgres"

    password = var.db_password
  })
}

resource "aws_db_instance" "postgres" {

  identifier = "cloudapp-postgres"

  engine = "postgres"

  engine_version = "15"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  storage_type = "gp3"

  db_name = "cloudapp"

  username = "postgres"

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
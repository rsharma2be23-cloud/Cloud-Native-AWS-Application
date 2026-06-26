##################################################
# Availability Zones
##################################################

data "aws_availability_zones" "available" {}

##################################################
# VPC
##################################################

resource "aws_vpc" "main" {

  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "cloudapp-vpc"
    Environment = var.environment
    Project     = var.project_name
  }
}

##################################################
# Public Subnets
##################################################

resource "aws_subnet" "public_a" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-a"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_subnet" "public_b" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-b"
    Environment = var.environment
    Project     = var.project_name
  }
}

##################################################
# Private ECS Subnets
##################################################

resource "aws_subnet" "private_a" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name        = "private-a"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_subnet" "private_b" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name        = "private-b"
    Environment = var.environment
    Project     = var.project_name
  }
}

##################################################
# Database Subnets
##################################################

resource "aws_subnet" "db_a" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name        = "db-a"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_subnet" "db_b" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name        = "db-b"
    Environment = var.environment
    Project     = var.project_name
  }
}

##################################################
# Internet Gateway
##################################################

resource "aws_internet_gateway" "main" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "cloudapp-igw"
    Environment = var.environment
    Project     = var.project_name
  }
}

##################################################
# Elastic IP for NAT Gateway
##################################################

resource "aws_eip" "nat" {

  domain = "vpc"

  tags = {
    Name = "cloudapp-nat-eip"
  }
}

##################################################
# NAT Gateway
##################################################

resource "aws_nat_gateway" "main" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public_a.id

  tags = {
    Name = "cloudapp-nat"
  }

  depends_on = [
    aws_internet_gateway.main
  ]
}

##################################################
# Public Route Table
##################################################

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_a" {

  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {

  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

##################################################
# Private Route Table
##################################################

resource "aws_route_table" "private" {

  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_a" {

  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_b" {

  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}

##################################################
# Database Route Table
##################################################

resource "aws_route_table" "database" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "database-route-table"
  }
}

resource "aws_route_table_association" "db_a" {

  subnet_id      = aws_subnet.db_a.id
  route_table_id = aws_route_table.database.id
}

resource "aws_route_table_association" "db_b" {

  subnet_id      = aws_subnet.db_b.id
  route_table_id = aws_route_table.database.id
}
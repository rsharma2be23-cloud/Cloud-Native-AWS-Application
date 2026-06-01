# Cloud-Native 3-Tier Application on AWS
## Deployment Evidence and Project Journey

## Project Overview

This project demonstrates the design, development, containerization, and deployment of a production-style cloud-native application on AWS.

Technology Stack:

- Frontend: React + Vite
- Backend: Node.js + Express.js
- Database: PostgreSQL
- Containerization: Docker
- Cloud Platform: AWS
- Container Registry: Amazon ECR
- Compute: Amazon ECS Fargate
- Database Hosting: Amazon RDS PostgreSQL
- Load Balancing: Application Load Balancer
- Monitoring: Amazon CloudWatch

---

# Phase 0 – Environment Preparation

## Objective

Prepare the local development and cloud environment.

## Activities Performed

- Installed Node.js
- Installed PostgreSQL
- Installed Docker Desktop
- Installed AWS CLI
- Installed VS Code
- Configured Git and GitHub
- Configured AWS Account
- Enabled MFA
- Configured Budget Alerts

## Skills Learned

- Local development environment setup
- AWS account security
- Cost management fundamentals

---

# Phase 1 – Backend Development

## Objective

Build a production-ready REST API using Node.js and Express.

## Features Implemented

### Health Endpoint

GET /health

Used for:

- ECS Health Checks
- ALB Health Checks
- Monitoring

### Item APIs

GET /api/items

POST /api/items

### Metrics Endpoint

GET /metrics

## Backend Architecture

Client
↓
Express Server
↓
Controllers
↓
Database Layer
↓
PostgreSQL

## Skills Learned

- REST APIs
- Express.js
- Middleware
- Error Handling
- Logging
- Environment Variables

---

# Phase 2 – PostgreSQL Deep Dive

## Objective

Learn relational database concepts and connect application data storage.

## Database Created

cloudapp

## Table Structure

items

Columns:

- id
- name
- created_at

## Operations Performed

- Create Database
- Create Tables
- Insert Records
- Query Data
- Troubleshoot Authentication

## Skills Learned

- SQL
- PostgreSQL Administration
- Connection Pooling
- Query Execution

---

# Phase 3 – Dockerization

## Objective

Containerize the backend application.

## Components Created

### Dockerfile

Used to:

- Build backend image
- Package dependencies
- Standardize runtime

### Docker Image

Built locally using:

docker build

### Docker Container

Executed using:

docker run

## Skills Learned

- Containers
- Images
- Docker Networking
- Environment Injection

---

# Phase 4 – Frontend Development

## Objective

Create a React frontend to consume backend APIs.

## Features

- React UI
- API Integration
- CRUD Operations
- Loading States
- Error Handling

## Skills Learned

- React
- Vite
- Frontend Deployment Concepts

---

# Phase 5 – AWS Networking

## Objective

Build production-style AWS networking.

## VPC Design

VPC CIDR:

10.0.0.0/16

## Subnets Created

### Public Subnets

- Public Subnet A
- Public Subnet B

### Private Application Subnets

- Private App Subnet A
- Private App Subnet B

### Database Subnets

- Database Subnet A
- Database Subnet B

## AWS Components Configured

### Internet Gateway

Provides internet access to public resources.

### NAT Gateway

Allows private resources to reach the internet securely.

### Route Tables

Configured routing for:

- Public traffic
- Private traffic
- Database traffic

### Security Groups

Configured layered security between:

- ALB
- ECS
- RDS

## Skills Learned

- VPC Architecture
- Public vs Private Networking
- Security Groups
- Route Tables
- NAT Gateways

---

# Phase 6 – Amazon RDS PostgreSQL

## Objective

Move the database into AWS.

## Resources Created

### DB Subnet Group

Configured isolated database networking.

### RDS PostgreSQL 15

Configured:

- Storage
- Backups
- Encryption
- Networking

## Connectivity Tasks

- Connected from local machine
- Connected from backend
- Verified SQL operations

## Troubleshooting Performed

- DNS Issues
- Route Table Issues
- Security Group Issues
- SSL Issues
- Authentication Issues

## Skills Learned

- Managed Databases
- RDS Security
- Cloud Networking Debugging

---

# Phase 7 – Amazon ECR

## Objective

Store Docker images in AWS.

## Resources Created

### ECR Repository

cloudapp-backend

## Operations Performed

### Authenticate Docker

aws ecr get-login-password

### Tag Image

docker tag

### Push Image

docker push

## Skills Learned

- Container Registries
- Image Versioning
- Registry Authentication

---

# Phase 8 – Amazon ECS Fargate Deployment

## Objective

Deploy containerized application to AWS without managing servers.

## Architecture

Users
↓
Application Load Balancer
↓
Amazon ECS Fargate
↓
Amazon RDS PostgreSQL

## Resources Created

### ECS Cluster

Container orchestration environment.

### Task Definition

Defined:

- Docker Image
- CPU
- Memory
- Environment Variables
- Secrets

### ECS Service

Maintains desired task count.

### ECS Tasks

Application containers running on Fargate.

### Application Load Balancer

Routes traffic to healthy ECS tasks.

### Target Group

Tracks application health.

### CloudWatch Logs

Stores application logs.

## Deployment Process

1. Build Docker Image
2. Push Image to ECR
3. Create Task Definition
4. Create ECS Service
5. Attach ALB
6. Configure Health Checks
7. Verify Deployment

## Validation Completed

- ECS Tasks Running
- Health Checks Passing
- ALB Routing Traffic
- Backend Connected to RDS
- CloudWatch Logs Generated

## Troubleshooting Performed

- ECS Task Startup Failures
- Security Group Issues
- Database Connectivity Problems
- Load Balancer Health Check Failures
- IAM Permission Issues

## Skills Learned

- ECS Fargate
- Container Orchestration
- Load Balancing
- Cloud Monitoring
- Production Deployments

---

# Project Outcomes

Successfully Built:

- Cloud-Native Application
- Dockerized Backend
- Managed PostgreSQL Database
- ECS Fargate Deployment
- Load Balanced Architecture
- Secure VPC Design

## AWS Services Used

- Amazon VPC
- Amazon ECS Fargate
- Amazon ECR
- Amazon RDS PostgreSQL
- Application Load Balancer
- AWS IAM
- AWS CloudWatch
- AWS Secrets Manager

---

# Resume Summary

Designed and deployed a cloud-native 3-tier application on AWS using ECS Fargate, RDS PostgreSQL, ECR, and Application Load Balancer.

Implemented containerized Node.js backend using Docker and deployed it through ECS.

Configured secure VPC networking with public/private subnets, NAT Gateway, route tables, and security groups.

Integrated PostgreSQL database hosted on Amazon RDS.

Configured CloudWatch logging and performed troubleshooting across networking, authentication, and application layers.

Implemented load balancing, health checks, and production-style deployment practices.

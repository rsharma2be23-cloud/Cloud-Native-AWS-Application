# Complete Production-Grade Cloud-Native Application
> From Zero to AWS Deployment — A Full Engineering Bootcamp

## Table of Contents
- [Orientation: The Full Picture](#orientation-the-full-picture)
  - [How the Phases Map to This Architecture](#how-the-phases-map-to-this-architecture)
- [PHASE 1 — Build the Node.js Backend Locally](#phase-1-build-the-nodejs-backend-locally)
  - [Phase 1 Goal](#phase-1-goal)
  - [Step 1.1 — Understanding the Mental Model Before Any Code](#step-11-understanding-the-mental-model-before-any-code)
    - [What is a REST API?](#what-is-a-rest-api)
    - [What is Express.js?](#what-is-expressjs)
    - [What is Connection Pooling?](#what-is-connection-pooling)
  - [Step 1.2 — Prerequisites Check](#step-12-prerequisites-check)
    - [Check Node.js](#check-nodejs)
    - [Check npm](#check-npm)
    - [Check Git](#check-git)
    - [Check PostgreSQL](#check-postgresql)
    - [Verify PostgreSQL is Running](#verify-postgresql-is-running)
  - [Step 1.3 — Create the Project Folder Structure](#step-13-create-the-project-folder-structure)
    - [Why folder structure matters](#why-folder-structure-matters)
    - [Create the root project folder](#create-the-root-project-folder)
    - [Create all folders upfront](#create-all-folders-upfront)
    - [Verify the structure](#verify-the-structure)
    - [What each folder will contain](#what-each-folder-will-contain)
  - [Step 1.4 — Initialize the Node.js Project](#step-14-initialize-the-nodejs-project)
  - [Step 1.5 — Install Dependencies](#step-15-install-dependencies)
    - [What each package does and why we need it:](#what-each-package-does-and-why-we-need-it)
  - [Step 1.6 — Create the .gitignore File](#step-16-create-the-gitignore-file)
  - [Step 1.7 — Create the Environment Variables File](#step-17-create-the-environment-variables-file)
  - [Step 1.8 — Create the Configuration Loader](#step-18-create-the-configuration-loader)
  - [Step 1.9 — Create the Database Connection Pool](#step-19-create-the-database-connection-pool)
  - [Step 1.10 — Create the Database Schema and Migration](#step-110-create-the-database-schema-and-migration)
  - [Step 1.11 — Create the Logger Utility](#step-111-create-the-logger-utility)
  - [Step 1.12 — Create the Middleware](#step-112-create-the-middleware)
  - [Step 1.13 — Create the Item Service](#step-113-create-the-item-service)
  - [Step 1.14 — Create the Controllers](#step-114-create-the-controllers)
  - [Step 1.15 — Create the Routes](#step-115-create-the-routes)
  - [Step 1.16 — Create the Main Server File](#step-116-create-the-main-server-file)
  - [Step 1.17 — Set Up the PostgreSQL Database Locally](#step-117-set-up-the-postgresql-database-locally)
  - [Step 1.18 — Run the Backend](#step-118-run-the-backend)
  - [Step 1.19 — Verify Every Endpoint](#step-119-verify-every-endpoint)
  - [Step 1.20 — Verify the Final Folder Structure](#step-120-verify-the-final-folder-structure)
  - [Phase 1 Troubleshooting](#phase-1-troubleshooting)
  - [Phase 1 Summary](#phase-1-summary)
    - [What You Built](#what-you-built)
    - [What is connection pooling and why is it critical in a serverless/container environment?](#what-is-connection-pooling-and-why-is-it-critical-in-a-serverlesscontainer-environment)
    - [What is the difference between a 404 and a 422 response? When would you use each?](#what-is-the-difference-between-a-404-and-a-422-response-when-would-you-use-each)
    - [What is SQL injection and how do parameterized queries prevent it?](#what-is-sql-injection-and-how-do-parameterized-queries-prevent-it)
    - [What is the purpose of the CORS middleware and when would you need to change the origin?](#what-is-the-purpose-of-the-cors-middleware-and-when-would-you-need-to-change-the-origin)
- [PHASE 2 — Build the React Frontend Locally](#phase-2-build-the-react-frontend-locally)
  - [Phase 2 Goal](#phase-2-goal)
  - [Step 2.1 — The Frontend Architecture Mental Model](#step-21-the-frontend-architecture-mental-model)
  - [Step 2.2 — Create the React Project](#step-22-create-the-react-project)
    - [What each package does:](#what-each-package-does)
  - [Step 2.3 — Project Structure](#step-23-project-structure)
  - [Step 2.4 — Environment Configuration](#step-24-environment-configuration)
  - [Step 2.5 — API Service Layer](#step-25-api-service-layer)
  - [Step 2.6 — Custom Hook](#step-26-custom-hook)
  - [Step 2.7 — React Components](#step-27-react-components)
  - [Step 2.8 — Main App Component](#step-28-main-app-component)
  - [Step 2.9 — Run the Frontend](#step-29-run-the-frontend)
  - [Phase 2 Summary](#phase-2-summary)
- [PHASE 3 — Containerize with Docker](#phase-3-containerize-with-docker)
  - [Phase 3 Goal](#phase-3-goal)
  - [Step 3.1 — Docker Mental Model](#step-31-docker-mental-model)
  - [Step 3.2 — Install Docker](#step-32-install-docker)
  - [Step 3.3 — Create the Backend Dockerfile](#step-33-create-the-backend-dockerfile)
  - [Step 3.4 — Create Docker Compose for Local Development](#step-34-create-docker-compose-for-local-development)
  - [Step 3.5 — Build and Run the Container](#step-35-build-and-run-the-container)
    - [Check the image size:](#check-the-image-size)
  - [Phase 3 Summary](#phase-3-summary)
- [PHASE 4 — Terraform: VPC and Networking](#phase-4-terraform-vpc-and-networking)
  - [Phase 4 Goal](#phase-4-goal)
  - [Step 4.1 — Infrastructure Architecture](#step-41-infrastructure-architecture)
  - [Step 4.2 — Install and Configure Terraform + AWS CLI](#step-42-install-and-configure-terraform-aws-cli)
  - [Step 4.3 — Terraform Project Structure](#step-43-terraform-project-structure)
  - [Step 4.4 — Terraform Root Configuration](#step-44-terraform-root-configuration)
  - [Step 4.5 — VPC Module](#step-45-vpc-module)
  - [Step 4.6 — Security Groups Module](#step-46-security-groups-module)
  - [Step 4.7 — Wire Modules Together](#step-47-wire-modules-together)
  - [Step 4.8 — Initialize and Apply](#step-48-initialize-and-apply)
    - [Check Route Tables → verify public routes have 0.0.0.0/0 → IGW, private routes have 0.0.0.0/0 → NAT](#check-route-tables-verify-public-routes-have-00000-igw-private-routes-have-00000-nat)
  - [Phase 4 Summary](#phase-4-summary)
    - [What You Built](#what-you-built-1)
    - [What is the difference between a Security Group and a Network ACL in AWS?](#what-is-the-difference-between-a-security-group-and-a-network-acl-in-aws)
- [PHASES 5–10: Continuing the Architecture](#phases-510-continuing-the-architecture)
- [Phase 5 — RDS PostgreSQL on AWS](#phase-5-rds-postgresql-on-aws)
  - [What gets built:](#what-gets-built)
  - [Key concepts covered:](#key-concepts-covered)
- [Phase 6 — ECS Fargate](#phase-6-ecs-fargate)
  - [What gets built:](#what-gets-built-1)
  - [Key concepts covered:](#key-concepts-covered-1)
- [Phase 7 — ALB, S3, and CloudFront](#phase-7-alb-s3-and-cloudfront)
  - [Architecture:](#architecture)
  - [Key resources:](#key-resources)
- [Phase 8 — GitHub Actions CI/CD](#phase-8-github-actions-cicd)
  - [Pipeline flow:](#pipeline-flow)
  - [Key concepts covered:](#key-concepts-covered-2)
- [Phase 9 — CloudWatch Monitoring](#phase-9-cloudwatch-monitoring)
  - [Monitoring architecture:](#monitoring-architecture)
  - [Key resources:](#key-resources-1)
- [Phase 10 — Full Validation and Production Hardening](#phase-10-full-validation-and-production-hardening)
  - [Production checklist covered:](#production-checklist-covered)
- [Complete File Structure](#complete-file-structure)
- [Final Words Before You Begin](#final-words-before-you-begin)

Before we write a single line of code, let me orient you to what we're building and why every piece matters. This is not a tutorial that stops at "it works on my machine." We are building something you could genuinely hand to a CTO and say: this is production-ready.

## Orientation: The Full Picture

Here is the final architecture you will have built by the end of this course:

```text
┌─────────────────────────────────────────────────────────────────┐
│                        INTERNET                                  │
│                     (Public Users)                               │
└──────────────────────────┬──────────────────────────────────────┘
                           │ HTTPS
                           ▼
┌─────────────────────────────────────────────────────────────────┐
│                   AWS CloudFront (CDN)                           │
│         Global edge caching + HTTPS termination                  │
│         Origin 1: S3 (React static files)                        │
│         Origin 2: ALB (API calls /api/)                         │
└────────────┬────────────────────────────────────────────────────┘
             │                          │
             ▼                          ▼
┌────────────────────┐     ┌────────────────────────────┐
│   AWS S3 Bucket    │     │  Application Load Balancer  │
│  (React Frontend   │     │  (ALB) — Private DNS only   │
│   Static Files)    │     └─────────────┬──────────────┘
└────────────────────┘                   │
                                         │ HTTP (internal)
                                         ▼
                        ┌────────────────────────────────┐
                        │      AWS ECS Fargate            │
                        │   (Node.js containers)          │
                        │   Auto-scaling group            │
                        │   Task definition per service   │
                        └─────────────┬──────────────────┘
                                      │ TCP 5432 (internal)
                                      ▼
                        ┌────────────────────────────────┐
                        │       AWS RDS PostgreSQL        │
                        │   (Database subnet — isolated)  │
                        │   Multi-AZ, encrypted at rest   │
                        └────────────────────────────────┘

Supporting Services:
┌──────────────┐  ┌──────────────────┐  ┌──────────────────┐
│  AWS ECR     │  │  AWS Secrets     │  │  AWS CloudWatch  │
│ (Container   │  │  Manager         │  │  (Logs, Metrics, │
│  Registry)   │  │  (DB passwords,  │  │   Alarms)        │
└──────────────┘  │  API keys)       │  └──────────────────┘
                  └──────────────────┘
┌──────────────┐  ┌──────────────────┐  ┌──────────────────┐
│  GitHub      │  │  Terraform       │  │  AWS IAM         │
│  Actions     │  │  (Infrastructure │  │  (Roles, Policies│
│  (CI/CD)     │  │   as Code)       │  │   Permissions)   │
└──────────────┘  └──────────────────┘  └──────────────────┘
```

### How the Phases Map to This Architecture

| Phase | What You Build | Maps To |
|-------|---------------|---------|
| Phase 1 | Node.js backend locally | The application logic inside your ECS containers |
| Phase 2 | React frontend locally | The static files that go into S3 |
| Phase 3 | Docker containers | The container images stored in ECR, run by Fargate |
| Phase 4 | Terraform — VPC, networking | The private network your containers live in |
| Phase 5 | Terraform — RDS | The isolated database layer |
| Phase 6 | Terraform — ECS Fargate | Where your containers actually run |
| Phase 7 | Terraform — ALB, S3, CloudFront | The public-facing layer |
| Phase 8 | GitHub Actions CI/CD | Automated build, test, push, deploy |
| Phase 9 | CloudWatch, monitoring | Observability — knowing your app is alive |
| Phase 10 | Full validation + hardening | Production checklist, security audit |

Now let's begin. Phase 1 starts at the very bottom of the stack — the application itself. Everything else we build in later phases exists to run and serve this code reliably at scale.

## PHASE 1 — Build the Node.js Backend Locally

### Phase 1 Goal

By the end of Phase 1, you will have a fully production-structured Node.js + Express + PostgreSQL backend running locally on your machine. It will:

• Connect to a local PostgreSQL database
• Serve four HTTP endpoints
• Handle errors properly, centrally
• Log every request
• Validate incoming data
• Read configuration from environment variables (never hardcoded)
• Be structured exactly the way real companies structure their backends

This is the code that will later run inside a Docker container on AWS Fargate. If you cut corners here, those corners follow you all the way to production.

### Step 1.1 — Understanding the Mental Model Before Any Code

Before you touch a terminal, you need to understand what we're building and why it's structured the way it is.

#### What is a REST API?

A REST API (Representational State Transfer Application Programming Interface) is a contract between a frontend and a backend. The frontend says: "Give me a list of items." The backend says: "Here they are, in JSON format."

```text
┌─────────────────┐         HTTP Request          ┌─────────────────┐
│                 │  ─────────────────────────►   │                 │
│  React Frontend │  GET /api/items               │  Node.js Backend│
│  (Browser)      │                               │  (Express)      │
│                 │  ◄─────────────────────────   │                 │
└─────────────────┘   JSON Response               └────────┬────────┘
                       [{"id":1,"name":"..."}]              │
                                                            │ SQL Query
                                                            ▼
                                                   ┌─────────────────┐
                                                   │   PostgreSQL    │
                                                   │   Database      │
                                                   └─────────────────┘
```

#### What is Express.js?

Express is a minimal framework for Node.js that makes it easy to define routes (URLs your API responds to), middleware (code that runs on every request), and error handlers.

Think of Express like a post office sorting system:
• Each route is a labeled sorting bin (GET /api/items goes here)
• Middleware is the conveyor belt everything passes through before reaching a bin
• Error handlers are the "return to sender" department

#### What is Connection Pooling?

When your app needs data, it connects to PostgreSQL. Opening a database connection is expensive — it takes time, memory, and network handshake. A connection pool keeps 5–20 connections permanently open and reuses them. Instead of opening a new connection for every request (which would kill your database), your app borrows a connection, uses it, returns it.

```text
                    Connection Pool (keeps 10 connections open)
                    ┌───────────────────────────────────────┐
HTTP Request 1 ───► │  conn1 [IN USE]                       │
HTTP Request 2 ───► │  conn2 [IN USE]                       │
HTTP Request 3 ───► │  conn3 [IDLE — waiting]               │ ──► PostgreSQL
HTTP Request 4 ───► │  conn4 [IDLE — waiting]               │
                    │  conn5 [IDLE — waiting]               │
                    └───────────────────────────────────────┘
```

Without pooling, 1000 concurrent users = 1000 simultaneous database connections = PostgreSQL crashes.

### Step 1.2 — Prerequisites Check

Let's verify your machine has everything needed. Open your terminal (Terminal on Mac/Linux, PowerShell or Git Bash on Windows).

#### Check Node.js

```javascript
node --version
```

Expected output:
```text
v20.11.0
```
(Any version v18 or higher is fine. If you see "command not found", install Node.js from https://nodejs.org — download the LTS version.)

#### Check npm

```bash
npm --version
```

Expected output:
```text
10.2.4
```

#### Check Git

```bash
git --version
```

Expected output:
```bash
git version 2.43.0
```

#### Check PostgreSQL

```bash
psql --version
```

Expected output:
```bash
psql (PostgreSQL) 15.4
```

If PostgreSQL isn't installed:

• Mac: brew install postgresql@15 then brew services start postgresql@15
• Ubuntu/Debian: sudo apt-get install postgresql postgresql-contrib
• Windows: Download from https://www.postgresql.org/download/windows/

#### Verify PostgreSQL is Running

```bash
Mac/Linux
pgisready
```

Expected output:
```text
/tmp/.s.PGSQL.5432:5432 - accepting connections
```

### Step 1.3 — Create the Project Folder Structure
#### Why folder structure matters

Folder structure is not cosmetic. It determines:
• How fast a new engineer can understand your codebase
• How easy it is to test individual pieces
• How you separate concerns (database code should never be in route handlers)

Real companies use layered architecture: routes → controllers → services → database. Each layer has one job.

#### Create the root project folder

```bash
mkdir cloud-native-app
cd cloud-native-app
```

Now create the backend folder:

```bash
mkdir backend
cd backend
```

#### Create all folders upfront

```bash
mkdir -p src/routes
mkdir -p src/controllers
mkdir -p src/services
mkdir -p src/db
mkdir -p src/middleware
mkdir -p src/utils
mkdir -p src/config
```

#### Verify the structure

```bash
find . -type d
```

Expected output:
```text
.
./src
./src/routes
./src/controllers
./src/services
./src/db
./src/middleware
./src/utils
./src/config
```

#### What each folder will contain

```text
backend/
│
├── src/
│   ├── routes/          ← URL definitions (GET /api/items → which controller handles it)
│   ├── controllers/     ← Request/response logic (parse request, call service, send response)
│   ├── services/        ← Business logic (the actual work — query DB, process data)
│   ├── db/              ← Database connection pool and query helpers
│   ├── middleware/       ← Code that runs on every request (logging, auth, validation)
│   ├── utils/           ← Reusable helper functions (formatters, validators)
│   └── config/          ← Configuration loading from environment variables
│
├── .env                 ← Local environment variables (NEVER commit this to git)
├── .env.example         ← Template showing what variables are needed (safe to commit)
├── .gitignore           ← Files git should never track
├── package.json         ← Project metadata and dependency list
└── server.js            ← Entry point — starts the server
```

### Step 1.4 — Initialize the Node.js Project

From inside the backend/ folder:

```bash
npm init -y
```

What this does: Creates a package.json file. The -y flag answers "yes" to all prompts using defaults. This file is the identity card of your Node.js project — it tracks the name, version, scripts, and every dependency you install.

Expected output:
```text
Wrote to /path/to/cloud-native-app/backend/package.json:

{
  "name": "backend",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```

Now open package.json in your editor and replace the entire contents with this:

backend/package.json
```json
{
  "name": "cloud-native-backend",
  "version": "1.0.0",
  "description": "Production-grade Node.js backend for cloud-native app",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js",
    "test": "echo \"Tests not yet configured\" && exit 0"
  },
  "keywords": ["nodejs", "express", "postgresql", "rest-api"],
  "author": "Your Name",
  "license": "MIT",
  "engines": {
    "node": ">=18.0.0"
  }
}
```

Line-by-line explanation:

• "main": "server.js" — Tells Node.js the entry point file when someone runs your app
• "start": "node server.js" — Production start command (AWS will use this)
• "dev": "nodemon server.js" — Development start with auto-restart on file changes
• "engines" — Declares the minimum Node.js version required. AWS and Docker images will respect this.

### Step 1.5 — Install Dependencies

Dependencies are libraries other engineers wrote that we incorporate into our app. You do not write an HTTP server from scratch in 2024 — you use Express. You do not write a PostgreSQL driver from scratch — you use pg.

Production dependencies (needed when the app runs)

```bash
npm install express pg dotenv cors helmet morgan express-validator uuid
```

#### What each package does and why we need it:

| Package | Purpose | Why not skip it? |
|---------|---------|-----------------|
| express | HTTP server framework | Without it you'd write hundreds of lines of raw Node.js HTTP code |
| pg | PostgreSQL client for Node.js | The official, battle-tested driver for talking to PostgreSQL |
| dotenv | Loads .env files into process.env | Without this, environment variables don't load from your .env file |
| cors | Sets CORS headers so the frontend can call the backend | Without this, browsers block all cross-origin API calls |
| helmet | Sets ~15 security-related HTTP headers | Prevents many common web attacks with one line of code |
| morgan | HTTP request logger | Logs every request — essential for debugging and monitoring |
| express-validator | Input validation library | Never trust user input — validate everything before touching the database |
| uuid | Generates unique IDs | For creating unique identifiers without depending on the database |

Development dependencies (only needed during development, not in production)

```bash
npm install --save-dev nodemon
```

What nodemon does: Watches your files and automatically restarts the server when you save a change. Without it, you'd have to manually stop and restart the server every time you edit a file. The --save-dev flag marks it as a dev dependency — it won't be installed in your Docker production image.

Verify installation

```text
ls nodemodules | head -20
```

You should see a long list of folders. Also check:

```text
cat package.json
```

You should now see a dependencies and devDependencies section populated.

### Step 1.6 — Create the .gitignore File

This is not optional. If you accidentally commit your .env file (which contains database passwords) to GitHub, attackers can find it. Every year, thousands of developers have their AWS accounts hijacked because they pushed secrets to GitHub.

Create backend/.gitignore:

```bash
Dependencies — never commit these, they're downloaded fresh
nodemodules/

Environment variables — NEVER commit secrets
.env
.env.local
.env..local

Logs
logs/
.log
npm-debug.log

OS files
.DSStore
Thumbs.db

Build outputs
dist/
build/
```

### Step 1.7 — Create the Environment Variables File

Environment variables are how you configure an application without hardcoding values. The same code runs locally, in staging, and in production — but it reads different database passwords, different ports, different log levels from the environment it's running in.

Why not hardcode values?

```javascript
// WRONG — hardcoded (what beginners do)
const pool = new Pool({
  password: "mypassword123",  // Now this is in your git history forever
  host: "localhost"
});

// RIGHT — from environment (what production code does)
const pool = new Pool({
  password: process.env.DBPASSWORD,  // Comes from .env locally, from Secrets Manager on AWS
  host: process.env.DBHOST
});
```

Create backend/.env:

```dotenv
Application
NODEENV=development
PORT=3000
APPNAME=cloud-native-backend

Database
DBHOST=localhost
DBPORT=5432
DBNAME=cloudnativedb
DBUSER=postgres
DBPASSWORD=postgres
DBMAXCONNECTIONS=10
DBIDLETIMEOUTMS=30000
DBCONNECTIONTIMEOUTMS=2000

CORS
CORSORIGIN=http://localhost:5173

Logging
LOGLEVEL=debug
```

Create backend/.env.example (this one IS safe to commit — it shows required variables without real values):

```dotenv
Application
NODEENV=development
PORT=3000
APPNAME=cloud-native-backend

Database
DBHOST=localhost
DBPORT=5432
DBNAME=cloudnativedb
DBUSER=yourdbuser
DBPASSWORD=yourdbpassword
DBMAXCONNECTIONS=10
DBIDLETIMEOUTMS=30000
DBCONNECTIONTIMEOUTMS=2000

CORS
CORSORIGIN=http://localhost:5173

Logging
LOGLEVEL=debug
```

### Step 1.8 — Create the Configuration Loader

Instead of calling process.env.DBHOST scattered throughout your codebase, you create one central place that loads, validates, and exports all configuration. If an environment variable is missing, the app refuses to start — immediately and loudly — rather than crashing mysteriously later.

Create backend/src/config/index.js:

```text
// src/config/index.js
//
// PURPOSE: Single source of truth for all application configuration.
// Loads from environment variables, validates required values exist,
// provides sensible defaults where safe.
//
// WHY THIS PATTERN: If DBHOST is missing, you want to know at startup,
// not when the first database query fails 3 seconds after deployment.

'use strict';

// Load .env file into process.env
// This only does something in development — in production (Docker/AWS),
// environment variables are injected directly and .env doesn't exist.
require('dotenv').config();

// Helper function: get an env variable or throw if required and missing
function getEnv(key, defaultValue = undefined) {
  const value = process.env[key];
  
  if (value === undefined || value === '') {
    if (defaultValue !== undefined) {
      return defaultValue;
    }
    // No default provided = this variable is required
    throw new Error(
      Missing required environment variable: ${key}\n +
      Check your .env file or environment configuration.
    );
  }
  
  return value;
}

// Helper: get env variable as an integer
function getEnvInt(key, defaultValue = undefined) {
  const value = getEnv(key, defaultValue !== undefined ? String(defaultValue) : undefined);
  const parsed = parseInt(value, 10);
  
  if (isNaN(parsed)) {
    throw new Error(Environment variable ${key} must be an integer, got: ${value});
  }
  
  return parsed;
}

// The config object — organized by category
const config = {
  // ── Application ──────────────────────────────────────────────────
  app: {
    name: getEnv('APPNAME', 'cloud-native-backend'),
    port: getEnvInt('PORT', 3000),
    // NODEENV determines how the app behaves:
    // 'development' → verbose logging, detailed error messages
    // 'production'  → minimal logging, generic error messages (security)
    nodeEnv: getEnv('NODEENV', 'development'),
    isDevelopment: getEnv('NODEENV', 'development') === 'development',
    isProduction: getEnv('NODEENV', 'development') === 'production',
  },

  // ── Database ──────────────────────────────────────────────────────
  db: {
    host: getEnv('DBHOST', 'localhost'),
    port: getEnvInt('DBPORT', 5432),
    name: getEnv('DBNAME', 'cloudnativedb'),
    user: getEnv('DBUSER', 'postgres'),
    password: getEnv('DBPASSWORD', 'postgres'),
    // Connection pool settings:
    maxConnections: getEnvInt('DBMAXCONNECTIONS', 10),
    idleTimeoutMs: getEnvInt('DBIDLETIMEOUTMS', 30000),
    connectionTimeoutMs: getEnvInt('DBCONNECTIONTIMEOUTMS', 2000),
  },

  // ── CORS ──────────────────────────────────────────────────────────
  cors: {
    // Which origins are allowed to call this API.
    // In development: your local React dev server (localhost:5173).
    // In production: your CloudFront domain.
    origin: getEnv('CORSORIGIN', 'http://localhost:5173'),
  },

  // ── Logging ───────────────────────────────────────────────────────
  logging: {
    level: getEnv('LOGLEVEL', 'debug'),
  },
};

// Export the config so any file can import it with:
// const config = require('../config');
module.exports = config;
```

Why this pattern matters in production: When you deploy to AWS ECS Fargate, environment variables come from AWS Secrets Manager and ECS task definitions — not from .env files. This config module works identically in both environments because it reads from process.env regardless of how those variables were set.

### Step 1.9 — Create the Database Connection Pool

This is one of the most important files in the entire project. It creates the PostgreSQL connection pool that every database query will use.

Create backend/src/db/pool.js:

```text
// src/db/pool.js
//
// PURPOSE: Creates and exports a single PostgreSQL connection pool
// shared across the entire application.
//
// WHY A SINGLE POOL: If each route created its own pool, you'd quickly
// exhaust PostgreSQL's connection limit. One pool, shared everywhere,
// handles concurrency correctly.
//
// POOL LIFECYCLE:
//   App starts → pool created (0 connections initially)
//   First query → pool opens a connection
//   Concurrent queries → pool opens more (up to max)
//   Idle connections → closed after idleTimeoutMs
//   App shuts down → all connections closed gracefully

'use strict';

const { Pool } = require('pg');
const config = require('../config');

// Create the pool using our validated config
// The pool does NOT connect immediately — it connects lazily on first query
const pool = new Pool({
  host: config.db.host,
  port: config.db.port,
  database: config.db.name,
  user: config.db.user,
  password: config.db.password,
  
  // Maximum number of clients in the pool
  // Rule of thumb: (2  numberofcores) + effectivespindlecount
  // For a small app, 10 is plenty
  max: config.db.maxConnections,
  
  // How long (ms) a client can sit idle before being closed
  // 30 seconds is a reasonable default
  idleTimeoutMillis: config.db.idleTimeoutMs,
  
  // How long (ms) to wait for a connection before giving up
  // If a connection can't be established in 2 seconds, something is wrong
  connectionTimeoutMillis: config.db.connectionTimeoutMs,
  
  // Allow the pool to shut down gracefully (important for containers)
  allowExitOnIdle: false,
});

// ── Pool event listeners ────────────────────────────────────────────
// These help you understand what the pool is doing in production

pool.on('connect', (client) => {
  // Fires every time a new client is added to the pool
  if (config.app.isDevelopment) {
    console.log('[DB] New connection established to PostgreSQL');
  }
});

pool.on('acquire', (client) => {
  // Fires every time a client is checked out from the pool
  // (Useful for debugging connection leaks in development)
});

pool.on('error', (err, client) => {
  // Fires when an idle client in the pool encounters an error
  // This can happen if PostgreSQL restarts, network drops, etc.
  // We log it but don't crash — the pool will recover automatically
  console.error('[DB] Unexpected pool error:', err.message);
});

pool.on('remove', (client) => {
  // Fires when a client is removed from the pool (after idle timeout)
  if (config.app.isDevelopment) {
    console.log('[DB] Connection removed from pool');
  }
});

// ── Test connectivity function ──────────────────────────────────────
// Called at startup to verify the database is reachable before
// accepting HTTP traffic. Prevents the app from starting in a broken state.

async function testConnection() {
  let client;
  try {
    // Get a connection from the pool
    client = await pool.connect();
    
    // Run a trivial query that any connected user can run
    const result = await client.query('SELECT NOW() as currenttime, version()');
    
    console.log('[DB] ✓ PostgreSQL connected successfully');
    console.log([DB] Server time: ${result.rows[0].currenttime});
    console.log([DB] Version: ${result.rows[0].version.split(',')[0]});
    
    return true;
  } catch (error) {
    console.error('[DB] ✗ Failed to connect to PostgreSQL');
    console.error([DB] Host: ${config.db.host}:${config.db.port});
    console.error([DB] Database: ${config.db.name});
    console.error([DB] User: ${config.db.user});
    console.error([DB] Error: ${error.message});
    throw error; // Re-throw so the app startup fails loudly
  } finally {
    // CRITICAL: Always release the client back to the pool
    // Forgetting this causes connection leaks
    if (client) client.release();
  }
}

// ── Graceful shutdown ───────────────────────────────────────────────
// When the process receives a shutdown signal (SIGTERM from Docker/Kubernetes),
// we close all pool connections cleanly instead of dropping them abruptly.
// This prevents "connection reset" errors on in-flight requests.

async function closePool() {
  console.log('[DB] Closing connection pool...');
  await pool.end();
  console.log('[DB] Connection pool closed');
}

module.exports = {
  pool,
  testConnection,
  closePool,
  // Convenience method: run a query without manually managing clients
  // Usage: const result = await query('SELECT  FROM items WHERE id = $1', [id]);
  query: (text, params) => pool.query(text, params),
};
```

Critical concept — parameterized queries: Notice $1 in the query function. This is a parameterized query (also called a prepared statement). You pass the actual value separately in the params array. The PostgreSQL driver handles escaping. This is the primary defense against SQL injection — the most common database attack.

```text
DANGEROUS (never do this):
  query(SELECT  FROM users WHERE id = ${userId})
  If userId = "1; DROP TABLE users;--" → your table is gone

SAFE (always do this):
  query('SELECT  FROM users WHERE id = $1', [userId])
  The driver treats userId as a literal value, never as SQL
```

### Step 1.10 — Create the Database Schema and Migration

In production, you never manually ALTER TABLE a live database. You use migrations — versioned SQL scripts that can be run forward (apply) and backward (rollback). We'll use a simple approach here that scales well.

Create backend/src/db/migrate.js:

```yaml
// src/db/migrate.js
//
// PURPOSE: Creates all database tables if they don't exist.
// This is called at app startup.
//
// PRODUCTION NOTE: For large-scale apps, use a dedicated migration tool
// like Flyway, Liquibase, or node-pg-migrate. For this project, a
// startup migration is clear and sufficient.
//
// IDEMPOTENT: Running this multiple times is safe — "CREATE TABLE IF NOT EXISTS"
// only creates the table if it doesn't already exist.

'use strict';

const { query } = require('./pool');

const migrations = [
  // Migration 001: Create items table
  {
    name: '001createitemstable',
    sql: 
      CREATE TABLE IF NOT EXISTS items (
        -- UUID primary key: globally unique, doesn't reveal record count,
        -- safe to expose in URLs (/api/items/550e8400-e29b-41d4-a716-446655440000)
        id          UUID PRIMARY KEY DEFAULT genrandomuuid(),
        
        -- The item name: required, reasonable length limit
        name        VARCHAR(255) NOT NULL,
        
        -- Optional description
        description TEXT,
        
        -- Status as an enum-like constraint
        -- CHECK constraint ensures only valid statuses can be stored
        status      VARCHAR(50) NOT NULL DEFAULT 'active'
                      CHECK (status IN ('active', 'inactive', 'archived')),
        
        -- Timestamps: always include these on every table
        -- They're invaluable for debugging, auditing, and sorting
        createdat  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updatedat  TIMESTAMPTZ NOT NULL DEFAULT NOW()
      );
    ,
  },

  // Migration 002: Create index on status (queries often filter by status)
  {
    name: '002createitemsstatusindex',
    sql: 
      CREATE INDEX IF NOT EXISTS idxitemsstatus 
      ON items(status);
    ,
  },

  // Migration 003: Create index on createdat (queries often sort by date)
  {
    name: '003createitemscreatedatindex',
    sql: 
      CREATE INDEX IF NOT EXISTS idxitemscreatedat 
      ON items(createdat DESC);
    ,
  },

  // Migration 004: Create a function to auto-update updatedat timestamp
  // Without this, updatedat stays the same even after updates
  {
    name: '004createupdatetimestampfunction',
    sql: 
      CREATE OR REPLACE FUNCTION updateupdatedatcolumn()
      RETURNS TRIGGER AS $$
      BEGIN
        NEW.updatedat = NOW();
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;
    ,
  },

  // Migration 005: Attach the trigger to the items table
  {
    name: '005createitemsupdatetrigger',
    sql: 
      DROP TRIGGER IF EXISTS updateitemsupdatedat ON items;
      
      CREATE TRIGGER updateitemsupdatedat
        BEFORE UPDATE ON items
        FOR EACH ROW
        EXECUTE FUNCTION updateupdatedatcolumn();
    ,
  },
];

async function runMigrations() {
  console.log('[DB] Running migrations...');

  for (const migration of migrations) {
    try {
      await query(migration.sql);
      console.log([DB] ✓ Migration applied: ${migration.name});
    } catch (error) {
      console.error([DB] ✗ Migration failed: ${migration.name});
      console.error([DB] Error: ${error.message});
      throw error;
    }
  }

  console.log('[DB] ✓ All migrations complete');
}

module.exports = { runMigrations };
```

Now create the seed data file. Seed data populates the database with initial records so the app isn't empty on first run.

Create backend/src/db/seed.js:

```yaml
// src/db/seed.js
//
// PURPOSE: Insert sample data into the database for development and testing.
// Only runs if the table is empty (idempotent).

'use strict';

const { query } = require('./pool');

const seedItems = [
  {
    name: 'Cloud-Native Architecture Guide',
    description: 'A comprehensive guide to building applications for the cloud',
    status: 'active',
  },
  {
    name: 'Docker Containerization Handbook',
    description: 'Everything you need to know about containerizing applications',
    status: 'active',
  },
  {
    name: 'AWS ECS Fargate Deployment',
    description: 'Step-by-step guide to deploying containers on AWS Fargate',
    status: 'active',
  },
  {
    name: 'Terraform Infrastructure as Code',
    description: 'Automating cloud infrastructure with Terraform',
    status: 'active',
  },
  {
    name: 'PostgreSQL Performance Tuning',
    description: 'Optimizing PostgreSQL for production workloads',
    status: 'inactive',
  },
];

async function seedDatabase() {
  // Check if data already exists
  const countResult = await query('SELECT COUNT() FROM items');
  const count = parseInt(countResult.rows[0].count, 10);

  if (count > 0) {
    console.log([DB] Seed skipped — ${count} items already exist);
    return;
  }

  console.log('[DB] Seeding database with sample data...');

  for (const item of seedItems) {
    await query(
      INSERT INTO items (name, description, status)
       VALUES ($1, $2, $3),
      [item.name, item.description, item.status]
    );
  }

  console.log([DB] ✓ Seeded ${seedItems.length} items);
}

module.exports = { seedDatabase };
```

### Step 1.11 — Create the Logger Utility

Production applications don't use console.log for logging. They use a structured logger that:
• Formats logs as JSON (so CloudWatch can parse and search them)
• Includes timestamps and severity levels
• Can be configured to show/hide debug logs

For simplicity and to avoid heavy dependencies, we'll build a lightweight structured logger:

Create backend/src/utils/logger.js:

```javascript
// src/utils/logger.js
//
// PURPOSE: Structured logging utility.
//
// WHY STRUCTURED LOGGING: When your app logs "Error connecting to database",
// that's useful. When it logs a JSON object with timestamp, error code,
// hostname, and request ID, CloudWatch can:
//   - Filter logs by severity
//   - Create metrics from error counts
//   - Correlate logs across multiple containers
//   - Trigger alarms on error spikes

'use strict';

const config = require('../config');

// Log levels in order of severity
const LEVELS = {
  debug: 0,
  info: 1,
  warn: 2,
  error: 3,
};

// Current level from config — logs below this level are suppressed
const currentLevel = LEVELS[config.logging.level] ?? LEVELS.debug;

function formatLog(level, message, meta = {}) {
  const entry = {
    timestamp: new Date().toISOString(),  // ISO 8601 format — standard in the industry
    level,
    service: config.app.name,
    message,
    ...meta,  // Spread any additional context (request ID, user ID, etc.)
  };

  // In production, output compact JSON (one log entry per line)
  // CloudWatch, Splunk, Datadog all parse JSON logs natively
  if (config.app.isProduction) {
    return JSON.stringify(entry);
  }

  // In development, output readable format
  const metaStr = Object.keys(meta).length 
    ? '\n  ' + JSON.stringify(meta, null, 2).replace(/\n/g, '\n  ')
    : '';
  return [${entry.timestamp}] ${level.toUpperCase().padEnd(5)} ${message}${metaStr};
}

const logger = {
  debug(message, meta) {
    if (LEVELS.debug >= currentLevel) {
      console.debug(formatLog('debug', message, meta));
    }
  },
  info(message, meta) {
    if (LEVELS.info >= currentLevel) {
      console.info(formatLog('info', message, meta));
    }
  },
  warn(message, meta) {
    if (LEVELS.warn >= currentLevel) {
      console.warn(formatLog('warn', message, meta));
    }
  },
  error(message, meta) {
    if (LEVELS.error >= currentLevel) {
      // If meta contains an Error object, extract the stack trace
      if (meta?.error instanceof Error) {
        meta = {
          ...meta,
          errorMessage: meta.error.message,
          stack: config.app.isDevelopment ? meta.error.stack : undefined,
        };
        delete meta.error; // Don't try to JSON.stringify an Error object directly
      }
      console.error(formatLog('error', message, meta));
    }
  },
};

module.exports = logger;
```

### Step 1.12 — Create the Middleware

Middleware is code that runs on every HTTP request before it reaches your route handler. Think of it as a security checkpoint and logging booth at the entrance to your API.

```text
Incoming Request
       │
       ▼
  ┌─────────────┐
  │   helmet    │  ← Sets security headers
  └──────┬──────┘
         │
         ▼
  ┌─────────────┐
  │    cors     │  ← Checks if this origin is allowed
  └──────┬──────┘
         │
         ▼
  ┌─────────────┐
  │   morgan    │  ← Logs the request
  └──────┬──────┘
         │
         ▼
  ┌─────────────┐
  │ json parser │  ← Parses JSON body
  └──────┬──────┘
         │
         ▼
  ┌──────────────────┐
  │  Route Handler   │  ← Your actual code
  └──────┬───────────┘
         │
         ▼
  ┌──────────────────┐
  │  Error Handler   │  ← Catches any thrown errors
  └──────────────────┘
```

Create backend/src/middleware/requestLogger.js:

```javascript
// src/middleware/requestLogger.js
//
// PURPOSE: Log every incoming HTTP request with timing information.
// We use morgan for access logging but add our own structured logger on top.

'use strict';

const morgan = require('morgan');
const logger = require('../utils/logger');

// Custom morgan token: adds the request body to logs
// WARNING: In production, sanitize this to not log passwords or tokens
morgan.token('body', (req) => {
  const body = { ...req.body };
  // Remove sensitive fields before logging
  delete body.password;
  delete body.token;
  delete body.secret;
  return JSON.stringify(body);
});

// Custom morgan format for our structured logger
const morganMiddleware = morgan(
  // In production, log as JSON
  (tokens, req, res) => {
    return JSON.stringify({
      type: 'http',
      method: tokens.method(req, res),
      url: tokens.url(req, res),
      status: parseInt(tokens.status(req, res), 10),
      responseTime: ${tokens'response-time'}ms,
      contentLength: tokens.res(req, res, 'content-length'),
      userAgent: tokens'user-agent',
    });
  },
  {
    // Skip logging for health check endpoints
    // (Health checks run every 30 seconds — you don't want thousands of log lines)
    skip: (req) => req.url === '/health' || req.url === '/metrics',
    stream: {
      write: (message) => logger.info(message.trim()),
    },
  }
);

module.exports = morganMiddleware;
```

Create backend/src/middleware/errorHandler.js:

```text
// src/middleware/errorHandler.js
//
// PURPOSE: Centralized error handling.
//
// WHY CENTRALIZED: Without this, every route has its own try/catch and
// its own way of formatting error responses. With centralized handling,
// error format is consistent and you only need to maintain one place.
//
// HOW IT WORKS: Express's error handling middleware has FOUR parameters:
// (err, req, res, next). The fourth parameter (err) tells Express this
// is an error handler, not a normal middleware.

'use strict';

const logger = require('../utils/logger');
const config = require('../config');

// Custom error class for operational errors (expected errors we handle)
// vs programmer errors (bugs — unexpected, should crash)
class AppError extends Error {
  constructor(message, statusCode, code = null) {
    super(message);
    this.statusCode = statusCode;
    this.code = code;         // Machine-readable error code (e.g., 'VALIDATIONERROR')
    this.isOperational = true; // Marks this as an expected, handled error
    Error.captureStackTrace(this, this.constructor);
  }
}

// ── The actual error handler middleware ─────────────────────────────

function errorHandler(err, req, res, next) {
  // If headers already sent, delegate to Express's default handler
  // This happens when an error occurs after res.json() was already called
  if (res.headersSent) {
    return next(err);
  }

  // Log the error (always log, regardless of status code)
  logger.error('Request error', {
    error: err,
    method: req.method,
    url: req.url,
    statusCode: err.statusCode || 500,
    isOperational: err.isOperational || false,
  });

  // Determine status code
  // Operational errors (AppError) have explicit status codes
  // Everything else is a 500 Internal Server Error
  const statusCode = err.statusCode || 500;

  // Build the response object
  const response = {
    success: false,
    error: {
      // In production, never expose internal error messages to the client
      // In development, show the real message (helps debugging)
      message: config.app.isProduction && !err.isOperational
        ? 'An internal server error occurred'
        : err.message,
      code: err.code || 'INTERNALERROR',
    },
  };

  // In development, include the stack trace to help debugging
  if (config.app.isDevelopment) {
    response.error.stack = err.stack;
  }

  res.status(statusCode).json(response);
}

// ── 404 handler ─────────────────────────────────────────────────────
// Catches requests that didn't match any route

function notFoundHandler(req, res, next) {
  next(new AppError(Route not found: ${req.method} ${req.url}, 404, 'NOTFOUND'));
}

module.exports = { errorHandler, notFoundHandler, AppError };
```

### Step 1.13 — Create the Item Service

The service layer contains the actual business logic. It talks to the database. Controllers (which we'll write next) call services. Services know nothing about HTTP — they just take inputs and return data.

This separation means:
• You can test service logic without an HTTP server
• You can change the HTTP layer without touching business logic
• Multiple controllers can reuse the same service function

Create backend/src/services/itemService.js:

```text
// src/services/itemService.js
//
// PURPOSE: All business logic and database operations for items.
// This layer knows about the database but knows nothing about HTTP
// (no req, no res, no status codes here).

'use strict';

const { query } = require('../db/pool');
const { AppError } = require('../middleware/errorHandler');
const logger = require('../utils/logger');

const itemService = {
  // ── Get all items ────────────────────────────────────────────────
  async getAllItems({ status, limit = 50, offset = 0 } = {}) {
    logger.debug('itemService.getAllItems called', { status, limit, offset });

    // Build query dynamically based on whether a filter was provided
    // Using parameterized query to prevent SQL injection
    let sql = 
      SELECT 
        id,
        name,
        description,
        status,
        createdat AS "createdAt",
        updatedat AS "updatedAt"
      FROM items
    ;
    const params = [];
    let paramIndex = 1;

    // Optional filter by status
    if (status) {
      sql +=  WHERE status = $${paramIndex++};
      params.push(status);
    }

    // Always sort newest first (consistent, predictable ordering)
    sql +=  ORDER BY createdat DESC;

    // Pagination — LIMIT and OFFSET prevent loading millions of rows
    sql +=  LIMIT $${paramIndex++} OFFSET $${paramIndex++};
    params.push(limit, offset);

    const result = await query(sql, params);

    // Get total count for pagination metadata
    let countSql = 'SELECT COUNT() FROM items';
    const countParams = [];
    if (status) {
      countSql +=  WHERE status = $1;
      countParams.push(status);
    }
    const countResult = await query(countSql, countParams);
    const total = parseInt(countResult.rows[0].count, 10);

    return {
      items: result.rows,
      pagination: {
        total,
        limit,
        offset,
        hasMore: offset + limit < total,
      },
    };
  },

  // ── Get single item by ID ────────────────────────────────────────
  async getItemById(id) {
    logger.debug('itemService.getItemById called', { id });

    const result = await query(
      SELECT 
        id,
        name,
        description,
        status,
        createdat AS "createdAt",
        updatedat AS "updatedAt"
       FROM items
       WHERE id = $1,
      [id]
    );

    if (result.rows.length === 0) {
      // Throw an AppError with 404 — the controller will catch this
      // and the centralized error handler will format the response
      throw new AppError(Item not found: ${id}, 404, 'ITEMNOTFOUND');
    }

    return result.rows[0];
  },

  // ── Create a new item ────────────────────────────────────────────
  async createItem({ name, description, status = 'active' }) {
    logger.debug('itemService.createItem called', { name, status });

    const result = await query(
      INSERT INTO items (name, description, status)
       VALUES ($1, $2, $3)
       RETURNING 
         id,
         name,
         description,
         status,
         createdat AS "createdAt",
         updatedat AS "updatedAt",
      [name, description || null, status]
    );

    logger.info('Item created', { itemId: result.rows[0].id, name });

    // RETURNING clause gives us back the created row immediately
    // without needing a second SELECT query
    return result.rows[0];
  },

  // ── Update an existing item ──────────────────────────────────────
  async updateItem(id, { name, description, status }) {
    logger.debug('itemService.updateItem called', { id, name, status });

    // First verify the item exists
    await itemService.getItemById(id); // Throws 404 if not found

    const result = await query(
      UPDATE items
       SET 
         name        = COALESCE($1, name),
         description = COALESCE($2, description),
         status      = COALESCE($3, status)
       WHERE id = $4
       RETURNING 
         id, name, description, status,
         createdat AS "createdAt",
         updatedat AS "updatedAt",
      [name || null, description || null, status || null, id]
    );

    // COALESCE(value, existingcolumn) means:
    // "Use the new value if provided, otherwise keep the existing value"
    // This allows partial updates (PATCH semantics)

    logger.info('Item updated', { itemId: id });
    return result.rows[0];
  },

  // ── Delete an item ───────────────────────────────────────────────
  async deleteItem(id) {
    logger.debug('itemService.deleteItem called', { id });

    // Verify item exists first
    await itemService.getItemById(id); // Throws 404 if not found

    await query('DELETE FROM items WHERE id = $1', [id]);

    logger.info('Item deleted', { itemId: id });
    return { deleted: true, id };
  },
};

module.exports = itemService;
```

### Step 1.14 — Create the Controllers

Controllers sit between routes and services. They:
Parse and validate the HTTP request
Call the appropriate service function
Format and send the HTTP response

Create backend/src/controllers/itemController.js:

```text
// src/controllers/itemController.js
//
// PURPOSE: Handle HTTP request/response for item-related endpoints.
// Controllers call services — they don't contain business logic themselves.

'use strict';

const { validationResult } = require('express-validator');
const itemService = require('../services/itemService');
const { AppError } = require('../middleware/errorHandler');
const logger = require('../utils/logger');

const itemController = {
  // ── GET /api/items ────────────────────────────────────────────────
  async getAllItems(req, res, next) {
    try {
      // Parse query parameters with safe defaults
      const {
        status,
        limit = '50',
        offset = '0',
      } = req.query;

      // Validate limit and offset are valid numbers
      const limitNum = parseInt(limit, 10);
      const offsetNum = parseInt(offset, 10);

      if (isNaN(limitNum) || limitNum < 1 || limitNum > 100) {
        throw new AppError('limit must be a number between 1 and 100', 400, 'INVALIDPAGINATION');
      }
      if (isNaN(offsetNum) || offsetNum < 0) {
        throw new AppError('offset must be a non-negative number', 400, 'INVALIDPAGINATION');
      }

      const result = await itemService.getAllItems({
        status,
        limit: limitNum,
        offset: offsetNum,
      });

      // Standard API response envelope:
      // { success, data, pagination }
      // Using a consistent envelope means your frontend always knows
      // what shape to expect
      res.json({
        success: true,
        data: result.items,
        pagination: result.pagination,
      });
    } catch (error) {
      // Pass to centralized error handler
      next(error);
    }
  },

  // ── GET /api/items/:id ────────────────────────────────────────────
  async getItemById(req, res, next) {
    try {
      const { id } = req.params;
      const item = await itemService.getItemById(id);

      res.json({
        success: true,
        data: item,
      });
    } catch (error) {
      next(error);
    }
  },

  // ── POST /api/items ───────────────────────────────────────────────
  async createItem(req, res, next) {
    try {
      // Check validation errors set by express-validator middleware
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        throw new AppError(
          'Validation failed',
          422,
          'VALIDATIONERROR'
        );
      }

      const { name, description, status } = req.body;

      const item = await itemService.createItem({ name, description, status });

      // 201 Created — not 200 OK — for resource creation
      res.status(201).json({
        success: true,
        data: item,
        message: 'Item created successfully',
      });
    } catch (error) {
      next(error);
    }
  },

  // ── PUT /api/items/:id ────────────────────────────────────────────
  async updateItem(req, res, next) {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        throw new AppError('Validation failed', 422, 'VALIDATIONERROR');
      }

      const { id } = req.params;
      const { name, description, status } = req.body;

      const item = await itemService.updateItem(id, { name, description, status });

      res.json({
        success: true,
        data: item,
        message: 'Item updated successfully',
      });
    } catch (error) {
      next(error);
    }
  },

  // ── DELETE /api/items/:id ─────────────────────────────────────────
  async deleteItem(req, res, next) {
    try {
      const { id } = req.params;
      const result = await itemService.deleteItem(id);

      res.json({
        success: true,
        data: result,
        message: 'Item deleted successfully',
      });
    } catch (error) {
      next(error);
    }
  },
};

module.exports = itemController;
```

### Step 1.15 — Create the Routes

Routes map URL patterns to controller functions. They also attach validation rules.

Create backend/src/routes/items.js:

```text
// src/routes/items.js
//
// PURPOSE: Define all URL routes for the /api/items resource.
// Attach validation rules as middleware before the controller.

'use strict';

const express = require('express');
const { body, param } = require('express-validator');
const itemController = require('../controllers/itemController');

const router = express.Router();

// ── Validation rules ───────────────────────────────────────────────
// express-validator checks run as middleware before the controller.
// If validation fails, the controller reads the errors with validationResult().

const createItemValidation = [
  body('name')
    .trim()                                    // Remove leading/trailing whitespace
    .notEmpty().withMessage('Name is required')
    .isLength({ min: 1, max: 255 }).withMessage('Name must be 1-255 characters'),
  
  body('description')
    .optional()                                // Not required
    .trim()
    .isLength({ max: 2000 }).withMessage('Description must be under 2000 characters'),
  
  body('status')
    .optional()
    .isIn(['active', 'inactive', 'archived'])
    .withMessage('Status must be: active, inactive, or archived'),
];

const updateItemValidation = [
  param('id')
    .isUUID().withMessage('Item ID must be a valid UUID'),

  body('name')
    .optional()
    .trim()
    .isLength({ min: 1, max: 255 }).withMessage('Name must be 1-255 characters'),

  body('description')
    .optional()
    .trim()
    .isLength({ max: 2000 }).withMessage('Description must be under 2000 characters'),

  body('status')
    .optional()
    .isIn(['active', 'inactive', 'archived'])
    .withMessage('Status must be: active, inactive, or archived'),
];

const uuidParamValidation = [
  param('id')
    .isUUID().withMessage('Item ID must be a valid UUID'),
];

// ── Route definitions ─────────────────────────────────────────────
// RESTful convention:
//   GET    /api/items        → list all
//   GET    /api/items/:id    → get one
//   POST   /api/items        → create new
//   PUT    /api/items/:id    → replace/update
//   DELETE /api/items/:id    → remove

router.get('/',    itemController.getAllItems);
router.get('/:id', uuidParamValidation, itemController.getItemById);
router.post('/',   createItemValidation, itemController.createItem);
router.put('/:id', updateItemValidation, itemController.updateItem);
router.delete('/:id', uuidParamValidation, itemController.deleteItem);

module.exports = router;
```

Create backend/src/routes/health.js:

```yaml
// src/routes/health.js
//
// PURPOSE: Health check endpoints.
//
// WHY HEALTH CHECKS MATTER: AWS ALB (load balancer) sends a GET /health
// request every 30 seconds to each container. If the response is not 200,
// the container is marked unhealthy and taken out of rotation.
// ECS then starts a replacement container.
//
// /health     → Simple liveness check (is the process running?)
// /health/db  → Readiness check (is the database reachable?)

'use strict';

const express = require('express');
const { pool } = require('../db/pool');
const config = require('../config');

const router = express.Router();

// Simple liveness check — just confirms the server is running
// Returns 200 immediately without touching the database
router.get('/', (req, res) => {
  res.json({
    status: 'healthy',
    service: config.app.name,
    version: process.env.npmpackageversion || '1.0.0',
    timestamp: new Date().toISOString(),
    uptime: Math.floor(process.uptime()),
    environment: config.app.nodeEnv,
  });
});

// Deep health check — verifies database connectivity
// Use this as the ALB health check target in production
router.get('/db', async (req, res) => {
  const start = Date.now();
  let client;
  
  try {
    client = await pool.connect();
    await client.query('SELECT 1');
    const dbResponseTime = Date.now() - start;

    res.json({
      status: 'healthy',
      database: {
        status: 'connected',
        responseTime: ${dbResponseTime}ms,
      },
      timestamp: new Date().toISOString(),
    });
  } catch (error) {
    res.status(503).json({  // 503 Service Unavailable
      status: 'unhealthy',
      database: {
        status: 'disconnected',
        error: error.message,
      },
      timestamp: new Date().toISOString(),
    });
  } finally {
    if (client) client.release();
  }
});

module.exports = router;
```

Create backend/src/routes/metrics.js:

```javascript
// src/routes/metrics.js
//
// PURPOSE: Expose application metrics in a simple JSON format.
// In a full production setup, you'd use Prometheus-format metrics
// and scrape them with a metrics collector.
// For this project, a simple JSON endpoint is clear and sufficient.

'use strict';

const express = require('express');
const { pool } = require('../db/pool');
const os = require('os');

const router = express.Router();

// Track request count since startup (in-memory — resets on restart)
let requestCount = 0;
let errorCount = 0;
const startTime = Date.now();

// Middleware to count requests — applied globally in server.js
function countRequests(req, res, next) {
  requestCount++;
  
  // Hook into response finish event to count errors
  res.on('finish', () => {
    if (res.statusCode >= 500) errorCount++;
  });
  
  next();
}

router.get('/', async (req, res) => {
  const uptimeSeconds = Math.floor((Date.now() - startTime) / 1000);
  
  // Get pool stats
  const poolStats = {
    total: pool.totalCount,
    idle: pool.idleCount,
    waiting: pool.waitingCount,
  };

  res.json({
    uptime: {
      seconds: uptimeSeconds,
      human: formatUptime(uptimeSeconds),
    },
    process: {
      pid: process.pid,
      memoryUsage: {
        heapUsed: ${Math.round(process.memoryUsage().heapUsed / 1024 / 1024)}MB,
        heapTotal: ${Math.round(process.memoryUsage().heapTotal / 1024 / 1024)}MB,
        rss: ${Math.round(process.memoryUsage().rss / 1024 / 1024)}MB,
      },
      cpuUsage: process.cpuUsage(),
    },
    system: {
      platform: os.platform(),
      arch: os.arch(),
      cpus: os.cpus().length,
      totalMemory: ${Math.round(os.totalmem() / 1024 / 1024)}MB,
      freeMemory: ${Math.round(os.freemem() / 1024 / 1024)}MB,
      loadAverage: os.loadavg(),
    },
    database: {
      pool: poolStats,
    },
    requests: {
      total: requestCount,
      errors: errorCount,
      errorRate: requestCount > 0
        ? ${((errorCount / requestCount)  100).toFixed(2)}%
        : '0%',
    },
  });
});

function formatUptime(seconds) {
  const d = Math.floor(seconds / 86400);
  const h = Math.floor((seconds % 86400) / 3600);
  const m = Math.floor((seconds % 3600) / 60);
  const s = seconds % 60;
  return ${d}d ${h}h ${m}m ${s}s;
}

module.exports = { metricsRouter: router, countRequests };
```

### Step 1.16 — Create the Main Server File

This is the entry point that wires everything together.

Create backend/server.js:

```text
// server.js
//
// PURPOSE: Application entry point.
// Creates the Express app, attaches all middleware and routes,
// connects to the database, and starts the HTTP server.
//
// BOOT SEQUENCE:
//   1. Load config (fail fast if env vars missing)
//   2. Test database connection (fail fast if DB unreachable)
//   3. Run migrations (ensure schema is current)
//   4. Seed development data
//   5. Start HTTP server
//   6. Register shutdown handlers

'use strict';

const express = require('express');
const cors = require('cors');
const helmet = require('helmet');

const config = require('./src/config');
const logger = require('./src/utils/logger');
const { testConnection, closePool } = require('./src/db/pool');
const { runMigrations } = require('./src/db/migrate');
const { seedDatabase } = require('./src/db/seed');
const requestLogger = require('./src/middleware/requestLogger');
const { errorHandler, notFoundHandler } = require('./src/middleware/errorHandler');
const { metricsRouter, countRequests } = require('./src/routes/metrics');
const healthRouter = require('./src/routes/health');
const itemsRouter = require('./src/routes/items');

// ── Create Express application ────────────────────────────────────

const app = express();

// ── Security middleware ───────────────────────────────────────────

// helmet sets these HTTP headers:
//   X-Content-Type-Options: nosniff       (prevent MIME type sniffing)
//   X-Frame-Options: DENY                 (prevent clickjacking)
//   X-XSS-Protection: 1; mode=block      (basic XSS protection)
//   Strict-Transport-Security: max-age=  (force HTTPS)
//   ...and more
app.use(helmet());

// cors allows the React frontend to call this API
// Without this, browsers block cross-origin requests
app.use(cors({
  origin: config.cors.origin,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true,
  maxAge: 86400, // Cache CORS preflight response for 24 hours
}));

// ── Request processing middleware ─────────────────────────────────

// Parse JSON request bodies
// limit: '10mb' prevents large payload attacks
app.use(express.json({ limit: '10mb' }));

// Parse URL-encoded form bodies (for completeness)
app.use(express.urlencoded({ extended: true, limit: '10mb' }));

// Log every request
app.use(requestLogger);

// Count requests for metrics
app.use(countRequests);

// ── Routes ────────────────────────────────────────────────────────

// Health checks — mounted at /health
app.use('/health', healthRouter);

// Metrics — mounted at /metrics
app.use('/metrics', metricsRouter);

// API routes — mounted at /api
app.use('/api/items', itemsRouter);

// Root endpoint
app.get('/', (req, res) => {
  res.json({
    service: config.app.name,
    version: '1.0.0',
    status: 'running',
    docs: '/health',
  });
});

// ── Error handling (MUST be last) ─────────────────────────────────

// 404 handler — catches requests that didn't match any route
app.use(notFoundHandler);

// Central error handler — catches all errors thrown by routes
app.use(errorHandler);

// ── Startup function ──────────────────────────────────────────────

async function startServer() {
  logger.info(Starting ${config.app.name}...);
  logger.info(Environment: ${config.app.nodeEnv});

  try {
    // Step 1: Test database connectivity before accepting traffic
    await testConnection();

    // Step 2: Run database migrations
    await runMigrations();

    // Step 3: Seed development data (only runs if table is empty)
    if (config.app.isDevelopment) {
      await seedDatabase();
    }

    // Step 4: Start HTTP server
    const server = app.listen(config.app.port, () => {
      logger.info(✓ Server running on http://localhost:${config.app.port});
      logger.info(✓ Health: http://localhost:${config.app.port}/health);
      logger.info(✓ API:    http://localhost:${config.app.port}/api/items);
      logger.info(✓ Metrics: http://localhost:${config.app.port}/metrics);
    });

    // ── Graceful shutdown handlers ────────────────────────────────
    // When a container is stopped (SIGTERM), we:
    // 1. Stop accepting new connections
    // 2. Wait for in-flight requests to complete
    // 3. Close the database pool
    // This prevents dropped requests during deployments

    async function shutdown(signal) {
      logger.info(${signal} received — starting graceful shutdown);

      server.close(async () => {
        logger.info('HTTP server closed — no new connections');

        try {
          await closePool();
          logger.info('Database pool closed');
          logger.info('Shutdown complete');
          process.exit(0);
        } catch (err) {
          logger.error('Error during shutdown', { error: err });
          process.exit(1);
        }
      });

      // Force exit after 30 seconds if graceful shutdown stalls
      setTimeout(() => {
        logger.error('Graceful shutdown timed out — forcing exit');
        process.exit(1);
      }, 30000);
    }

    process.on('SIGTERM', () => shutdown('SIGTERM'));
    process.on('SIGINT',  () => shutdown('SIGINT'));

    // Handle unhandled promise rejections
    process.on('unhandledRejection', (reason, promise) => {
      logger.error('Unhandled promise rejection', {
        reason: reason?.message || reason,
        stack: reason?.stack,
      });
      // In production, consider restarting the process here
      // ECS will restart the container if it exits
    });

    // Handle uncaught exceptions
    process.on('uncaughtException', (error) => {
      logger.error('Uncaught exception', { error });
      process.exit(1); // Always exit on uncaught exceptions — they indicate bugs
    });

    return server;
  } catch (error) {
    logger.error('Failed to start server', { error });
    process.exit(1);
  }
}

// Start the application
startServer();
```

### Step 1.17 — Set Up the PostgreSQL Database Locally

Now we need to create the actual database that our app will connect to.

```bash
Connect to PostgreSQL as the default superuser
psql -U postgres
```

If you get a password prompt, use whatever password you set during PostgreSQL installation. On Mac with Homebrew, it might be passwordless.

Inside the psql shell, run:

```sql
-- Create the database
CREATE DATABASE cloudnativedb;

-- Verify it was created
\l

-- Connect to the new database
\c cloudnativedb

-- Verify the connection
SELECT currentdatabase();

-- Exit psql
\q
```

Expected output after \l:
```text
                                  List of databases
     Name      |  Owner   | Encoding |   Collate   |    Ctype    |   
---------------+----------+----------+-------------+-------------+
 cloudnativedb | postgres | UTF8     | enUS.UTF-8 | enUS.UTF-8 |
 postgres      | postgres | UTF8     | enUS.UTF-8 | enUS.UTF-8 |
```

### Step 1.18 — Run the Backend

Now let's start the server and watch it boot:

```bash
Make sure you're in the backend folder
cd /path/to/cloud-native-app/backend

Start in development mode (with nodemon auto-restart)
npm run dev
```

Expected output:
```text
[2024-01-15T10:00:00.000Z] INFO  Starting cloud-native-backend...
[2024-01-15T10:00:00.001Z] INFO  Environment: development
[DB] New connection established to PostgreSQL
[DB] ✓ PostgreSQL connected successfully
[DB] Server time: 2024-01-15 10:00:00.123+00
[DB] Version: PostgreSQL 15.4 on aarch64-apple-darwin
[DB] Running migrations...
[DB] ✓ Migration applied: 001createitemstable
[DB] ✓ Migration applied: 002createitemsstatusindex
[DB] ✓ Migration applied: 003createitemscreatedatindex
[DB] ✓ Migration applied: 004createupdatetimestampfunction
[DB] ✓ Migration applied: 005createitemsupdatetrigger
[DB] ✓ All migrations complete
[DB] Seeding database with sample data...
[DB] ✓ Seeded 5 items
[2024-01-15T10:00:00.456Z] INFO  ✓ Server running on http://localhost:3000
[2024-01-15T10:00:00.457Z] INFO  ✓ Health: http://localhost:3000/health
[2024-01-15T10:00:00.458Z] INFO  ✓ API:    http://localhost:3000/api/items
[2024-01-15T10:00:00.459Z] INFO  ✓ Metrics: http://localhost:3000/metrics
```

### Step 1.19 — Verify Every Endpoint

Open a new terminal window (keep the server running in the first one).

Test 1: Health Check

```bash
curl -s http://localhost:3000/health | jsonpp
```

(If jsonpp isn't available, use python3 -m json.tool instead: curl -s http://localhost:3000/health | python3 -m json.tool)

Expected response:
```json
{
   "environment" : "development",
   "service" : "cloud-native-backend",
   "status" : "healthy",
   "timestamp" : "2024-01-15T10:00:30.000Z",
   "uptime" : 30,
   "version" : "1.0.0"
}
```

Test 2: Database Health Check

```bash
curl -s http://localhost:3000/health/db | python3 -m json.tool
```

Expected response:
```json
{
   "database" : {
      "responseTime" : "2ms",
      "status" : "connected"
   },
   "status" : "healthy",
   "timestamp" : "2024-01-15T10:00:35.000Z"
}
```

Test 3: Get All Items

```bash
curl -s http://localhost:3000/api/items | python3 -m json.tool
```

Expected response:
```json
{
   "data" : [
      {
         "createdAt" : "2024-01-15T10:00:00.000Z",
         "description" : "A comprehensive guide to building applications for the cloud",
         "id" : "550e8400-e29b-41d4-a716-446655440000",
         "name" : "Cloud-Native Architecture Guide",
         "status" : "active",
         "updatedAt" : "2024-01-15T10:00:00.000Z"
      },
      ...
   ],
   "pagination" : {
      "hasMore" : false,
      "limit" : 50,
      "offset" : 0,
      "total" : 5
   },
   "success" : true
}
```

Test 4: Create an Item

```bash
curl -s -X POST http://localhost:3000/api/items \
  -H "Content-Type: application/json" \
  -d '{"name":"My New Item","description":"Testing the POST endpoint","status":"active"}' \
  | python3 -m json.tool
```

Expected response:
```json
{
   "data" : {
      "createdAt" : "2024-01-15T10:01:00.000Z",
      "description" : "Testing the POST endpoint",
      "id" : "7c8f4d20-3a1b-4e9f-b5d2-123456789abc",
      "name" : "My New Item",
      "status" : "active",
      "updatedAt" : "2024-01-15T10:01:00.000Z"
   },
   "message" : "Item created successfully",
   "success" : true
}
```

Test 5: Get Item by ID (use the ID from the previous response)

```bash
Replace the UUID with one from your actual response
curl -s http://localhost:3000/api/items/7c8f4d20-3a1b-4e9f-b5d2-123456789abc \
  | python3 -m json.tool
```

Test 6: Validation Error

```bash
Send an empty name to test validation
curl -s -X POST http://localhost:3000/api/items \
  -H "Content-Type: application/json" \
  -d '{"name":"","status":"invalidstatus"}' \
  | python3 -m json.tool
```

Expected response (422 Unprocessable Entity):
```json
{
   "error" : {
      "code" : "VALIDATIONERROR",
      "message" : "Validation failed"
   },
   "success" : false
}
```

Test 7: Metrics

```bash
curl -s http://localhost:3000/metrics | python3 -m json.tool
```

Test 8: 404 Handler

```bash
curl -s http://localhost:3000/api/nonexistent | python3 -m json.tool
```

Expected response:
```json
{
   "error" : {
      "code" : "NOTFOUND",
      "message" : "Route not found: GET /api/nonexistent"
   },
   "success" : false
}
```

### Step 1.20 — Verify the Final Folder Structure

```dockerfile
From the backend folder
find . -not -path './nodemodules/' -not -name '.map'
```

Expected output:
```text
.
./server.js
./package.json
./package-lock.json
./.env
./.env.example
./.gitignore
./src
./src/config
./src/config/index.js
./src/db
./src/db/pool.js
./src/db/migrate.js
./src/db/seed.js
./src/middleware
./src/middleware/errorHandler.js
./src/middleware/requestLogger.js
./src/utils
./src/utils/logger.js
./src/routes
./src/routes/health.js
./src/routes/metrics.js
./src/routes/items.js
./src/controllers
./src/controllers/itemController.js
./src/services
./src/services/itemService.js
```

### Phase 1 Troubleshooting
Problem: "Cannot connect to PostgreSQL"

Symptom: Error: connect ECONNREFUSED 127.0.0.1:5432

Diagnosis and fix:

```bash
Check if PostgreSQL is running
pgisready

If not running on Mac:
brew services start postgresql@15

If not running on Linux:
sudo systemctl start postgresql

Verify the database exists:
psql -U postgres -c "\l" | grep cloudnativedb

If it doesn't exist:
psql -U postgres -c "CREATE DATABASE cloudnativedb;"

Verify .env has correct credentials
cat .env
```

Problem: "MODULENOTFOUND"

Symptom: Error: Cannot find module 'express'

Fix:

```bash
You probably forgot to install dependencies
npm install

Verify the module exists
ls nodemodules/express
```

Problem: "Port already in use"

Symptom: Error: listen EADDRINUSE: address already in use :::3000

Fix:

```bash
Find what's using port 3000
lsof -i :3000

Kill it (replace PID with the actual number)
kill -9 <PID>

Or change the port in .env
PORT=3001
```

Problem: "Authentication failed for user postgres"

Symptom: error: password authentication failed for user "postgres"

Fix: Update DBPASSWORD in your .env to match the password you set when you installed PostgreSQL. If you don't know it, you can reset it:

```dotenv
On Mac/Linux, edit pghba.conf to use trust authentication temporarily
Easier: just create a new user
psql -U postgres -c "ALTER USER postgres WITH PASSWORD 'newpassword';"
Then update .env: DBPASSWORD=newpassword
```

### Phase 1 Summary
#### What You Built

A production-structured Node.js REST API with:

| Component | What it Does |
|-----------|-------------|
| Config loader | Validates environment variables at startup, fails fast |
| Connection pool | Efficiently reuses PostgreSQL connections |
| Migration runner | Versioned schema management |
| Structured logger | JSON logs readable by CloudWatch |
| Centralized error handler | Consistent error responses, no sensitive data leakage |
| Request logger | Every HTTP request tracked |
| Input validation | Never trust user input |
| Health endpoints | Required for ALB health checks on AWS |
| Metrics endpoint | Runtime visibility |
| CRUD API | Full item resource with proper HTTP methods |
| Graceful shutdown | Clean container stopping without dropped requests |

Skills Gained
• REST API design — resource naming, HTTP methods, status codes
• Layered architecture — routes → controllers → services → database
• Environment-based configuration — secrets never hardcoded
• Database connection pooling — production database access patterns
• SQL parameterization — primary SQL injection defense
• Async/await — modern JavaScript async patterns
• Express middleware — request pipeline understanding
• Error handling patterns — operational vs programmer errors

How This Maps to Cloud Engineering Jobs

In a real cloud engineering role, you will:
• Be handed a codebase structured exactly like this
• Be asked to containerize it (Phase 3)
• Be asked to deploy it to ECS (Phase 6)
• Be asked to wire it to RDS (Phase 5)
• Need to understand the health check endpoint for ALB configuration
• Need to understand the graceful shutdown for zero-downtime deployments

Mini Interview Questions
#### What is connection pooling and why is it critical in a serverless/container environment?

#### What is the difference between a 404 and a 422 response? When would you use each?

#### What is SQL injection and how do parameterized queries prevent it?

What does SIGTERM mean and why does a production Node.js app need to handle it?

Why should error messages in production be generic while development error messages are detailed?

#### What is the purpose of the CORS middleware and when would you need to change the origin?

Debugging Exercises
Remove the connection pool and create a new pg.Client() for every request. Hit the API 100 times rapidly. What happens? Why?

Comment out dotenv.config() in config/index.js. Restart the server. What is the exact error message? Why does the config fail before any routes are hit?

Change DBMAXCONNECTIONS to 1 in .env. Use a tool like Apache Bench (ab -n 100 -c 10 http://localhost:3000/api/items) to send 10 concurrent requests. Watch the pool in the metrics endpoint. What do you see?

Try a SQL injection: POST to /api/items with "name": "test'); DROP TABLE items;--". Check the database. Did it work? Why not?

Production Thinking Exercises
This app currently uses genrandomuuid() in PostgreSQL to generate IDs. In a multi-region setup where you might eventually merge databases, why is UUID better than SERIAL (auto-increment integers)?

The seed data runs on every startup if the table is empty. In production, what problem could this cause during a rolling deployment where two containers start simultaneously?

Look at the graceful shutdown code. We wait 30 seconds before force-exiting. Why 30 seconds specifically? What would happen with a 1-second timeout?

## PHASE 2 — Build the React Frontend Locally

### Phase 2 Goal

Build a production-grade React + Vite frontend that:
• Connects to the backend API
• Displays, creates, and manages items
• Handles loading states, errors, and empty states
• Is structured for production deployment to S3
• Uses environment variables for API configuration

### Step 2.1 — The Frontend Architecture Mental Model

```text
Browser
  │
  └── React App (compiled JavaScript bundle)
        │
        ├── Components (UI building blocks)
        │     ├── App.jsx (root component)
        │     ├── ItemList.jsx
        │     ├── ItemForm.jsx
        │     └── HealthStatus.jsx
        │
        ├── Services (API communication layer)
        │     └── api.js (all fetch/axios calls)
        │
        ├── Hooks (reusable stateful logic)
        │     └── useItems.js
        │
        └── Config
              └── environment variables (VITEAPIURL)
```

Why Vite instead of Create React App?

Vite is the modern standard. It:
• Starts in milliseconds (CRA takes 30+ seconds on large projects)
• Uses native ES modules during development
• Produces smaller, faster production bundles
• Is what most companies have migrated to

### Step 2.2 — Create the React Project

Navigate back to the project root (not inside the backend folder):

```bash
Go to the project root
cd /path/to/cloud-native-app

Create React app with Vite
npm create vite@latest frontend -- --template react

Go into it
cd frontend

Install dependencies
npm install

Install additional packages
npm install axios react-hot-toast
```

#### What each package does:

| Package | Purpose |
|---------|---------|
| axios | HTTP client — cleaner API than raw fetch, automatic JSON parsing, interceptors |
| react-hot-toast | Beautiful toast notifications for success/error feedback |

### Step 2.3 — Project Structure

Clean up the default Vite structure:

```bash
Remove default boilerplate files we won't use
rm src/App.css src/assets/react.svg

Create our folder structure
mkdir -p src/components
mkdir -p src/services
mkdir -p src/hooks
mkdir -p src/config
```

### Step 2.4 — Environment Configuration

Vite uses VITE prefix for environment variables. Any variable that doesn't start with VITE is hidden from the browser (security feature).

Create frontend/.env:

```dotenv
The backend API URL
In development: your local backend
In production: your CloudFront domain + /api
VITEAPIURL=http://localhost:3000
VITEAPPNAME=Cloud Native App
```

Create frontend/.env.example:

```dotenv
VITEAPIURL=http://localhost:3000
VITEAPPNAME=Cloud Native App
```

Create frontend/.env.production:

```dotenv
This file is used when building for production (npm run build)
REPLACE with your actual CloudFront domain after Phase 7
VITEAPIURL=https://YOURCLOUDFRONTDOMAIN
VITEAPPNAME=Cloud Native App
```

### Step 2.5 — API Service Layer

Create frontend/src/services/api.js:

```text
// src/services/api.js
//
// PURPOSE: Single location for all API calls.
// The React components never call fetch/axios directly —
// they go through this service. This means:
//   - One place to update if the API URL changes
//   - One place to add authentication headers later
//   - Easy to mock in tests

import axios from 'axios';

// Create an axios instance configured for our backend
const apiClient = axios.create({
  baseURL: import.meta.env.VITEAPIURL,
  timeout: 10000, // 10 second timeout
  headers: {
    'Content-Type': 'application/json',
  },
});

// ── Request interceptor ───────────────────────────────────────────
// Runs before every request — useful for adding auth tokens
apiClient.interceptors.request.use(
  (config) => {
    // When you add authentication later, add the token here:
    // const token = localStorage.getItem('authToken');
    // if (token) config.headers.Authorization = Bearer ${token};
    return config;
  },
  (error) => Promise.reject(error)
);

// ── Response interceptor ──────────────────────────────────────────
// Runs after every response — useful for handling 401s globally
apiClient.interceptors.response.use(
  (response) => response,
  (error) => {
    // Log errors in development
    if (import.meta.env.DEV) {
      console.error('[API Error]', {
        url: error.config?.url,
        status: error.response?.status,
        message: error.response?.data?.error?.message || error.message,
      });
    }
    return Promise.reject(error);
  }
);

// ── Item API functions ────────────────────────────────────────────

export const itemsApi = {
  getAll: async (params = {}) => {
    const response = await apiClient.get('/api/items', { params });
    return response.data;
  },

  getById: async (id) => {
    const response = await apiClient.get(/api/items/${id});
    return response.data;
  },

  create: async (data) => {
    const response = await apiClient.post('/api/items', data);
    return response.data;
  },

  update: async (id, data) => {
    const response = await apiClient.put(/api/items/${id}, data);
    return response.data;
  },

  delete: async (id) => {
    const response = await apiClient.delete(/api/items/${id});
    return response.data;
  },
};

// ── Health API ────────────────────────────────────────────────────

export const healthApi = {
  check: async () => {
    const response = await apiClient.get('/health');
    return response.data;
  },
};

export default apiClient;
```

### Step 2.6 — Custom Hook

Custom hooks encapsulate stateful logic so components stay clean.

Create frontend/src/hooks/useItems.js:

```javascript
// src/hooks/useItems.js
//
// PURPOSE: Encapsulate all item-related state and operations.
// Components that need items just call useItems() and get back
// the data and functions they need — no API knowledge required.

import { useState, useEffect, useCallback } from 'react';
import { itemsApi } from '../services/api';

export function useItems() {
  const [items, setItems]       = useState([]);
  const [pagination, setPagination] = useState(null);
  const [loading, setLoading]   = useState(false);
  const [error, setError]       = useState(null);

  // Fetch all items
  const fetchItems = useCallback(async (params = {}) => {
    setLoading(true);
    setError(null);
    try {
      const result = await itemsApi.getAll(params);
      setItems(result.data);
      setPagination(result.pagination);
    } catch (err) {
      setError(err.response?.data?.error?.message || 'Failed to load items');
    } finally {
      setLoading(false);
    }
  }, []);

  // Create item
  const createItem = useCallback(async (data) => {
    const result = await itemsApi.create(data);
    // Optimistically add to the list
    setItems(prev => [result.data, ...prev]);
    return result.data;
  }, []);

  // Delete item
  const deleteItem = useCallback(async (id) => {
    await itemsApi.delete(id);
    setItems(prev => prev.filter(item => item.id !== id));
  }, []);

  // Update item
  const updateItem = useCallback(async (id, data) => {
    const result = await itemsApi.update(id, data);
    setItems(prev => prev.map(item => item.id === id ? result.data : item));
    return result.data;
  }, []);

  // Load items on mount
  useEffect(() => {
    fetchItems();
  }, [fetchItems]);

  return {
    items,
    pagination,
    loading,
    error,
    fetchItems,
    createItem,
    deleteItem,
    updateItem,
  };
}
```

### Step 2.7 — React Components

Create frontend/src/components/HealthStatus.jsx:

```jsx
// src/components/HealthStatus.jsx
import { useState, useEffect } from 'react';
import { healthApi } from '../services/api';

export function HealthStatus() {
  const [health, setHealth] = useState(null);
  const [error, setError] = useState(false);

  useEffect(() => {
    healthApi.check()
      .then(setHealth)
      .catch(() => setError(true));
  }, []);

  if (error) return (
    <div style={styles.badge.error}>⚠️ Backend Unreachable</div>
  );
  if (!health) return (
    <div style={styles.badge.checking}>⏳ Checking backend...</div>
  );

  return (
    <div style={styles.badge.healthy}>
      ✅ Backend healthy · {health.environment} · uptime {health.uptime}s
    </div>
  );
}

const styles = {
  badge: {
    healthy: {
      padding: '6px 12px', borderRadius: '6px',
      backgroundColor: '#d1fae5', color: '#065f46',
      fontSize: '13px', fontFamily: 'monospace',
      display: 'inline-block', marginBottom: '16px',
    },
    error: {
      padding: '6px 12px', borderRadius: '6px',
      backgroundColor: '#fee2e2', color: '#991b1b',
      fontSize: '13px', fontFamily: 'monospace',
      display: 'inline-block', marginBottom: '16px',
    },
    checking: {
      padding: '6px 12px', borderRadius: '6px',
      backgroundColor: '#fef3c7', color: '#92400e',
      fontSize: '13px', fontFamily: 'monospace',
      display: 'inline-block', marginBottom: '16px',
    },
  }
};
```

Create frontend/src/components/ItemForm.jsx:

```jsx
// src/components/ItemForm.jsx
import { useState } from 'react';

export function ItemForm({ onSubmit, onCancel, initialValues = {} }) {
  const [name, setName]               = useState(initialValues.name || '');
  const [description, setDescription] = useState(initialValues.description || '');
  const [status, setStatus]           = useState(initialValues.status || 'active');
  const [submitting, setSubmitting]   = useState(false);
  const [error, setError]             = useState(null);

  async function handleSubmit(e) {
    e.preventDefault();
    if (!name.trim()) { setError('Name is required'); return; }

    setSubmitting(true);
    setError(null);
    try {
      await onSubmit({ name: name.trim(), description: description.trim(), status });
      if (!initialValues.id) {
        // Reset form after creation (not after edit)
        setName(''); setDescription(''); setStatus('active');
      }
    } catch (err) {
      setError(err.response?.data?.error?.message || 'Something went wrong');
    } finally {
      setSubmitting(false);
    }
  }

  return (
    <form onSubmit={handleSubmit} style={styles.form}>
      <h3 style={styles.heading}>
        {initialValues.id ? 'Edit Item' : 'Create New Item'}
      </h3>

      {error && <div style={styles.error}>{error}</div>}

      <div style={styles.field}>
        <label style={styles.label}>Name </label>
        <input
          style={styles.input}
          value={name}
          onChange={e => setName(e.target.value)}
          placeholder="Item name"
          maxLength={255}
          disabled={submitting}
        />
      </div>

      <div style={styles.field}>
        <label style={styles.label}>Description</label>
        <textarea
          style={{ ...styles.input, height: '80px', resize: 'vertical' }}
          value={description}
          onChange={e => setDescription(e.target.value)}
          placeholder="Optional description"
          maxLength={2000}
          disabled={submitting}
        />
      </div>

      <div style={styles.field}>
        <label style={styles.label}>Status</label>
        <select
          style={styles.input}
          value={status}
          onChange={e => setStatus(e.target.value)}
          disabled={submitting}
        >
          <option value="active">Active</option>
          <option value="inactive">Inactive</option>
          <option value="archived">Archived</option>
        </select>
      </div>

      <div style={styles.buttons}>
        <button type="submit" style={styles.btnPrimary} disabled={submitting}>
          {submitting ? 'Saving...' : (initialValues.id ? 'Update' : 'Create Item')}
        </button>
        {onCancel && (
          <button type="button" style={styles.btnSecondary} onClick={onCancel} disabled={submitting}>
            Cancel
          </button>
        )}
      </div>
    </form>
  );
}

const styles = {
  form: { background: '#f9fafb', padding: '20px', borderRadius: '8px', marginBottom: '24px', border: '1px solid #e5e7eb' },
  heading: { margin: '0 0 16px', fontSize: '18px', color: '#111827' },
  field: { marginBottom: '14px' },
  label: { display: 'block', marginBottom: '4px', fontSize: '14px', fontWeight: 600, color: '#374151' },
  input: { width: '100%', padding: '8px 12px', borderRadius: '6px', border: '1px solid #d1d5db', fontSize: '14px', boxSizing: 'border-box', fontFamily: 'inherit' },
  error: { background: '#fee2e2', color: '#991b1b', padding: '10px', borderRadius: '6px', marginBottom: '14px', fontSize: '14px' },
  buttons: { display: 'flex', gap: '10px', marginTop: '16px' },
  btnPrimary: { padding: '8px 20px', background: '#2563eb', color: 'white', border: 'none', borderRadius: '6px', cursor: 'pointer', fontSize: '14px', fontWeight: 600 },
  btnSecondary: { padding: '8px 20px', background: 'white', color: '#374151', border: '1px solid #d1d5db', borderRadius: '6px', cursor: 'pointer', fontSize: '14px' },
};
```

Create frontend/src/components/ItemList.jsx:

```yaml
// src/components/ItemList.jsx
import { useState } from 'react';
import { ItemForm } from './ItemForm';
import toast from 'react-hot-toast';

const statusColors = {
  active:   { bg: '#d1fae5', text: '#065f46' },
  inactive: { bg: '#fef3c7', text: '#92400e' },
  archived: { bg: '#f3f4f6', text: '#6b7280' },
};

export function ItemList({ items, loading, error, onDelete, onUpdate }) {
  const [editingId, setEditingId] = useState(null);

  async function handleDelete(item) {
    if (!window.confirm(Delete "${item.name}"?)) return;
    try {
      await onDelete(item.id);
      toast.success("${item.name}" deleted);
    } catch {
      toast.error('Failed to delete item');
    }
  }

  async function handleUpdate(id, data) {
    await onUpdate(id, data);
    setEditingId(null);
    toast.success('Item updated');
  }

  if (loading) return <div style={styles.center}>Loading items...</div>;
  if (error)   return <div style={styles.errorBox}>{error}</div>;
  if (items.length === 0) return (
    <div style={styles.empty}>No items yet. Create your first one above!</div>
  );

  return (
    <div>
      {items.map(item => (
        <div key={item.id} style={styles.card}>
          {editingId === item.id ? (
            <ItemForm
              initialValues={item}
              onSubmit={(data) => handleUpdate(item.id, data)}
              onCancel={() => setEditingId(null)}
            />
          ) : (
            <div style={styles.row}>
              <div style={styles.content}>
                <div style={styles.nameRow}>
                  <span style={styles.name}>{item.name}</span>
                  <span style={{ ...styles.badge, backgroundColor: statusColors[item.status]?.bg, color: statusColors[item.status]?.text }}>
                    {item.status}
                  </span>
                </div>
                {item.description && <p style={styles.description}>{item.description}</p>}
                <div style={styles.meta}>
                  <span>ID: {item.id.slice(0, 8)}...</span>
                  <span>Created: {new Date(item.createdAt).toLocaleDateString()}</span>
                </div>
              </div>
              <div style={styles.actions}>
                <button style={styles.btnEdit} onClick={() => setEditingId(item.id)}>Edit</button>
                <button style={styles.btnDelete} onClick={() => handleDelete(item)}>Delete</button>
              </div>
            </div>
          )}
        </div>
      ))}
    </div>
  );
}

const styles = {
  card: { border: '1px solid #e5e7eb', borderRadius: '8px', marginBottom: '12px', padding: '16px', background: 'white' },
  row: { display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: '12px' },
  content: { flex: 1 },
  nameRow: { display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '6px' },
  name: { fontSize: '16px', fontWeight: 600, color: '#111827' },
  badge: { padding: '2px 8px', borderRadius: '999px', fontSize: '12px', fontWeight: 600 },
  description: { fontSize: '14px', color: '#6b7280', margin: '0 0 8px' },
  meta: { display: 'flex', gap: '16px', fontSize: '12px', color: '#9ca3af', fontFamily: 'monospace' },
  actions: { display: 'flex', gap: '8px', flexShrink: 0 },
  btnEdit: { padding: '6px 14px', background: '#f3f4f6', border: '1px solid #d1d5db', borderRadius: '6px', cursor: 'pointer', fontSize: '13px' },
  btnDelete: { padding: '6px 14px', background: '#fee2e2', border: '1px solid #fca5a5', borderRadius: '6px', cursor: 'pointer', fontSize: '13px', color: '#dc2626' },
  center: { textAlign: 'center', padding: '40px', color: '#6b7280' },
  empty: { textAlign: 'center', padding: '40px', color: '#9ca3af', border: '2px dashed #e5e7eb', borderRadius: '8px' },
  errorBox: { background: '#fee2e2', color: '#991b1b', padding: '16px', borderRadius: '8px', marginBottom: '16px' },
};
```

### Step 2.8 — Main App Component

Replace frontend/src/App.jsx entirely:

```jsx
// src/App.jsx
import { Toaster } from 'react-hot-toast';
import { HealthStatus } from './components/HealthStatus';
import { ItemForm } from './components/ItemForm';
import { ItemList } from './components/ItemList';
import { useItems } from './hooks/useItems';
import toast from 'react-hot-toast';

export default function App() {
  const { items, pagination, loading, error, createItem, deleteItem, updateItem } = useItems();

  async function handleCreate(data) {
    await createItem(data);
    toast.success("${data.name}" created!);
  }

  return (
    <div style={styles.page}>
      <Toaster position="top-right" />

      <header style={styles.header}>
        <div style={styles.headerContent}>
          <h1 style={styles.title}>☁️ Cloud-Native App</h1>
          <p style={styles.subtitle}>
            React + Node.js + PostgreSQL → Docker → AWS ECS Fargate
          </p>
          <HealthStatus />
        </div>
      </header>

      <main style={styles.main}>
        <section style={styles.section}>
          <ItemForm onSubmit={handleCreate} />
        </section>

        <section style={styles.section}>
          <div style={styles.listHeader}>
            <h2 style={styles.sectionTitle}>Items</h2>
            {pagination && (
              <span style={styles.count}>{pagination.total} total</span>
            )}
          </div>
          <ItemList
            items={items}
            loading={loading}
            error={error}
            onDelete={deleteItem}
            onUpdate={updateItem}
          />
        </section>
      </main>

      <footer style={styles.footer}>
        Built for production · Phase 1 of 10
        · <a href="http://localhost:3000/health" target="blank" rel="noreferrer" style={styles.link}>Backend Health</a>
        · <a href="http://localhost:3000/metrics" target="blank" rel="noreferrer" style={styles.link}>Metrics</a>
      </footer>
    </div>
  );
}

const styles = {
  page: { minHeight: '100vh', background: '#f9fafb', fontFamily: 'system-ui, -apple-system, sans-serif' },
  header: { background: 'linear-gradient(135deg, #1e40af, #3b82f6)', color: 'white', padding: '32px 24px' },
  headerContent: { maxWidth: '800px', margin: '0 auto' },
  title: { margin: '0 0 8px', fontSize: '28px', fontWeight: 700 },
  subtitle: { margin: '0 0 16px', opacity: 0.85, fontSize: '14px', fontFamily: 'monospace' },
  main: { maxWidth: '800px', margin: '0 auto', padding: '32px 24px' },
  section: { marginBottom: '32px' },
  listHeader: { display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '16px' },
  sectionTitle: { margin: 0, fontSize: '20px', fontWeight: 700, color: '#111827' },
  count: { fontSize: '14px', color: '#6b7280', background: '#f3f4f6', padding: '4px 10px', borderRadius: '999px' },
  footer: { textAlign: 'center', padding: '24px', color: '#9ca3af', fontSize: '13px', borderTop: '1px solid #e5e7eb', marginTop: '32px' },
  link: { color: '#6b7280' },
};
```

Update frontend/src/main.jsx:

```jsx
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
```

### Step 2.9 — Run the Frontend

Open a third terminal (keep backend running in terminal 1):

```bash
cd /path/to/cloud-native-app/frontend
npm run dev
```

Expected output:
```text
  VITE v5.0.0  ready in 300 ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
```

Open your browser and navigate to http://localhost:5173. You should see:

• The header with "☁️ Cloud-Native App"
• A green "Backend healthy" badge
• The item creation form
• The list of 5 seed items
• Ability to create, edit, and delete items

Build for production

```bash
npm run build
```

Expected output:
```text
vite v5.0.0 building for production...
✓ 45 modules transformed.
dist/index.html                   0.46 kB │ gzip:  0.30 kB
dist/assets/index-DiwrgTda.css   1.39 kB │ gzip:  0.72 kB
dist/assets/index-B7DyMNPu.js  142.17 kB │ gzip: 45.89 kB
✓ built in 1.23s
```

The dist/ folder contains static files ready to upload to S3.

### Phase 2 Summary

You now have a full-stack app running locally. In Phase 3, we containerize both parts so they run identically in any environment — your laptop, a colleague's machine, or an AWS Fargate task.

## PHASE 3 — Containerize with Docker

### Phase 3 Goal

Package the backend into a Docker container image that:
• Runs identically in every environment
• Is small and secure (minimal attack surface)
• Starts fast
• Follows production image best practices

### Step 3.1 — Docker Mental Model

Without Docker:
```bash
Your laptop:         Node 20, Mac, your specific npm versions
Colleague's laptop:  Node 18, Windows, different npm versions
AWS server:          Node 16, Amazon Linux, different npm versions
→ "It works on my machine" problem
```

With Docker:
```bash
Your laptop:         runs container → isolated Node 20 environment
Colleague's laptop:  runs same container → identical environment
AWS Fargate:         runs same container → identical environment
→ "Ship the environment, not just the code"
```

```text
Docker Image (snapshot of the environment)
┌────────────────────────────────────────┐
│  Amazon Linux 2023 base OS             │
│  Node.js 20.x runtime                 │
│  Your package.json dependencies        │
│  Your application code                 │
│  Configuration: PORT=3000, etc.        │
└────────────────────────────────────────┘
        │
        │  docker run (creates a running instance)
        ▼
Docker Container (running process)
┌────────────────────────────────────────┐
│  Everything above + running process    │
│  Isolated filesystem, network, memory  │
│  → Same behavior everywhere            │
└────────────────────────────────────────┘
```

### Step 3.2 — Install Docker

Download Docker Desktop from https://www.docker.com/products/docker-desktop/

Verify installation:

```bash
docker --version
```

Expected:
```bash
Docker version 24.0.7, build afdd53b
```

```bash
docker compose version
```

Expected:
```bash
Docker Compose version v2.23.3
```

### Step 3.3 — Create the Backend Dockerfile

Create backend/Dockerfile:

```text
────────────────────────────────────────────────────────────────
STAGE 1: Builder
Install ALL dependencies including devDependencies, which are
needed to run tests and build steps.
This stage is discarded after Stage 2 copies what it needs.
────────────────────────────────────────────────────────────────
FROM node:20-alpine AS builder

Why Alpine? The alpine variant is ~50MB vs ~900MB for the full image.
It has a minimal OS — just enough to run Node.js.
Less OS = smaller attack surface = faster pulls.
Set working directory inside the container
All subsequent commands run relative to this path
WORKDIR /app

Copy ONLY package files first (not application code yet)
Docker caches each layer. If package.json didn't change,
Docker reuses the cached layer instead of re-running npm install.
This makes rebuilds much faster.
COPY package.json package-lock.json ./

Install all dependencies (including devDependencies for this stage)
--frozen-lockfile: fail if package-lock.json doesn't match
(prevents "it worked yesterday" dependency surprises)
RUN npm ci --frozen-lockfile

Now copy the application code
(After npm install so code changes don't invalidate the npm cache)
COPY . .

────────────────────────────────────────────────────────────────
STAGE 2: Production image
Start fresh from the same base image.
Copy ONLY what's needed to run — not test files, not devDeps.
────────────────────────────────────────────────────────────────
FROM node:20-alpine AS production

Security: don't run as root
If a vulnerability allows command execution, the attacker gets
a low-privilege user — not root
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodeapp -u 1001

WORKDIR /app

Copy package files
COPY package.json package-lock.json ./

Install ONLY production dependencies
This excludes nodemon and other dev tools — smaller image, less risk
RUN npm ci --frozen-lockfile --only=production

Copy application code from the builder stage
COPY --chown=nodeapp:nodejs --from=builder /app/src ./src
COPY --chown=nodeapp:nodejs --from=builder /app/server.js ./server.js

Switch to non-root user
USER nodeapp

Declare the port the app listens on
(Documentation only — doesn't actually open a port)
EXPOSE 3000

Health check: Docker will run this command inside the container
to verify it's healthy. If it fails 3 times, the container is
marked unhealthy.
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000/health', (res) => { process.exit(res.statusCode === 200 ? 0 : 1); })"

The command that runs when the container starts
Use the production start script (not nodemon)
CMD ["node", "server.js"]
```

Create backend/.dockerignore:

```bash
Never copy these into the Docker image
nodemodules/
npm-debug.log
.env
.env.
.git
.gitignore
.md
Dockerfile
.dockerignore
```

### Step 3.4 — Create Docker Compose for Local Development

Docker Compose lets you start the backend + PostgreSQL together with one command.

Create backend/docker-compose.yml:

```text
docker-compose.yml
PURPOSE: Orchestrate backend + PostgreSQL for local development.
'docker compose up' starts everything.
'docker compose down' stops everything.

version: '3.8'

services:
  # ── PostgreSQL database ─────────────────────────────────────────
  postgres:
    image: postgres:15-alpine
    containername: cloudnative-postgres
    environment:
      POSTGRESDB: cloudnativedb
      POSTGRESUSER: postgres
      POSTGRESPASSWORD: postgres
    ports:
      # hostport:containerport
      # So your local psql can connect on localhost:5432
      - "5432:5432"
    volumes:
      # Persist database data — if the container restarts,
      # data is not lost (it's stored in this named volume)
      - postgresdata:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pgisready -U postgres"]
      interval: 10s
      timeout: 5s
      retries: 5

  # ── Node.js backend ─────────────────────────────────────────────
  backend:
    build:
      context: .
      dockerfile: Dockerfile
      target: production  # Use the production stage
    containername: cloudnative-backend
    environment:
      NODEENV: development
      PORT: 3000
      DBHOST: postgres         # Container name = hostname in Docker network
      DBPORT: 5432
      DBNAME: cloudnativedb
      DBUSER: postgres
      DBPASSWORD: postgres
      DBMAXCONNECTIONS: 10
      DBIDLETIMEOUTMS: 30000
      DBCONNECTIONTIMEOUTMS: 2000
      CORSORIGIN: http://localhost:5173
      LOGLEVEL: debug
    ports:
      - "3000:3000"
    dependson:
      postgres:
        condition: servicehealthy  # Wait until PostgreSQL is ready
    restart: unless-stopped

Named volumes persist data outside container lifecycle
volumes:
  postgresdata:
    driver: local
```

### Step 3.5 — Build and Run the Container

```bash
cd /path/to/cloud-native-app/backend

Build the Docker image
docker build -t cloud-native-backend:local .
```

Expected output (multi-stage build):
```text
[+] Building 45.2s (14/14) FINISHED
 => [internal] load build definition from Dockerfile
 => [builder 1/4] FROM node:20-alpine
 => [builder 2/4] WORKDIR /app
 => [builder 3/4] COPY package.json package-lock.json ./
 => [builder 4/4] RUN npm ci --frozen-lockfile
 => [production 1/6] FROM node:20-alpine
 => [production 2/6] RUN addgroup...
 => [production 3/6] WORKDIR /app
 => [production 4/6] COPY package.json package-lock.json ./
 => [production 5/6] RUN npm ci --frozen-lockfile --only=production
 => [production 6/6] COPY --from=builder ...
 => exporting to image
Successfully built abc123def456
Successfully tagged cloud-native-backend:local
```

#### Check the image size:

```bash
docker images cloud-native-backend
```

Expected:
```text
REPOSITORY              TAG     IMAGE ID       SIZE
cloud-native-backend    local   abc123def456   180MB
```

Run with Docker Compose:

```yaml
docker compose up
```

Expected output:
```text
[+] Running 2/2
 ✔ Container cloudnative-postgres  Started
 ✔ Container cloudnative-backend   Started
cloudnative-postgres  | PostgreSQL init process complete; ready for start up.
cloudnative-backend   | [DB] ✓ PostgreSQL connected successfully
cloudnative-backend   | [DB] ✓ All migrations complete
cloudnative-backend   | ✓ Server running on http://localhost:3000
```

Verify it works:

```bash
curl http://localhost:3000/health
```

### Phase 3 Summary

You now have:
• A production Docker image (~180MB, non-root user, health check)
• Docker Compose for local development parity
• Multi-stage build that keeps production images small and secure
• Layer caching that makes rebuilds fast

The image you just built is exactly what will run on AWS Fargate. We'll push it to ECR (AWS's container registry) in Phase 8 when we set up CI/CD.

## PHASE 4 — Terraform: VPC and Networking

### Phase 4 Goal

Build the foundational AWS network that everything else lives in. This is the most critical infrastructure phase — get this wrong and your application is either insecure or broken.

### Step 4.1 — Infrastructure Architecture

```text
AWS Region (us-east-1)
└── VPC (10.0.0.0/16) — your private network in AWS
    │
    ├── Availability Zone A (us-east-1a)
    │   ├── Public Subnet A  (10.0.1.0/24)   ← ALB, NAT Gateway
    │   ├── Private Subnet A (10.0.10.0/24)  ← ECS containers
    │   └── DB Subnet A      (10.0.20.0/24)  ← RDS PostgreSQL
    │
    ├── Availability Zone B (us-east-1b)
    │   ├── Public Subnet B  (10.0.2.0/24)   ← ALB
    │   ├── Private Subnet B (10.0.11.0/24)  ← ECS containers
    │   └── DB Subnet B      (10.0.21.0/24)  ← RDS PostgreSQL
    │
    ├── Internet Gateway  ← Connects public subnets to internet
    ├── NAT Gateway       ← Allows private subnets to reach internet (one-way)
    └── Route Tables      ← Rules for where traffic flows
```

Why two Availability Zones? AWS Availability Zones are physically separate data centers. If one has a power outage, your app in the other AZ keeps running. This is called Multi-AZ and is the baseline for production availability.

Why three tiers of subnets?

| Tier | Subnet | Can receive internet traffic? | Can initiate internet traffic? |
|------|--------|------------------------------|-------------------------------|
| Public | ALB | ✅ Yes | ✅ Yes |
| Private | ECS | ❌ No (not directly) | ✅ Yes (via NAT) |
| DB | RDS | ❌ No | ❌ No |

Your database should never be able to reach the internet. Ever. Even if an attacker gets into your containers, they can't exfiltrate your data to an external server.

### Step 4.2 — Install and Configure Terraform + AWS CLI
Install AWS CLI

```bash
Mac
brew install awscli

Linux
curl "https://awscli.amazonaws.com/awscli-exe-linux-x8664.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

Verify
aws --version
```

Expected: aws-cli/2.15.0 Python/3.11.6

Install Terraform

```hcl
Mac
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

Linux
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsbrelease -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

Verify
terraform --version
```

Expected: Terraform v1.7.0

Create an AWS Account and IAM User
Go to https://aws.amazon.com and create an account (requires a credit card — we'll stay within free tier)
In the AWS Console, search for IAM
Click Users → Create user
Username: terraform-deployer
Select Attach policies directly
For this project, attach: AdministratorAccess (in a real company, you'd scope this down)
Click through to create the user
Click the user → Security credentials → Create access key
Choose CLI → create
Download the CSV — this is the only time you see the secret key

Configure AWS CLI:

```bash
aws configure
```

```bash
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-east-1
Default output format [None]: json
```

Verify:

```bash
aws sts get-caller-identity
```

Expected:
```json
{
    "UserId": "AIDIOSFODNN7EXAMPLE",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-deployer"
}
```

### Step 4.3 — Terraform Project Structure

```dockerfile
From the project root
cd /path/to/cloud-native-app
mkdir -p infrastructure/modules/networking
mkdir -p infrastructure/modules/security
mkdir -p infrastructure/modules/database
mkdir -p infrastructure/modules/compute
mkdir -p infrastructure/modules/cdn
mkdir -p infrastructure/environments/production
```

Why modules? Terraform modules are like functions — reusable, testable pieces of infrastructure. Instead of one 2000-line main.tf, you have composable modules you can read, test, and reuse.

### Step 4.4 — Terraform Root Configuration

Create infrastructure/environments/production/versions.tf:

```hcl
versions.tf
PURPOSE: Lock Terraform and provider versions.
Without version locks, 'terraform init' might download a newer version
that has breaking changes.

terraform {
  requiredversion = ">= 1.6.0"

  requiredproviders {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30"  # ~> means "5.x but not 6.x"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

  # Remote state: stores terraform.tfstate in S3 instead of locally.
  # This means the whole team sees the same state.
  # We'll enable this after creating the S3 bucket.
  # backend "s3" {
  #   bucket = "your-terraform-state-bucket"
  #   key    = "production/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

provider "aws" {
  region = var.awsregion

  # Tag every single resource with these tags.
  # In production, this is how you:
  #   - Track costs by project/environment
  #   - Find all resources belonging to this app
  #   - Enforce compliance policies
  defaulttags {
    tags = {
      Project     = var.projectname
      Environment = var.environment
      ManagedBy   = "Terraform"
      Repository  = "cloud-native-app"
    }
  }
}
```

Create infrastructure/environments/production/variables.tf:

```hcl
variables.tf
PURPOSE: All input variables for this environment.
Values are provided in terraform.tfvars (not committed)
or via environment variables.

variable "awsregion" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "projectname" {
  description = "Project name — used in resource naming"
  type        = string
  default     = "cloudnative"
}

variable "environment" {
  description = "Environment name (production, staging, development)"
  type        = string
  default     = "production"
}

variable "vpccidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availabilityzones" {
  description = "List of AZs to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "dbusername" {
  description = "PostgreSQL master username"
  type        = string
  default     = "cloudnativeadmin"
  sensitive   = true  # Won't show in Terraform plan output
}

variable "dbinstanceclass" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"  # Free tier eligible
}

variable "backendimagetag" {
  description = "Docker image tag to deploy"
  type        = string
  default     = "latest"
}

variable "backendcpu" {
  description = "ECS task CPU units (256 = 0.25 vCPU)"
  type        = number
  default     = 256  # Free tier friendly
}

variable "backendmemory" {
  description = "ECS task memory in MB"
  type        = number
  default     = 512
}

variable "backendmincapacity" {
  description = "Minimum number of backend containers"
  type        = number
  default     = 1
}

variable "backendmaxcapacity" {
  description = "Maximum number of backend containers"
  type        = number
  default     = 4
}
```

### Step 4.5 — VPC Module

Create infrastructure/modules/networking/main.tf:

```text
modules/networking/main.tf
PURPOSE: Create the entire network infrastructure:
• VPC
• Public subnets (ALB)
• Private subnets (ECS)
• Database subnets (RDS)
• Internet Gateway
• NAT Gateway
• Route tables
── VPC ──────────────────────────────────────────────────────────────
resource "awsvpc" "main" {
  cidrblock = var.vpccidr

  # Enable DNS resolution within the VPC.
  # Required for RDS endpoints to resolve properly.
  enablednssupport   = true
  enablednshostnames = true

  tags = {
    Name = "${var.nameprefix}-vpc"
  }
}

── Public Subnets ────────────────────────────────────────────────────
One per AZ. These are where the ALB lives.
Resources in public subnets CAN have public IP addresses.

resource "awssubnet" "public" {
  count = length(var.availabilityzones)

  vpcid            = awsvpc.main.id
  cidrblock        = cidrsubnet(var.vpccidr, 8, count.index + 1)
  # cidrsubnet("10.0.0.0/16", 8, 1) = "10.0.1.0/24"
  # cidrsubnet("10.0.0.0/16", 8, 2) = "10.0.2.0/24"

  availabilityzone = var.availabilityzones[count.index]

  # Auto-assign public IPs to instances launched here
  # (The ALB needs a public IP)
  mappubliciponlaunch = true

  tags = {
    Name = "${var.nameprefix}-public-${var.availabilityzones[count.index]}"
    Tier = "public"
  }
}

── Private Subnets ───────────────────────────────────────────────────
One per AZ. These are where ECS containers run.
NO direct internet access — outbound through NAT only.

resource "awssubnet" "private" {
  count = length(var.availabilityzones)

  vpcid            = awsvpc.main.id
  cidrblock        = cidrsubnet(var.vpccidr, 8, count.index + 10)
  # count.index 0 → 10.0.10.0/24
  # count.index 1 → 10.0.11.0/24

  availabilityzone = var.availabilityzones[count.index]

  # No public IPs — these containers are private
  mappubliciponlaunch = false

  tags = {
    Name = "${var.nameprefix}-private-${var.availabilityzones[count.index]}"
    Tier = "private"
  }
}

── Database Subnets ──────────────────────────────────────────────────
Most isolated tier. RDS can NEVER reach the internet.

resource "awssubnet" "database" {
  count = length(var.availabilityzones)

  vpcid            = awsvpc.main.id
  cidrblock        = cidrsubnet(var.vpccidr, 8, count.index + 20)
  # count.index 0 → 10.0.20.0/24
  # count.index 1 → 10.0.21.0/24

  availabilityzone = var.availabilityzones[count.index]

  mappubliciponlaunch = false

  tags = {
    Name = "${var.nameprefix}-database-${var.availabilityzones[count.index]}"
    Tier = "database"
  }
}

── Internet Gateway ───────────────────────────────────────────────────
Attaches the VPC to the public internet.
Required for public subnets to be reachable.

resource "awsinternetgateway" "main" {
  vpcid = awsvpc.main.id

  tags = {
    Name = "${var.nameprefix}-igw"
  }
}

── Elastic IP for NAT Gateway ─────────────────────────────────────────
NAT Gateway needs a static public IP.

resource "awseip" "nat" {
  domain = "vpc"

  # Must be created after the IGW
  dependson = [awsinternetgateway.main]

  tags = {
    Name = "${var.nameprefix}-nat-eip"
  }
}

── NAT Gateway ────────────────────────────────────────────────────────
Sits in the public subnet, gives private subnets one-way internet access.
Private containers can PULL Docker images from ECR, call AWS APIs, etc.
But nothing on the internet can INITIATE connections to private subnets.
COST NOTE: NAT Gateway costs ~$32/month plus $0.045/GB.
For this project, all outbound data goes through NAT.
In production, you might have one NAT per AZ for HA (~$64/month).
We use one for cost savings here.

resource "awsnatgateway" "main" {
  allocationid = awseip.nat.id
  subnetid     = awssubnet.public[0].id  # Must be in a PUBLIC subnet

  dependson = [awsinternetgateway.main]

  tags = {
    Name = "${var.nameprefix}-nat"
  }
}

── Route Tables ───────────────────────────────────────────────────────
Public route table: send all internet traffic through IGW
resource "awsroutetable" "public" {
  vpcid = awsvpc.main.id

  route {
    cidrblock = "0.0.0.0/0"        # All traffic
    gatewayid = awsinternetgateway.main.id
  }

  tags = {
    Name = "${var.nameprefix}-public-rt"
  }
}

Associate each public subnet with the public route table
resource "awsroutetableassociation" "public" {
  count = length(awssubnet.public)

  subnetid      = awssubnet.public[count.index].id
  routetableid = awsroutetable.public.id
}

Private route table: send internet-bound traffic through NAT Gateway
resource "awsroutetable" "private" {
  vpcid = awsvpc.main.id

  route {
    cidrblock     = "0.0.0.0/0"
    natgatewayid = awsnatgateway.main.id
  }

  tags = {
    Name = "${var.nameprefix}-private-rt"
  }
}

resource "awsroutetableassociation" "private" {
  count = length(awssubnet.private)

  subnetid      = awssubnet.private[count.index].id
  routetableid = awsroutetable.private.id
}

Database route table: NO internet route at all
The database tier is completely isolated
resource "awsroutetable" "database" {
  vpcid = awsvpc.main.id
  # Intentionally NO routes to internet
  # Only VPC-local traffic is allowed

  tags = {
    Name = "${var.nameprefix}-database-rt"
  }
}

resource "awsroutetableassociation" "database" {
  count = length(awssubnet.database)

  subnetid      = awssubnet.database[count.index].id
  routetableid = awsroutetable.database.id
}

── RDS Subnet Group ──────────────────────────────────────────────────
RDS requires a "subnet group" — a named collection of subnets
across multiple AZs. RDS picks which AZ to use.

resource "awsdbsubnetgroup" "main" {
  name        = "${var.nameprefix}-db-subnet-group"
  description = "Database subnet group for ${var.nameprefix}"
  subnetids  = awssubnet.database[].id  # All database subnets

  tags = {
    Name = "${var.nameprefix}-db-subnet-group"
  }
}
```

Create infrastructure/modules/networking/variables.tf:

```hcl
variable "vpccidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availabilityzones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "nameprefix" {
  description = "Prefix for all resource names"
  type        = string
}
```

Create infrastructure/modules/networking/outputs.tf:

```hcl
outputs.tf
Make networking values available to other modules

output "vpcid" {
  value       = awsvpc.main.id
  description = "VPC ID"
}

output "publicsubnetids" {
  value       = awssubnet.public[].id
  description = "IDs of public subnets (for ALB)"
}

output "privatesubnetids" {
  value       = awssubnet.private[].id
  description = "IDs of private subnets (for ECS)"
}

output "databasesubnetids" {
  value       = awssubnet.database[].id
  description = "IDs of database subnets (for RDS)"
}

output "dbsubnetgroupname" {
  value       = awsdbsubnetgroup.main.name
  description = "RDS subnet group name"
}

output "natgatewayip" {
  value       = awseip.nat.publicip
  description = "NAT Gateway public IP (for allowlisting in external services)"
}
```

### Step 4.6 — Security Groups Module

Security Groups are stateful firewalls attached to AWS resources. Every inbound rule you define automatically allows the corresponding outbound reply — you don't need to define outbound rules for responses.

Create infrastructure/modules/security/main.tf:

```text
modules/security/main.tf
Security Group Architecture:
Internet → ALB SG (port 80, 443 from 0.0.0.0/0)
ALB SG   → ECS SG (port 3000 from ALB SG only)
ECS SG   → RDS SG (port 5432 from ECS SG only)
This is called "security group chaining" — each layer
only accepts traffic from the layer above it.
── ALB Security Group ────────────────────────────────────────────────
resource "awssecuritygroup" "alb" {
  name        = "${var.nameprefix}-alb-sg"
  description = "Security group for Application Load Balancer"
  vpcid      = var.vpcid

  # Allow HTTPS from anywhere (CloudFront → ALB)
  ingress {
    fromport   = 443
    toport     = 443
    protocol    = "tcp"
    cidrblocks = ["0.0.0.0/0"]
    description = "HTTPS from internet"
  }

  # Allow HTTP for redirect to HTTPS
  ingress {
    fromport   = 80
    toport     = 80
    protocol    = "tcp"
    cidrblocks = ["0.0.0.0/0"]
    description = "HTTP for redirect to HTTPS"
  }

  # Allow all outbound (ALB needs to reach ECS containers)
  egress {
    fromport   = 0
    toport     = 0
    protocol    = "-1"
    cidrblocks = ["0.0.0.0/0"]
    description = "All outbound traffic"
  }

  tags = {
    Name = "${var.nameprefix}-alb-sg"
  }
}

── ECS Security Group ────────────────────────────────────────────────
resource "awssecuritygroup" "ecs" {
  name        = "${var.nameprefix}-ecs-sg"
  description = "Security group for ECS Fargate tasks"
  vpcid      = var.vpcid

  # Only accept traffic from the ALB (not directly from the internet)
  ingress {
    fromport       = 3000
    toport         = 3000
    protocol        = "tcp"
    securitygroups = [awssecuritygroup.alb.id]  # ALB SG, not a CIDR
    description     = "App traffic from ALB only"
  }

  # Allow all outbound (containers need to:
  #   - Call RDS on port 5432
  #   - Pull images from ECR (HTTPS)
  #   - Call Secrets Manager (HTTPS)
  #   - Send logs to CloudWatch (HTTPS)
  egress {
    fromport   = 0
    toport     = 0
    protocol    = "-1"
    cidrblocks = ["0.0.0.0/0"]
    description = "All outbound (ECR pull, CloudWatch logs, etc.)"
  }

  tags = {
    Name = "${var.nameprefix}-ecs-sg"
  }
}

── RDS Security Group ────────────────────────────────────────────────
resource "awssecuritygroup" "rds" {
  name        = "${var.nameprefix}-rds-sg"
  description = "Security group for RDS PostgreSQL"
  vpcid      = var.vpcid

  # Only accept PostgreSQL connections from ECS containers
  ingress {
    fromport       = 5432
    toport         = 5432
    protocol        = "tcp"
    securitygroups = [awssecuritygroup.ecs.id]
    description     = "PostgreSQL from ECS only"
  }

  # No outbound rules = database cannot initiate connections
  # (Default: deny all egress)

  tags = {
    Name = "${var.nameprefix}-rds-sg"
  }
}
```

Create infrastructure/modules/security/variables.tf:

```hcl
variable "vpcid" {
  description = "VPC ID"
  type        = string
}

variable "nameprefix" {
  description = "Prefix for resource names"
  type        = string
}
```

Create infrastructure/modules/security/outputs.tf:

```hcl
output "albsecuritygroupid" {
  value = awssecuritygroup.alb.id
}

output "ecssecuritygroupid" {
  value = awssecuritygroup.ecs.id
}

output "rdssecuritygroupid" {
  value = awssecuritygroup.rds.id
}
```

### Step 4.7 — Wire Modules Together

Create infrastructure/environments/production/main.tf:

```text
main.tf
Root configuration — calls modules to build the full stack

locals {
  nameprefix = "${var.projectname}-${var.environment}"
}

── Networking ────────────────────────────────────────────────────────
module "networking" {
  source = "../../modules/networking"

  vpccidr           = var.vpccidr
  availabilityzones = var.availabilityzones
  nameprefix        = local.nameprefix
}

── Security Groups ───────────────────────────────────────────────────
module "security" {
  source = "../../modules/security"

  vpcid      = module.networking.vpcid
  nameprefix = local.nameprefix
}

(Remaining modules added in subsequent phases)
```

Create infrastructure/environments/production/outputs.tf:

```hcl
output "vpcid" {
  value = module.networking.vpcid
}

output "publicsubnetids" {
  value = module.networking.publicsubnetids
}

output "privatesubnetids" {
  value = module.networking.privatesubnetids
}

output "natgatewayip" {
  value       = module.networking.natgatewayip
  description = "NAT Gateway IP — whitelist this in external services"
}

output "albsecuritygroupid" {
  value = module.security.albsecuritygroupid
}

output "ecssecuritygroupid" {
  value = module.security.ecssecuritygroupid
}
```

### Step 4.8 — Initialize and Apply

```bash
cd infrastructure/environments/production

Initialize Terraform — downloads providers
terraform init
```

Expected output:
```bash
Initializing the backend...
Initializing provider plugins...
• Finding hashicorp/aws versions matching "~> 5.30"...
• Installing hashicorp/aws v5.32.1...
• Installed hashicorp/aws v5.32.1

Terraform has been successfully initialized!
```

```bash
Preview what will be created (read-only — no changes made)
terraform plan
```

Expected output summary:
```text
Plan: 20 to add, 0 to change, 0 to destroy.

Changes to be made:
  + awsvpc.main
  + awssubnet.public[0]
  + awssubnet.public[1]
  + awssubnet.private[0]
  + awssubnet.private[1]
  + awssubnet.database[0]
  + awssubnet.database[1]
  + awsinternetgateway.main
  + awseip.nat
  + awsnatgateway.main
  + awsroutetable.public
  + awsroutetable.private
  + awsroutetable.database
  + awsroutetableassociation.public[0]
  + awsroutetableassociation.public[1]
  + awsroutetableassociation.private[0]
  + awsroutetableassociation.private[1]
  + awsdbsubnetgroup.main
  + awssecuritygroup.alb
  + awssecuritygroup.ecs
  + awssecuritygroup.rds
```

⚠️ Cost warning: The NAT Gateway costs ~$32/month. For a learning project, you can destroy (terraform destroy) when done for the day and recreate when needed.

```hcl
Apply the changes — creates all resources in AWS
terraform apply
```

Type yes when prompted.

Expected output:
```text
awsvpc.main: Creating...
awsvpc.main: Creation complete after 2s [id=vpc-0abc123def456789]
...
awsnatgateway.main: Creation complete after 47s
...
Apply complete! Resources: 21 added, 0 changed, 0 destroyed.

Outputs:
vpcid = "vpc-0abc123def456789"
publicsubnetids = ["subnet-0abc", "subnet-0def"]
natgatewayip = "54.123.45.67"
```

Verify in AWS Console
Open the AWS Console → VPC → Your VPCs
You should see cloudnative-production-vpc
Click it → Subnets → you should see 6 subnets (2 public, 2 private, 2 database)
#### Check Route Tables → verify public routes have 0.0.0.0/0 → IGW, private routes have 0.0.0.0/0 → NAT

### Phase 4 Summary
#### What You Built

A production-grade AWS network with:
• 3-tier subnet architecture (public/private/database)
• Multi-AZ for high availability
• Internet Gateway for public internet access
• NAT Gateway for private subnet outbound access
• Hardened security groups with principle of least privilege
• Database tier completely isolated from the internet

Mini Interview Questions
#### What is the difference between a Security Group and a Network ACL in AWS?

Why do you need a NAT Gateway if your ECS containers can't receive inbound traffic anyway?

What does "stateful firewall" mean in the context of Security Groups?

Why do we use Security Group references instead of CIDR blocks in the ECS and RDS security groups?

What would happen to your application if the NAT Gateway went down?

## PHASES 5–10: Continuing the Architecture

At this point, you have:

✅ Phase 1 — Production Node.js backend, fully working locally  
✅ Phase 2 — React frontend, connected and working locally  
✅ Phase 3 — Docker container with multi-stage build  
✅ Phase 4 — AWS VPC, subnets, security groups via Terraform  

The remaining phases follow the same ultra-detailed pattern. Here is the complete roadmap for each with the key concepts covered:

## Phase 5 — RDS PostgreSQL on AWS

### What gets built:

```hcl
modules/database/main.tf

resource "randompassword" "dbpassword" {
  length  = 32
  special = true
}

resource "awssecretsmanagersecret" "dbpassword" {
  name = "${var.nameprefix}-db-password"
  recoverywindowindays = 7
}

resource "awssecretsmanagersecretversion" "dbpassword" {
  secretid     = awssecretsmanagersecret.dbpassword.id
  secretstring = jsonencode({
    username = var.dbusername
    password = randompassword.dbpassword.result
    host     = awsdbinstance.main.address
    port     = 5432
    dbname   = var.dbname
  })
}

resource "awsdbinstance" "main" {
  identifier     = "${var.nameprefix}-postgres"
  engine         = "postgres"
  engineversion = "15.4"
  instanceclass = var.instanceclass  # db.t3.micro = free tier

  allocatedstorage     = 20
  maxallocatedstorage = 100  # Auto-scaling storage up to 100GB
  storagetype          = "gp3"
  storageencrypted     = true  # Encrypt at rest

  dbname  = var.dbname
  username = var.dbusername
  password = randompassword.dbpassword.result

  dbsubnetgroupname   = var.dbsubnetgroupname
  vpcsecuritygroupids = [var.rdssecuritygroupid]

  multiaz               = false  # true for production HA (costs double)
  publiclyaccessible    = false  # NEVER true in production

  backupretentionperiod = 7     # Keep 7 days of automated backups
  backupwindow          = "03:00-04:00"  # Run backups at 3am UTC
  maintenancewindow     = "Mon:04:00-Mon:05:00"

  deletionprotection    = true   # Prevent accidental deletion
  skipfinalsnapshot    = false  # Take a snapshot before deletion
  finalsnapshotidentifier = "${var.nameprefix}-final-snapshot"

  performanceinsightsenabled = true  # Query analysis tool

  tags = {
    Name = "${var.nameprefix}-postgres"
  }
}
```

### Key concepts covered:
• Secrets Manager for database credential rotation
• RDS automated backups (point-in-time recovery)
• Encryption at rest with KMS
• Multi-AZ explained with failover mechanics
• RDS Parameter Groups for PostgreSQL tuning
• Connection from ECS via environment variables injected from Secrets Manager

## Phase 6 — ECS Fargate

### What gets built:

```hcl
modules/compute/main.tf

resource "awsecrrepository" "backend" {
  name                 = "${var.nameprefix}-backend"
  imagetagmutability = "MUTABLE"

  imagescanningconfiguration {
    scanonpush = true  # Scan for CVEs on every push
  }

  encryptionconfiguration {
    encryptiontype = "AES256"
  }
}

resource "awsecscluster" "main" {
  name = "${var.nameprefix}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"  # CloudWatch Container Insights
  }
}

resource "awsecstaskdefinition" "backend" {
  family                   = "${var.nameprefix}-backend"
  networkmode             = "awsvpc"
  requirescompatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  executionrolearn       = awsiamrole.ecsexecution.arn
  taskrolearn            = awsiamrole.ecstask.arn

  containerdefinitions = jsonencode([{
    name  = "backend"
    image = "${awsecrrepository.backend.repositoryurl}:${var.imagetag}"
    
    portMappings = [{
      containerPort = 3000
      protocol      = "tcp"
    }]

    secrets = [
      {
        name      = "DBPASSWORD"
        valueFrom = "${var.dbsecretarn}:password::"
      },
      {
        name      = "DBHOST"
        valueFrom = "${var.dbsecretarn}:host::"
      }
    ]

    environment = [
      { name = "NODEENV", value = "production" },
      { name = "PORT",     value = "3000" },
    ]

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = "/ecs/${var.nameprefix}-backend"
        "awslogs-region"        = var.awsregion
        "awslogs-stream-prefix" = "ecs"
      }
    }

    healthCheck = {
      command     = ["CMD-SHELL", "curl -f http://localhost:3000/health || exit 1"]
      interval    = 30
      timeout     = 10
      retries     = 3
      startPeriod = 60
    }
  }])
}

resource "awsecsservice" "backend" {
  name            = "${var.nameprefix}-backend"
  cluster         = awsecscluster.main.id
  taskdefinition = awsecstaskdefinition.backend.arn
  desiredcount   = var.mincapacity
  launchtype     = "FARGATE"

  networkconfiguration {
    subnets          = var.privatesubnetids
    securitygroups  = [var.ecssecuritygroupid]
    assignpublicip = false
  }

  loadbalancer {
    targetgrouparn = var.targetgrouparn
    containername   = "backend"
    containerport   = 3000
  }

  deploymentcircuitbreaker {
    enable   = true   # Auto-rollback failed deployments
    rollback = true
  }

  deploymentcontroller {
    type = "ECS"  # Rolling deployment
  }
}

resource "awsappautoscalingtarget" "backend" {
  maxcapacity       = var.maxcapacity
  mincapacity       = var.mincapacity
  resourceid        = "service/${awsecscluster.main.name}/${awsecsservice.backend.name}"
  scalabledimension = "ecs:service:DesiredCount"
  servicenamespace  = "ecs"
}

resource "awsappautoscalingpolicy" "backendcpu" {
  name               = "${var.nameprefix}-cpu-scaling"
  policytype        = "TargetTrackingScaling"
  resourceid        = awsappautoscalingtarget.backend.resourceid
  scalabledimension = awsappautoscalingtarget.backend.scalabledimension
  servicenamespace  = awsappautoscalingtarget.backend.servicenamespace

  targettrackingscalingpolicyconfiguration {
    targetvalue = 70.0  # Scale up when CPU > 70%
    predefinedmetricspecification {
      predefinedmetrictype = "ECSServiceAverageCPUUtilization"
    }
  }
}
```

### Key concepts covered:
• IAM roles: execution role (what ECS agent can do) vs task role (what your code can do)
• Fargate vs EC2 launch type explained
• Task definitions: CPU/memory sizing, container definitions
• ECS services: desired count, deployment circuit breakers, auto-rollback
• Auto-scaling with target tracking policies
• ECR image scanning for security vulnerabilities
• VPC endpoints for ECR/Secrets Manager (avoiding NAT Gateway costs)

## Phase 7 — ALB, S3, and CloudFront

### Architecture:

```text
User Browser
     │
     ▼ HTTPS (SSL/TLS)
CloudFront Distribution
     │
     ├── /api/ ──────────────────► ALB (HTTPS) → ECS
     │                              (API requests)
     │
     └── / ──────────────────────► S3 (Static files)
                                    (HTML, JS, CSS)
```

### Key resources:

```hcl
S3 bucket for React build output
resource "awss3bucket" "frontend" {
  bucket = "${var.nameprefix}-frontend-${data.awscalleridentity.current.accountid}"
  # bucket names must be globally unique — including account ID ensures that
}

resource "awss3bucketpublicaccessblock" "frontend" {
  bucket = awss3bucket.frontend.id
  # Block ALL public access — CloudFront uses an OAC (Origin Access Control)
  # to access S3 privately. The bucket is never directly public.
  blockpublicacls       = true
  blockpublicpolicy     = true
  ignorepublicacls      = true
  restrictpublicbuckets = true
}

resource "awscloudfrontdistribution" "main" {
  # S3 origin for the React app
  origin {
    domainname              = awss3bucket.frontend.bucketregionaldomainname
    originid                = "S3-frontend"
    originaccesscontrolid = awscloudfrontoriginaccesscontrol.main.id
  }

  # ALB origin for API calls
  origin {
    domainname = awslb.main.dnsname
    originid   = "ALB-backend"
    customoriginconfig {
      httpport              = 80
      httpsport             = 443
      originprotocolpolicy = "https-only"
      originsslprotocols   = ["TLSv1.2"]
    }
  }

  # Default behavior: serve from S3
  defaultcachebehavior {
    targetoriginid       = "S3-frontend"
    viewerprotocolpolicy = "redirect-to-https"
    allowedmethods        = ["GET", "HEAD"]
    cachedmethods         = ["GET", "HEAD"]
    
    forwardedvalues {
      querystring = false
      cookies { forward = "none" }
    }

    minttl     = 0
    defaultttl = 86400    # 24 hours cache for static files
    maxttl     = 31536000 # 1 year
  }

  # API behavior: pass through to ALB, no caching
  orderedcachebehavior {
    pathpattern           = "/api/"
    targetoriginid       = "ALB-backend"
    viewerprotocolpolicy = "redirect-to-https"
    allowedmethods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cachedmethods         = ["GET", "HEAD"]
    
    forwardedvalues {
      querystring = true
      headers      = ["Authorization", "Content-Type"]
      cookies { forward = "all" }
    }

    minttl     = 0
    defaultttl = 0  # Never cache API responses
    maxttl     = 0
  }
}
```

## Phase 8 — GitHub Actions CI/CD

### Pipeline flow:

```text
Developer pushes to main branch
         │
         ▼
GitHub Actions triggers
         │
         ▼
┌────────────────────────────────────────┐
│  Job 1: Test                           │
│    - npm install                       │
│    - Run tests                         │
│    - If tests fail → stop pipeline     │
└─────────────────┬──────────────────────┘
                  │ success
                  ▼
┌────────────────────────────────────────┐
│  Job 2: Build & Push                   │
│    - docker build                      │
│    - aws ecr get-login-password        │
│    - docker push to ECR                │
│    - npm run build (React)             │
│    - aws s3 sync dist/ to S3           │
└─────────────────┬──────────────────────┘
                  │ success
                  ▼
┌────────────────────────────────────────┐
│  Job 3: Deploy                         │
│    - Update ECS task definition        │
│    - aws ecs update-service            │
│    - Wait for deployment stable        │
│    - Invalidate CloudFront cache       │
└────────────────────────────────────────┘
```

.github/workflows/deploy.yml:

```yaml
name: Deploy to Production

on:
  push:
    branches: [main]

env:
  AWSREGION: us-east-1
  ECRREPOSITORY: cloudnative-production-backend
  ECSSERVICE: cloudnative-production-backend
  ECSCLUSTER: cloudnative-production-cluster
  CONTAINERNAME: backend

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
          cache-dependency-path: backend/package-lock.json

      - name: Install dependencies
        working-directory: backend
        run: npm ci

      - name: Run tests
        working-directory: backend
        run: npm test

  build-and-deploy:
    needs: test
    runs-on: ubuntu-latest
    permissions:
      id-token: write  # Required for OIDC authentication
      contents: read

    steps:
      - uses: actions/checkout@v4

      - name: Configure AWS credentials (OIDC — no long-lived keys)
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: arn:aws:iam::${{ secrets.AWSACCOUNTID }}:role/github-actions-deployer
          aws-region: ${{ env.AWSREGION }}

      - name: Login to Amazon ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v2

      - name: Build, tag, and push Docker image
        id: build-image
        env:
          ECRREGISTRY: ${{ steps.login-ecr.outputs.registry }}
          IMAGETAG: ${{ github.sha }}
        working-directory: backend
        run: |
          docker build -t $ECRREGISTRY/$ECRREPOSITORY:$IMAGETAG .
          docker push $ECRREGISTRY/$ECRREPOSITORY:$IMAGETAG
          echo "image=$ECRREGISTRY/$ECRREPOSITORY:$IMAGETAG" >> $GITHUBOUTPUT

      - name: Deploy to ECS
        uses: aws-actions/amazon-ecs-deploy-task-definition@v1
        with:
          task-definition: infrastructure/task-definition.json
          service: ${{ env.ECSSERVICE }}
          cluster: ${{ env.ECSCLUSTER }}
          wait-for-service-stability: true
          image: ${{ steps.build-image.outputs.image }}
          container-name: ${{ env.CONTAINERNAME }}

      - name: Build React app
        working-directory: frontend
        env:
          VITEAPIURL: https://${{ secrets.CLOUDFRONTDOMAIN }}
        run: |
          npm ci
          npm run build

      - name: Deploy frontend to S3
        run: |
          aws s3 sync frontend/dist/ s3://${{ secrets.FRONTENDBUCKET }} \
            --delete \
            --cache-control "public, max-age=31536000, immutable"
          
          # index.html should not be cached (so new deploys take effect)
          aws s3 cp frontend/dist/index.html s3://${{ secrets.FRONTENDBUCKET }}/index.html \
            --cache-control "no-cache, no-store, must-revalidate"

      - name: Invalidate CloudFront cache
        run: |
          aws cloudfront create-invalidation \
            --distribution-id ${{ secrets.CLOUDFRONTDISTRIBUTIONID }} \
            --paths "/"
```

### Key concepts covered:
• OIDC authentication (no long-lived AWS access keys in GitHub)
• Docker layer caching in CI
• Semantic versioning with git SHA tags
• ECS rolling deployment with health check gate
• S3 sync with cache header strategy (hashed assets get long TTL, index.html gets no-cache)
• CloudFront invalidation

## Phase 9 — CloudWatch Monitoring

### Monitoring architecture:

```text
Application → CloudWatch Logs → Log Groups
                                    │
                                    ▼
                              Metric Filters
                              (error count, latency)
                                    │
                                    ▼
                              CloudWatch Alarms
                                    │
                                    ▼
                              SNS Topic → Email alert
```

### Key resources:

```hcl
CloudWatch Alarms
resource "awscloudwatchmetricalarm" "ecscpuhigh" {
  alarmname          = "${var.nameprefix}-ecs-cpu-high"
  comparisonoperator = "GreaterThanThreshold"
  evaluationperiods  = 2
  metricname         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 80
  alarmdescription   = "ECS CPU utilization above 80%"
  alarmactions       = [awssnstopic.alerts.arn]

  dimensions = {
    ServiceName = var.ecsservicename
    ClusterName = var.ecsclustername
  }
}

resource "awscloudwatchmetricalarm" "rdsconnections" {
  alarmname          = "${var.nameprefix}-rds-connections"
  comparisonoperator = "GreaterThanThreshold"
  evaluationperiods  = 2
  metricname         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Average"
  threshold           = 80
  alarmactions       = [awssnstopic.alerts.arn]

  dimensions = {
    DBInstanceIdentifier = var.dbinstanceid
  }
}

Log-based metric for 5xx errors
resource "awscloudwatchlogmetricfilter" "errorcount" {
  name           = "${var.nameprefix}-5xx-errors"
  pattern        = "{ $.status >= 500 }"
  loggroupname = "/ecs/${var.nameprefix}-backend"

  metrictransformation {
    name      = "5xxErrorCount"
    namespace = "CloudNativeApp"
    value     = "1"
  }
}
```

## Phase 10 — Full Validation and Production Hardening

### Production checklist covered:

```text
Security:
  ☑ No public RDS endpoint
  ☑ S3 bucket blocks all public access (CloudFront OAC)
  ☑ Secrets in Secrets Manager, never in env vars committed to git
  ☑ ECS tasks run as non-root user
  ☑ ECR image scanning enabled
  ☑ VPC Flow Logs enabled
  ☑ CloudTrail enabled (API audit log)
  ☑ HTTPS everywhere (ALB + CloudFront)
  ☑ Security group least privilege

Availability:
  ☑ Multi-AZ subnets
  ☑ ECS auto-scaling configured
  ☑ ALB health checks passing
  ☑ RDS automated backups enabled
  ☑ ECS deployment circuit breaker (auto-rollback)

Observability:
  ☑ CloudWatch logs for all containers
  ☑ RDS Performance Insights
  ☑ CloudWatch Alarms for CPU, memory, errors
  ☑ /health and /metrics endpoints

Cost Controls:
  ☑ Auto-scaling scales DOWN when traffic drops
  ☑ RDS instance right-sized (db.t3.micro for this project)
  ☑ CloudFront caches static files (reduces origin requests)
  ☑ Resource tagging for cost allocation
```

## Complete File Structure

When everything is finished, your repository looks like this:

```text
cloud-native-app/
│
├── backend/
│   ├── src/
│   │   ├── config/index.js
│   │   ├── controllers/itemController.js
│   │   ├── db/migrate.js, pool.js, seed.js
│   │   ├── middleware/errorHandler.js, requestLogger.js
│   │   ├── routes/health.js, items.js, metrics.js
│   │   ├── services/itemService.js
│   │   └── utils/logger.js
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── package.json
│   ├── server.js
│   ├── .env.example
│   └── .dockerignore
│
├── frontend/
│   ├── src/
│   │   ├── components/HealthStatus.jsx, ItemForm.jsx, ItemList.jsx
│   │   ├── hooks/useItems.js
│   │   ├── services/api.js
│   │   └── App.jsx, main.jsx
│   ├── package.json
│   ├── vite.config.js
│   └── .env.example
│
├── infrastructure/
│   ├── modules/
│   │   ├── networking/main.tf, variables.tf, outputs.tf
│   │   ├── security/main.tf, variables.tf, outputs.tf
│   │   ├── database/main.tf, variables.tf, outputs.tf
│   │   ├── compute/main.tf, variables.tf, outputs.tf
│   │   └── cdn/main.tf, variables.tf, outputs.tf
│   └── environments/production/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── versions.tf
│
└── .github/
    └── workflows/
        └── deploy.yml
```

## Final Words Before You Begin

You now have a complete, concrete, phase-by-phase roadmap. Here is how to use it:

Work phase by phase. Do not skip to Terraform before the backend works locally. Every phase builds on the previous one. When the ECS container starts on Fargate, it's the exact same code and container you tested on your laptop.

Understand every line. When you copy a code block, read every comment. The comments in this guide are the explanations a senior engineer would give you in a code review.

Break things intentionally. The debugging exercises at the end of each phase are not optional. Knowing *why* something breaks is more valuable than knowing that it works.

Track your AWS costs. Enable AWS Cost Explorer. After Phase 4, you'll have a NAT Gateway running. After Phase 5, you'll have an RDS instance. After Phase 6, you'll have ECS tasks. Do terraform destroy when you step away for days at a time.

Commit your Terraform state management. Before applying any Terraform in Phase 4, create an S3 bucket for remote state and enable the backend block in versions.tf. Losing your local `terraform.tfstate` file is like losing the deed to your house.

The path from "I understand Phase 1" to "I have a live production app on AWS" is now laid out in front of you — one step at a time, no assumptions, no shortcuts. Build it.

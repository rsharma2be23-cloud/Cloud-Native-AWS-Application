# Base image
FROM node:20-alpine

# Create app directory inside container
#   mkdir /app
#   cd /app
WORKDIR /app

# Copy dependency files first
#   Copies:package.json
#          package-lock.json
#FIRST for Docker layer caching.
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy all project files
COPY . .

# Expose backend port
EXPOSE 3000

# Start server
CMD ["npm", "start"]

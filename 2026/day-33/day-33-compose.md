# Day 33 – Docker Compose: Multi-Container Applications

## Overview

Today’s goal was to learn how to run multi-container applications using Docker Compose.

Previously, containers, networks, and volumes had to be created manually using multiple commands.
Docker Compose allows defining everything inside one YAML configuration file and running the entire application stack with a single command.

## Task 1 – Install & Verify Docker Compose

### Check if Docker Compose is installed

    docker compose version

###  Example Output:

    Docker Compose version v2.x.x

### Docker Compose is now integrated into the Docker CLI as:

    docker compose

### instead of the older:

    docker-compose
    
## Task 2 – First Compose File (Nginx)

### Create Project Folder
  
    mkdir compose-basics
    cd compose-basics

### Create `docker-compose.yml`

    version: "3.9"

    services:
      nginx:
        image: nginx:latest
        container_name: compose-nginx
        ports:
          - "8080:80"

### Start Container

    docker compose up -d

### Explanation:

`up` → creates and starts containers

`-d` → detached mode (runs in background)

### Verify Running Containers

    docker ps

### Access in Browser

    http://localhost:8080

You should see the Nginx welcome page.

### Stop the Services

    docker compose down

### This removes:

- containers

- networks created by compose

## Task 3 – Two Container Setup (WordPress + MySQL)

Now we create a real multi-container application.


### Create docker-compose.yml

    version: "3.9"

    services:

      db:
        image: mysql:5.7
        container_name: wordpress-db
        restart: always
        environment:
          MYSQL_DATABASE: wordpress
          MYSQL_USER: wpuser
          MYSQL_PASSWORD: wppassword
          MYSQL_ROOT_PASSWORD: rootpassword
        volumes:
          - db_data:/var/lib/mysql

      wordpress:
        image: wordpress:latest
        container_name: wordpress-app
        restart: always
        ports:
          - "8081:80"
        environment:
          WORDPRESS_DB_HOST: db:3306
          WORDPRESS_DB_USER: wpuser
          WORDPRESS_DB_PASSWORD: wppassword
          WORDPRESS_DB_NAME: wordpress
        depends_on:
          - db

    volumes:
      db_data:

### Start the Application

    docker compose up -d

### Verify Containers
 
    docker ps

### You should see:

- wordpress-app
- wordpress-db

Access WordPress

### Open browser:

    http://localhost:8081



Verify Data Persistence

### Stop containers:

    docker compose down

### Start again:

    docker compose up -d



## Task 4 – Important Docker Compose Commands

### Start Services
 
    docker compose up

### Start in Detached Mode
 
    docker compose up -d

### View Running Services
     
     docker compose ps

### View Logs (All Services)
    
    docker compose logs -f

### View Logs of Specific Service

    docker compose logs wordpress

or

    docker compose logs db

### Stop Services (without removing)

    docker compose stop

### Remove Containers and Networks
   
    docker compose down

### Rebuild Containers

    docker compose up --build

## Task 5 – Environment Variables

### Environment variables can be defined using a .env file.

    Create .env
    MYSQL_ROOT_PASSWORD=rootpassword
    MYSQL_DATABASE=wordpress
    MYSQL_USER=wpuser
    MYSQL_PASSWORD=wppassword


### Updated docker-compose.yml

    version: "3.9"

    services:

      db:
        image: mysql:5.7
        restart: always
        environment:
          MYSQL_DATABASE: ${MYSQL_DATABASE}
          MYSQL_USER: ${MYSQL_USER}
          MYSQL_PASSWORD: ${MYSQL_PASSWORD}
          MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}

      wordpress:
        image: wordpress
        restart: always
        ports:
          - "8081:80"
        environment:
          WORDPRESS_DB_HOST: db:3306
          WORDPRESS_DB_USER: ${MYSQL_USER}
          WORDPRESS_DB_PASSWORD: ${MYSQL_PASSWORD}
          WORDPRESS_DB_NAME: ${MYSQL_DATABASE}

        depends_on:
          - db

Compose will automatically load variables from .env.

### Key Concepts Learned

Docker Compose Advantages

✔ Run multi-container applications
✔ Infrastructure defined as code
✔ Single command deployment
✔ Automatic network creation
✔ Easy service communication using service names


### Key Takeaways

- Docker Compose simplifies container orchestration by allowing developers to:

- Define multiple services

- Configure networking

- Manage volumes

- Use environment variables

- Run the entire stack with a single command

- This makes Compose ideal for development environments and small-scale deployments.


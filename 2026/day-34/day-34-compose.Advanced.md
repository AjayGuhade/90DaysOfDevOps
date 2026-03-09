# Day 34 – Docker Compose: Real-World Multi-Container Apps

## Overview

Today’s objective was to build a production-like multi-container stack using Docker Compose.

Unlike basic setups, real-world applications include:

- Application service

- Database service

- Cache layer

- Health checks

- Restart policies

- Named networks

- Persistent storage

## The stack built today includes:

    Flask Web App
      │
      ├── PostgreSQL (Database)
      │
      └── Redis (Cache)

All services are orchestrated using Docker Compose.

Project Structure

    day-34-compose-advanced/
     │
     ├── app/
     │   ├── app.py
     │   ├── requirements.txt
     │   └── Dockerfile
     │
     ├── docker-compose.yml
     │
     └── day-34-compose-advanced.md

## Task 1 – Build Your Own App Stack

### We created a 3-service application stack:

- Flask Web Application

- PostgreSQL Database

- Redis Cache


### Flask App (app/app.py)

    from flask import Flask

    import psycopg2

    import redis

    import os

    app = Flask(__name__)

    db_host = os.getenv("DB_HOST")
    redis_host = os.getenv("REDIS_HOST")

    @app.route("/")
    def hello():

        db_status = "Not connected"
        cache_status = "Not connected"

        try:
            conn = psycopg2.connect(
                host=db_host,
                database="devopsdb",
                user="devops",
                password="devops"
            )
             db_status = "Connected to Postgres"
        except:
          pass

        try:
            r = redis.Redis(host=redis_host, port=6379)
            r.ping()
            cache_status = "Connected to Redis"
        except:
            pass

        return f"""
        <h1>Hello from Docker Compose 🚀</h1>
        <p>{db_status}</p>
        <p>{cache_status}</p>
      
        """

    if __name__ == "__main__":
        app.run(host="0.0.0.0", port=5000)
    requirements.txt
    flask
    psycopg2-binary
    redis

## Task 2 – Create Dockerfile for Web App

    app/Dockerfile

    FROM python:3.11-slim

    WORKDIR /app

    COPY requirements.txt .

    RUN pip install --no-cache-dir -r requirements.txt

    COPY . .

    CMD ["python", "app.py"]

## Task 3 – Docker Compose File

docker-compose.yml

    version: "3.9"

    services:

      web:
        build: ./app
        ports:
          - "5000:5000"
        environment:
          DB_HOST: db
          REDIS_HOST: redis
        depends_on:
          db:
          condition: service_healthy
        networks:
          - devops-network
        labels:
       project: "90DaysOfDevOps"
          service: "web"

      db:
        image: postgres:15
        restart: always
        environment:
          POSTGRES_DB: devopsdb
          POSTGRES_USER: devops
          POSTGRES_PASSWORD: devops
        volumes:
          - postgres_data:/var/lib/postgresql/data
        networks:
          - devops-network
        healthcheck:
          test: ["CMD-SHELL", "pg_isready -U devops"]
          interval: 10s
          timeout: 5s
          retries: 5
        labels:
          service: "database"

      redis:
        image: redis:7
        networks:
          - devops-network
        labels:
          service: "cache"

    networks:
      devops-network:

    volumes:
      postgres_data:

## Task 4 – Start the Stack

### Run the application stack:

    docker compose up -d

Verify containers:

    docker compose ps

Access the app:

    http://localhost:5000

Expected output:

     Hello from Docker Compose
     Connected to Postgres
     Connected to Redis

## Task 5 – depends_on & Healthchecks

Compose allows controlling service startup order.

    depends_on:
      db:
        condition: service_healthy

The web container will wait until Postgres passes its health check.

Database healthcheck:

    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U devops"]
      interval: 10s
      timeout: 5s
      retries: 5

Test procedure:

    docker compose down
    docker compose up

The app waits for the database to become healthy before starting.

## Task 6 – Restart Policies

Restart policies help containers recover automatically.

Example:

    restart: always

If the container stops or crashes, Docker automatically restarts it.

Test:

    docker kill <db_container_id>

Docker will automatically restart it.

Restart Policy Comparison
| Policy         | Behavior                                   |
| -------------- | ------------------------------------------ |
| no             | Never restart                              |
| always         | Always restart container                   |
| on-failure     | Restart only if container exits with error |
| unless-stopped | Restart unless manually stopped            |


Recommended usage:

    Databases → always

    Applications → on-failure

## Task 7 – Rebuild After Code Change

Modify your Flask app.

Then rebuild containers:

    docker compose up --build

This rebuilds images and restarts services.

## Task 8 – Named Networks & Volumes

Instead of using default network, we defined:

    networks:
      devops-network:

Benefits:

- Better organization

- Explicit networking

- Easier debugging

- Persistent database storage:

    volumes:
      postgres_data:

Data remains even if containers are deleted.

## Task 9 – Scaling (Bonus)

Scale the web application:


    docker compose up --scale web=3

What Happens?

Docker creates multiple web containers:

    web_1

    web_2

    web_3

But port mapping breaks because multiple containers cannot bind to the same port:

    5000:5000


### Why Scaling Fails with Port Mapping

Port mapping binds the host port to one container only.

In production systems, scaling is handled using:

- Load balancers

- Reverse proxies

- Kubernetes

- Docker Swarm

### Key Concepts Learned

Today’s important DevOps concepts:

✔ Multi-container architecture
✔ Custom Dockerfile builds in Compose
✔ Health checks for service readiness
✔ Restart policies for reliability
✔ Named networks and persistent volumes
✔ Horizontal scaling limitations

### Key Takeaways

Docker Compose can simulate real-world microservice environments locally.

Using Compose, developers can:

Deploy full application stacks

Manage dependencies between services

Handle persistence and networking

Rebuild applications easily

This makes Compose an essential tool for DevOps development workflows.
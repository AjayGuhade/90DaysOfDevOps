# Day 29 – Introduction to Docker

## Objective

Today I learned the fundamentals of Docker and ran my first containers.
This is my first real step into containerization — the backbone of modern DevOps.

## Task 1: What is Docker?

### What is a Container?

A container is a lightweight, standalone package that includes:

- Application code

- Runtime

- System libraries

- Dependencies

- Configuration

It ensures that the application runs the same everywhere.

### Problem it solves:

"It works on my machine" problem.

Containers provide:

- Portability

- Consistency

- Isolation

- Faster deployment

### Containers vs Virtual Machines
| Feature     | Containers           | Virtual Machines   |
| ----------- | -------------------- | ------------------ |
| Size        | Lightweight (MBs)    | Heavy (GBs)        |
| Boot Time   | Seconds              | Minutes            |
| OS          | Share host OS kernel | Full OS per VM     |
| Performance | Near-native          | Slight overhead    |
| Isolation   | Process-level        | Full machine-level |

### Real Difference

Virtual Machines virtualize hardware.
Containers virtualize the operating system layer.

### Docker Architecture


Components:

1 Docker Client

- CLI (docker run, docker ps)

- Sends commands to daemon

2 Docker Daemon (dockerd)

- Runs in background

- Manages images, containers, networks, volumes

3 Docker Images

- Read-only templates

- Used to create containers

4 Docker Containers

- Running instance of an image

5 Docker Registry

- Stores images

Example: Docker Hub

### Docker Architecture in My Words

## When I type:

    docker run nginx

1.Docker client sends request to daemon

2.Daemon checks if image exists locally

3.If not, pulls from Docker Hub

4.Creates container from image

5.Runs container

### Simple flow:

Client ➝ Daemon ➝ Image ➝ Container
(Registry is used if image not found locally)

## Task 2: Install Docker

### Installed Docker on Ubuntu

    sudo apt update
    sudo apt install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
    
### Verify Installation
    docker --version
    
### Run Hello World

    docker run hello-world

### What Happened?

- Docker checked for image locally

- Pulled from Docker Hub

- Created container

- Ran it

- Printed success message

- Exited container

### This confirmed Docker is working properly.

📸 (Add screenshot of hello-world output here)

## Task 3: Run Real Containers

### Run Nginx Container

    docker run -d -p 8080:80 --name my-nginx nginx

Explanation:

-d → Detached mode

-p 8080:80 → Map host port 8080 to container port 80

--name → Custom container name

Access in browser:

    http://localhost:8080

📸 (Add screenshot of Nginx welcome page)

### Run Ubuntu in Interactive Mode

    docker run -it ubuntu bash

Inside container:

    ls
    apt update
    whoami

This feels like a mini isolated Linux system.

Exit container:

    exit


List Running Containers
    
    docker ps

List All Containers (Including Stopped)
    
    docker ps -a
    
Stop a Container

    docker stop my-nginx
Remove a Container

    docker rm my-nginx

## Task 4: Explore Docker Commands

Detached Mode

    docker run -d nginx

Runs container in background.
Terminal remains free.

🏷 Custom Container Name
 
    docker run --name test-container nginx
🔌 Port Mapping

    docker run -p 3000:80 nginx

Host port 3000 → Container port 80

View Logs
     
    docker logs my-nginx
Run Command Inside Running Container
    
    docker exec -it my-nginx bash

This lets us enter an already running container.

## Why This Matters for DevOps

Docker is the foundation of:

- CI/CD pipelines

- Kubernetes

- Microservices

- Cloud-native apps

- Infrastructure automation

Every modern DevOps job requires container knowledge.

Today I:

- Installed Docker

- Ran multiple containers

- Understood architecture

- Explored networking

- Managed container lifecycle

This is the beginning of containerized infrastructure 🚀

## What I Learned

- Containers are lightweight and portable

- Docker uses client-server architecture

- Images are templates, containers are instances

- Port mapping exposes container apps

- Detached mode runs containers in background

- Docker CLI is powerful and simple

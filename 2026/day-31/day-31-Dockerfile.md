# Day 31 – Dockerfile: Build Your Own Images

## Objective
Today's goal was to understand how Dockerfiles work and how to build custom Docker images.

Dockerfiles allow developers and DevOps engineers to package applications along with their dependencies into portable containers.

---

# Tasks Completed

## 1. Created My First Dockerfile

### Created a folder:

    mkdir my-first-image

    cd my-first-image

### Created Dockerfile:

    FROM ubuntu:latest

    RUN apt-get update && apt-get install -y curl

    CMD ["echo", "Hello from my custom image!"]

### Build Image

    docker build -t my-ubuntu:v1 .

### Run Container

    docker run my-ubuntu:v1

### Output

    Hello from my custom image!

## 2. Learned Important Dockerfile Instructions

### Created another Dockerfile using multiple instructions.

    FROM ubuntu:latest

    RUN apt-get update && apt-get install -y curl

    WORKDIR /app

    COPY hello.txt .

    EXPOSE 8080

    CMD ["cat", "hello.txt"]

### Created a sample file:

    echo "Hello from Dockerfile instructions demo" > hello.txt

### Key Dockerfile Instructions

Instruction	Purpose

| Instruction | Purpose                                      |
| ----------- | -------------------------------------------- |
| FROM        | Specifies the base image                     |
| RUN         | Executes commands during image build         |
| COPY        | Copies files from host to container          |
| WORKDIR     | Sets working directory inside container      |
| EXPOSE      | Documents container port                     |
| CMD         | Default command executed when container runs |

## 3. CMD vs ENTRYPOINT

### CMD Example

    FROM ubuntu
    CMD ["echo", "hello"]

    Run container:

    docker run cmd-demo

### Output:

    hello

### Override command:

    docker run cmd-demo ls

### Result: ls runs instead of echo.

### ENTRYPOINT Example

    FROM ubuntu
   
    ENTRYPOINT ["echo"]

### Run container:

    docker run entry-demo hello world

### Output:

hello world

### Key Difference
| Feature           | CMD | ENTRYPOINT |
| ----------------- | --- | ---------- |
| Default command   | Yes | Yes        |
| Can be overridden | Yes | No         |
| Accepts arguments | No  | Yes        |

## 4. Built a Simple Website using Nginx

### Created an index.html file.

    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>DevOps Engineer Portfolio | Ajay Guhade</title>
        <meta name="description" content="Fresher DevOps Engineer portfolio showcasing skills in AWS, Docker, Kubernetes, CI/CD, and infrastructure automation." />
        <meta name="author" content="Ajay Guhade" />
        <meta property="og:title" content="DevOps Engineer Portfolio" />
        <meta property="og:description" content="Building reliable infrastructure and automating deployment pipelines." />
        <meta property="og:type" content="website" />
        <meta name="twitter:card" content="summary_large_image" />
        <link rel="icon" type="image/x-icon" href="/favicon.ico" />
      </head>
      <body>
        <div id="root"></div>
        <script type="module" src="/src/main.tsx"></script>
      </body>
    </html>

### Created Dockerfile:

    FROM nginx:alpine

    COPY index.html /usr/share/nginx/html/

    EXPOSE 80

### Build Image

    docker build -t my-website:v1 .

### Run Container

    docker run -p 8080:80 my-website:v1

### Open browser:

    http://localhost:8080

The custom website is served using an Nginx container.

## 5. Implemented .dockerignore

Created .dockerignore file to exclude unnecessary files from build context.

.git
.gitignore
node_modules
.env
*.md

### Benefits

- Faster Docker builds

- Smaller image size

- Prevents accidental secret leaks

## 6. Learned Docker Build Optimization

- Docker builds images in layers.

- If a layer changes, all layers after it must rebuild.

### Best Practice

- Place frequently changing files later in the Dockerfile.

Example:

    FROM ubuntu

    RUN apt-get update && apt-get install -y curl

    WORKDIR /app

    COPY . .

This allows Docker to reuse cached layers and speed up builds.

## Key Learnings

### Today I learned:

- How to write Dockerfiles

- How to build custom Docker images

- Important Dockerfile instructions

- The difference between CMD and ENTRYPOINT

- How to containerize a simple website using Nginx

- How .dockerignore improves Docker builds

- Why Docker layer caching matters


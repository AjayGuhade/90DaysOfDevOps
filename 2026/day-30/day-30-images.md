# Day 30 – Docker Images & Container Lifecycle

## Objective

### Today I explored:

- The relationship between Docker images and containers

- How image layers and caching work

- The complete container lifecycle

- How to inspect, manage, and clean up Docker resources

## Task 1: Docker Images

### Pull Images from Docker Hub

    docker pull nginx
    docker pull ubuntu
    docker pull alpine

### List All Images
    docker images
### Observations

Image	Approx Size
nginx	~140MB
ubuntu	~70–80MB
alpine	~5–7MB

### Why is Alpine So Small?

- Alpine uses musl libc instead of glibc

- Minimal packages

- Built specifically for containers

- No unnecessary tools

👉 Alpine is commonly used in production to reduce image size and attack surface.

### Inspect an Image

    docker inspect nginx

### What I Saw:

- Image ID

- Created date

- Architecture

- OS

- Layers

- Environment variables

- Default command (CMD)

- Exposed ports

- Docker stores detailed metadata in JSON format.

### Remove an Image

    docker rmi ubuntu

If in use, Docker will prevent removal.

## Task 2: Docker Image Layers

### View Image History

    docker image history nginx

You will see output like:

IMAGE          CREATED        CREATED BY          SIZE
<id>           2 weeks ago    /bin/sh -c ...      0B
<id>           2 weeks ago    RUN apt install     25MB
<id>           3 weeks ago    COPY file           0B
...


### What Are Layers?

- Each line in docker image history is a layer.

- Docker images are built as stacked read-only layers.

When building an image:

- Each RUN, COPY, ADD creates a new layer.

- Layers are cached.

If unchanged, Docker reuses the cached layer.

### Why Does Docker Use Layers?

Benefits:

- Faster builds (caching)

- Reusability

- Efficient storage

- Easy versioning

- Smaller downloads (only changed layers are pulled)

Example:
If 10 images use Ubuntu base, Docker stores it only once.

## Task 3: Container Lifecycle


### Create Container (Without Starting)
 
    docker create --name lifecycle-test nginx

Check status:

    docker ps -a

State → Created

Start Container

    docker start lifecycle-test

State → Up

Pause Container

    docker pause lifecycle-test

State → Paused

Unpause

    docker unpause lifecycle-test

State → Up

stop

    docker stop lifecycle-test

State → Exited

Restart

    docker restart lifecycle-test

State → Up

Kill (Force Stop)

    docker kill lifecycle-test

Immediately stops container.

Remove

    docker rm lifecycle-test

Container deleted.

Container Lifecycle Flow
Created → Running → Paused → Stopped → Removed

## Task 4: Working with Running Containers

### Run Nginx in Detached Mode

    docker run -d -p 8080:80 --name nginx-live nginx
    
### View Logs

    docker logs nginx-live
    
### Real-Time Logs (Follow Mode)

    docker logs -f nginx-live

Press Ctrl + C to stop following logs.

### Exec Into Running Container

    docker exec -it nginx-live bash

Explore:

    ls /
    cd /usr/share/nginx/html

Exit:

    exit

### Run Single Command Without Entering

    docker exec nginx-live ls /

This executes command and exits immediately.

### Inspect Container

    docker inspect nginx-live

From output, I found:

- IP Address

- Port mappings

- Mounts

- Network settings

- Container state

- Restart policy

## Task 5: Cleanup

### Stop All Running Containers

    docker stop $(docker ps -q)
### Remove All Stopped Containers

    docker rm $(docker ps -aq)
### Remove Unused Images

    docker system prune -a

Be careful — removes unused images, networks, containers.

### Check Docker Disk Usage

    docker system df

Shows space used by:

- Images

- Containers

- Volumes

- Build cache

## Key Learnings Today

- Images are read-only templates

- Containers are running instances of images

- Images are made of layers

- Layers improve caching and efficiency

- Containers have multiple lifecycle states

- Docker provides powerful inspection tools

- Cleanup is important to avoid disk bloat

## Why This Matters for DevOps

- Understanding images & lifecycle is critical for:

- Writing optimized Dockerfiles

- Debugging container issues

- Reducing CI/CD build time

- Managing production workloads

- Preparing for Kubernetes

Now I don’t just run containers —
I understand how they’re built and managed internally.

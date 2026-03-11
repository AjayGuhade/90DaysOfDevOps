# Docker Cheat Sheet

A quick reference for commonly used Docker commands.

---

# Container Commands

`docker run IMAGE`                 # Run container

`docker run -it IMAGE bash`        # Interactive container

`docker run -d IMAGE`              # Run container in background

`docker ps`                        # List running containers

`docker ps -a`                     # List all containers

`docker stop CONTAINER_ID`         # Stop container

`docker start CONTAINER_ID`        # Start container

`docker rm CONTAINER_ID`           # Remove container

`docker exec -it CONTAINER bash`   # Access running container

`docker logs CONTAINER_ID`         # View container logs

---

# Image Commands

`docker build -t IMAGE_NAME .`    # Build image from Dockerfile

`docker images`                    # List images

`docker pull IMAGE_NAME`           # Download image from Docker Hub

`docker push IMAGE_NAME`           # Push image to Docker Hub

`docker tag IMAGE_NAME NEW_TAG`    # Tag image

`docker rmi IMAGE_ID`              # Remove image

---

# Volume Commands

`docker volume create VOLUME_NAME`     # Create volume

`docker volume ls`                     # List volumes

`docker volume inspect VOLUME_NAME`    # Inspect volume

`docker volume rm VOLUME_NAME`         # Remove volume

---

# Network Commands

`docker network create NETWORK_NAME`   # Create network

`docker network ls`                    # List networks

`docker network inspect NETWORK_NAME`  # Inspect network

`docker network connect NETWORK CONTAINER`  # Connect container to network

---

# Docker Compose Commands

`docker compose up -d`             # Start services

`docker compose down`              # Stop services

`docker compose ps`                # List services

`docker compose logs`              # View logs

`docker compose build`             # Build services

---

# Cleanup Commands

`docker system df`                 # Check Docker disk usage

`docker container prune`           # Remove stopped containers

`docker image prune`               # Remove unused images

`docker volume prune`              # Remove unused volumes

`docker system prune -a`           # Remove everything unused

---

# Dockerfile Instructions

`FROM IMAGE `          # Base image

`RUN command  `        # Execute command

`COPY src dest `       # Copy files

`WORKDIR /app   `      # Set working directory

`EXPOSE 80       `     # Document port

`CMD ["python","app.py"] `     # Default command

`ENTRYPOINT ["python"]    `    # Main executable

`ENTRYPOINT ["python"] `       # Main executable

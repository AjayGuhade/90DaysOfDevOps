## Step 1 — Verify Clean Environment

Run:

    docker ps -a
    docker volume ls
    docker network ls

## Task 1 — The Problem (Containers Lose Data)

Run PostgreSQL container

`docker run -d --name postgres-test -e POSTGRES_PASSWORD=secret postgres`

Check container:

    docker ps
    Connect to PostgreSQL
    docker exec -it postgres-test psql -U postgres`

You will see:

    postgres=#

Create table and data:

`CREATE TABLE users(id SERIAL PRIMARY KEY, name TEXT);
INSERT INTO users(name) VALUES ('Ajay');
SELECT * FROM users;`

Example output:

     id | name
    ----+------
     1  | Ajay

Exit PostgreSQL:

    \q
Remove container

    docker rm -f postgres-test

Run a new container again:

    docker run -d --name postgres-test 
    -e POSTGRES_PASSWORD=secret postgres

Enter again:

    docker exec -it postgres-test psql -U postgres

Run:

    SELECT * FROM users;

❌ Table will not exist.

Why?

- Because containers are ephemeral 
-  data inside the container disappears when it is removed.

## Task 2 — Named Volumes (Persistent Storage)

Create volume

    docker volume create postgres-data

Check:

    docker volume ls

Run PostgreSQL with volume

    docker run -d --name postgres-db -e POSTGRES_PASSWORD=secret -v postgres-data:/var/lib/postgresql/data postgres

Add data

    docker exec -it postgres-db psql -U postgres

Run:

    CREATE TABLE users(id SERIAL PRIMARY KEY, name TEXT);
    INSERT INTO users(name) VALUES ('Ajay');
    SELECT * FROM users;

Exit:

    \q

Remove container

    docker rm -f postgres-db

Run container again with same volume

    docker run -d --name postgres-db -e POSTGRES_PASSWORD=secret -v postgres-data:/var/lib/postgresql/data postgres

Check data again:

     docker exec -it postgres-db psql -U postgres

     
     SELECT * FROM users;

✅ Data still exists.

## Task 3 — Bind Mounts

Create folder:

    mkdir website
    cd website

Create HTML file:

    nano index.html

Add:

    <h1>Hello from Docker Bind Mount 🚀</h1>

Save.

Run Nginx container:

    docker run -d --name nginx-test -p 8080:80 
    -v $(pwd):/usr/share/nginx/html nginx

Open browser:

    http://localhost:8080

Edit index.html and refresh.

✅ Changes appear instantly.

## Task 4 — Docker Networking Basics

List networks:

    docker network ls

You will see:

    bridge
    host
    none

Run two containers:

    docker run -dit --name container1 alpine
    docker run -dit --name container2 alpine

Get container2 IP:

    docker inspect container2 | grep IPAddress

Ping by IP:

    docker exec container1 ping <IP>

✅ Works.

Ping by name:

    docker exec container1 ping container2

❌ Fails.

##  Task 5 — Custom Network

Create network:

    docker network create my-app-net

Run containers on that network:

    docker run -dit --name app1 --network my-app-net alpine
    docker run -dit --name app2 --network my-app-net alpine

Ping by name:

    docker exec app1 ping app2

✅ Works.

Why?

Custom networks provide automatic DNS resolution.

## Task 6 — Database + App Network

Create network:

    docker network create app-network

Create volume:

    docker volume create mysql-data

Run MySQL container:

    docker run -d --name mysql-db --network app-network -e MYSQL_ROOT_PASSWORD=secret -v mysql-data:/var/lib/mysql mysql

Run app container:

    docker run -dit --name app-container --network app-network alpine

Test connectivity:

    docker exec app-container ping mysql-db

✅ Works using container name.
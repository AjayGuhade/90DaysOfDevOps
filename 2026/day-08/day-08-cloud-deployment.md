# Day 08 – Cloud Server Setup: Docker, Nginx & Web Deployment

## Commands Used

### Cloud Server Access

    ssh -i your-key.pem ubuntu@<PUBLIC_IP>

    whoami
    hostname

---
### System Update & Nginx Installation

    sudo apt update
    sudo apt install nginx -y

    systemctl status nginx

    sudo systemctl start nginx
    sudo systemctl enable nginx

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-08/Screenshot%20From%202026-02-02%2009-30-10.png))

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-08/Screenshot%20From%202026-02-02%2009-18-38.png))

---

### Web Verification


    curl localhost
---
### Log Management

    sudo mkdir -p /opt/nginx-logs

    sudo cp /var/log/nginx/access.log /opt/nginx-logs/access.log

    sudo cp /var/log/nginx/error.log /opt/nginx-logs/error.log

    sudo tail -n 20 /opt/nginx-logs/access.log

### Firewall & Networking Checks

    sudo ufw status
    
    sudo ufw allow 80
    
    sudo ss -tulnp | grep :80
    
    curl ifconfig.me
---

### Docker Installation

    sudo apt remove docker docker-engine docker.io containerd runc -y
     sudo apt update
    sudo apt install -y ca-certificates curl gnupg lsb-release

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    sudo docker run hello-world
    sudo usermod -aG docker ubuntu
    newgrp docker
    docker ps
 ---
 
##### Challenges Faced

- 1. Website worked locally but not on public IP

Issue: Nginx was accessible via localhost but not through browser.

- Root Cause: Cloud firewall / security group did not allow inbound port 80.

> Fix: Opened TCP port 80 in cloud security rules and verified Nginx was listening on 0.0.0.0:80.


2. Permission denied while reading Nginx logs
Issue: Permission denied when accessing /opt/nginx-logs/access.log

- Root Cause: Log files were owned by root.

> Fix: Used sudo to read logs and understood Linux permission model.


3. Docker command required sudo
Issue: docker ps failed without sudo.

- Fix: Added user to docker group and applied group changes.


#### What I Learned
- How to launch and access a cloud server securely using SSH

- Installing and managing services using systemctl

- Debugging real-world networking issues (local vs public access)

- Understanding Linux file permissions in production environments

- Installing Docker using official repositories

#### Why This Matters for DevOps
This exercise teaches you:

- Cloud infrastructure provisioning – launching and configuring servers

- Remote server management – SSH, security, access control

- Service deployment – installing and running applications

- Log management – accessing and analyzing logs

- Security – configuring firewalls and security groups

- These are core skills for any DevOps engineer working in production systems.

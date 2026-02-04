# Day 09 Challenge – Linux User & Group Management

## Users & Groups Created

### Users
- tokyo
- berlin
- professor
- nairobi

### Groups
- developers
- admins
- project-team

---

## Group Assignments

- **tokyo**
  - developers
  - project-team

- **berlin**
  - developers
  - admins

- **professor**
  - admins

- **nairobi**
  - project-team

---

## Directories Created

- **/opt/dev-project**
  - Group: developers
  - Permissions: 775 (rwxrwxr-x)

- **/opt/team-workspace**
  - Group: project-team
  - Permissions: 775 (rwxrwxr-x)

---

## Commands Used


## Create users with home directories
    sudo useradd -m tokyo
    sudo useradd -m berlin
    sudo useradd -m professor
---
## Set passwords
    passwd tokyo
    passwd berlin
    passwd professor
    
![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-09/01.png)

---
## Create groups
    sudo groupadd developers
    sudo groupadd admins
    sudo groupadd project-team
    
![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-09/02.png)

---
# Assign users to groups
    usermod -aG developers tokyo
    usermod -aG developers,admins berlin
    usermod -aG admins professor
    usermod -aG project-team tokyo
    
![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-09/03.png)

---

# Create shared directories
    mkdir /opt/dev-project
    mkdir /opt/team-workspace
    

# Set group ownership
    chown :developers /opt/dev-project
    chown :project-team /opt/team-workspace
---    

# Set permissions
    chmod 775 /opt/dev-project
    chmod 775 /opt/team-workspace
---    
# Create user nairobi with home directory
    sudo useradd -m nairobi
    sudo passwd nairobi
    sudo groupadd project-team
    sudo usermod -aG project-team nairobi
    sudo usermod -aG project-team tokyo
    getent group project-team
    sudo mkdir /opt/team-workspace
    sudo chown :project-team /opt/team-workspace
    sudo chmod 775 /opt/team-workspace
    ls -ld /opt/team-workspace
    su - nairobi
    touch /opt/team-workspace/nairobi_test.txt
    ls -l /opt/team-workspace
    exit
    
---
# Verification
    groups tokyo
    groups berlin
    groups professor
    groups nairobi
    ls -ld /opt/dev-project
    ls -ld /opt/team-workspace
---

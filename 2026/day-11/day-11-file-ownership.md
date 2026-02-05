# Linux Ownership & Group Management – Hands-On Challenge

## Task 1: Understanding Ownership (10 minutes)

### Command

    ls -l

### Sample Output Format:

 -rw-r--r-- 1 owner group size date filename

### Column Breakdown

**Column**	           -    Meaning

**-rw-r--r--**	       -  File type & permissions

** 1	**               -  Number of links

**owner**	             -  User who owns the file

**group**        	     -  Group associated with the file

**size**	             -  File size (bytes)

**date**	             -  Last modified date

**filename**	         -  Name of the file

---

### 📌 Difference Between Owner and Group

Owner → The user who created or owns the file (has primary control)

Group → A collection of users who can share access to the file
(useful for team collaboration)

---

## Task 2: Basic chown Operations (20 minutes)

### Create File

    touch devops-file.txt

### Check Current Owner

    ls -l devops-file.txt

### Create Users (if not already present)
    sudo useradd tokyo
    sudo useradd berlin

### Change Owner to tokyo
         
    sudo chown tokyo devops-file.txt

### Change Owner to berlin
 
    sudo chown berlin devops-file.txt

### Verify
   
    ls -l devops-file.txt


## ✅ Ownership successfully updated.

## Basic chgrp Operations 

### Create File
    
    touch team-notes.txt

### Check Current Group
    
    ls -l team-notes.txt

### Create Group
    
    sudo groupadd heist-team

### Change Group Ownership
 
    sudo chgrp heist-team team-notes.txt

### Verify
 
    ls -l team-notes.txt

## Change Owner & Group Together 

### Create File
    
    touch project-config.yaml

### Change Owner + Group (Single Command)
 
    sudo chown professor:heist-team project-config.yaml

### Create Directory
 
    mkdir app-logs

### Change Owner & Group
  
    sudo chown berlin:heist-team app-logs

### Verify
    
    ls -ld project-config.yaml app-logs

## Recursive Ownership (20 minutes)

### Create Directory Structure
    
    mkdir -p heist-project/vault
    mkdir -p heist-project/plans
    touch heist-project/vault/gold.txt
    touch heist-project/plans/strategy.conf

### Create Group
    
    sudo groupadd planners

## Change Ownership Recursively
    
    sudo chown -R professor:planners heist-project/

## Verify
   
    ls -lR heist-project/


✅ All files and subdirectories now inherit the new owner and group.

## Practice Challenge 

### Create Users
  
    sudo useradd tokyo
    sudo useradd berlin
    sudo useradd nairobi

### Create Groups
    sudo groupadd vault-team
    sudo groupadd tech-team

### Create Directory & Files
    mkdir bank-heist
    touch bank-heist/access-codes.txt
    touch bank-heist/blueprints.pdf
    touch bank-heist/escape-plan.txt

### Set Ownership
    
    sudo chown tokyo:vault-team bank-heist/access-codes.txt
    sudo chown berlin:tech-team bank-heist/blueprints.pdf
    sudo chown nairobi:vault-team bank-heist/escape-plan.txt

### Verify
 
    ls -l bank-heist/

## Key Takeaways (What I Learned)

Linux ownership is divided into user (owner) and group

chown controls who owns a file

chgrp controls which group owns a file

chown owner:group updates both at once

-R flag applies ownership changes recursively

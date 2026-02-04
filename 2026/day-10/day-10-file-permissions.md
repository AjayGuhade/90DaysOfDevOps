# Day 10 – File Permissions & File Operations Challenge

## Task

#### Master file permissions and basic file operations in Linux.

- Create and read files using touch, cat, vim
- Understand and modify permissions using chmod

## Task 1: Create Files 

### Create an empty file

   touch devops.txt
---

### Create a file with content

    echo "Linux file permissions practice" > notes.txt

(Alternative)

    cat > notes.txt
    Linux file permissions practice
    Ctrl+D
    
### Create a shell script
    vim script.sh
   Add:

    echo "Hello DevOps"
   Save and exit:

   ESC :wq

### Verify files and permissions
    ls -l

Example output:

-rw-r--r-- 1 user user    0 devops.txt 
-rw-r--r-- 1 user user   30 notes.txt  
-rw-r--r-- 1 user user   20 script.sh  

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-10/02.png)

---
## Task 2: Read Files 

### Read file contents
    cat notes.txt
### Open file in read-only mode
    vim -R script.sh
### View system file data
    head -n 5 /etc/passwd
    tail -n 5 /etc/passwd
    
![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-10/01.png)

---
    
## Task 3: Understand Permissions 

### Permission format
   rwx rwx rwx
    |   |   |
  user group others
 
 Permission values
 Permission	Symbol	Value
 Read	r	4
 Write	w	2
 Execute	x	1

### Check permissions
    ls -l devops.txt notes.txt script.sh
 Example explanation
 -rw-r--r-- devops.txt

 Role	Access
 Owner	Read, Write
 Group	Read
 Others	Read
 
 Execute	❌ No

 ---
 
## Task 4: Modify Permissions 

### Make script executable
    chmod +x script.sh
    ./script.sh

Output:

 Hello DevOps

### Make file read-only
    chmod 444 devops.txt

### Set custom permissions
    chmod 640 notes.txt

Meaning:

Owner → Read, Write

Group → Read

Others → No access

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-10/03.png)

---
### Create directory with permissions
    mkdir project
    chmod 755 project
    ls -ld project

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-10/04.png)

---   
##  Task 5: Test Permissions 

### Write to read-only file
    echo "test" >> devops.txt

Error:
Permission denied

### Execute without permission
    chmod -x script.sh
    ./script.sh
Error:
Permission denied
---

## 🧠 DevOps Learnings

Linux permissions control security and execution

Executable scripts require x permission

ls -l is essential for troubleshooting

Permission issues are common in deployments

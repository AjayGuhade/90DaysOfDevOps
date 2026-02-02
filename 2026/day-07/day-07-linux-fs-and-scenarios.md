# Day 07 – Linux File System Hierarchy & Scenario-Based Practice

## Goal
- Understand where things live in Linux
- Learn which directories matter for troubleshooting
- Practice real DevOps-style troubleshooting scenarios

---

## Linux File System Hierarchy (Important Directories)

### `/` – Root
- Top-level directory
- All files and directories originate here

---

### `/bin`
- Essential user commands
- Required for system recovery and single-user mode
- Examples: ls, cp, mv, cat, bash
#### Command
  `ls /bin`
  
---  

### `/sbin`

- System administration commands

- Mostly used by root

- Examples: reboot, fsck, ip
#### Command
 `ls /sbin`

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-07/01.png)

---
### `/etc`

- Configuration files

- First place to check during troubleshooting

Examples:

  -  /etc/ssh/sshd_config

  - /etc/passwd

  -  /etc/hosts
#### Command
`ls /etc`

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-07/02.png)

---
### /var

- Variable data that changes frequently

- Logs, cache, application state

Important subdirectories:

 - /var/log → system and application logs

 - /var/lib → application runtime data
#### Command
`ls /var/log`

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-07/03.png)

---
### /home

- User home directories

- User data, scripts, SSH keys

`ls /home`

---
### /tmp

- Temporary files

- Usually cleared on reboot
#### Command
`ls /tmp`

---
### /usr

- User applications and libraries

 - /usr/bin → user commands

 - /usr/lib → shared libraries
#### Command
`ls /usr/bin | head`

---
### /opt

- Optional or third-party software

- Common for enterprise applications
#### Command
`ls /opt`

---
### /dev

- Device files representing hardware
#### Command
`ls /dev | head`

---
### /proc

- Virtual filesystem

- Kernel and process information
#### Command
`cat /proc/cpuinfo`


---
## Scenario-Based Practice (DevOps Style)
#### Scenario 1: Service Is Down – Check Logs
    cd /var/log
    ls
    sudo less syslog

- Logs are stored in `/var/log`

- Used for debugging runtime issues

---  
#### Scenario 2: SSH Login Fails
    sudo less /etc/ssh/sshd_config
    sudo grep ssh /var/log/auth.log

- Configuration files → `/etc`

- Authentication logs → `/var/log`

---
## Key Takeaways

Linux follows a predictable directory structure

Most DevOps troubleshooting starts with:

`/etc`

`/var/log`

`/home`

Knowing where to look saves time during incidents

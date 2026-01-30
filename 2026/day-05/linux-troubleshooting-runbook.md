# Day 05 – Linux Troubleshooting Drill: CPU, Memory, and Logs

## Task
Today’s goal is to **run a focused troubleshooting drill**.

You will pick a running process/service on your system and:
- Capture a quick health snapshot (CPU, memory, disk, network)
- Trace logs for that service
- Write a **mini runbook** describing what you did and what you’d do next if things were worse

This turns yesterday’s practice into a repeatable troubleshooting routine.

### What’s a runbook?
A **runbook** is a short, repeatable checklist you follow during an incident: the exact commands you run, what you observed, and the next actions if the issue persists. Keep it concise so you can reuse it under pressure.

---

# Linux Troubleshooting Runbook 

## Target Service / Process
**Service:** sshd  
**Purpose:** Handles SSH remote access  
**Reason chosen:** Critical service, always running, easy to observe logs

---

## Environment Basics

### Command
    uname -a
### Command
    lsb-release -a

`uname` prints system information.

`-a` displays all details including kernel name, version, architecture, and build.

`lsb-release`  Standard Ubuntu LTS environment.

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-05/unmae-a.png)

---

**Shows disk space usage for all mounted filesystems in human‑readable format.**  

**Command:**
```bash
df -h
```
![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-05/02.png)

This command is used to: 
- detect disk‑full conditions
- identify filesystems nearing capacity
- explain service failures caused by lack of disk space

## CPU & Memory

**Displays process ID, CPU usage, memory usage, and command name for the `sshd` process.**  

**Command:**
```bash
ps -o pid,pcpu,pmem,comm -C cron
```
![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-05/03.png)

This command is used to:
- detect high CPU consumption
- identify memory leaks
- confirm whether sshd is actively running or stuck

---

**Shows total, used, and free system memory and swap usage.**

**Command:**
```bash
free -h
```
![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-05/04.png)

This command is used to:
- identify memory pressure
- check if swap is being heavily used
- explain performance degradation

## Disk & IO

**Calculates the total disk usage of the `/var/log` directory.**  

**Command:**
```bash
du -sh /var/log
```
![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-05/07.png)

This command is used to: 
- detect excessive log growth
- prevent disk exhaustion
- identify logging misconfigurations

---

**Reports CPU, memory, swap, and I/O statistics at regular intervals.**  

**Command:**
```bash
vmstat 1 3
```

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-05/08.png)


This command is used to: 
Used to:
- detect high I/O wait
- identify swapping activity
- spot CPU contention under load

---
## Network

**Lists listening TCP/UDP sockets along with the processes that own them.**  

**Command:**
```bash
ss -tulpn | grep cron
```
![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-05/09.png)

This command is used to:
- confirm sshd is listening on port 22
- verify correct network binding
- troubleshoot connection failures

---

**Sends an HTTP HEAD request and returns response headers only.**  

**Command:**
```bash
curl -I http://localhost
```
![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-05/10.png)

This command is used to: 
- quickly check HTTP service reachability
- validate response codes
- avoid downloading full content during checks

---
## Logs Reviewed

**Check service logs via journalctl**

**Command:**
```bash
journalctl -u cron -n 50
```
`journalctl` is a systemd log viewer.  
`-u cron` filters logs only for the Cron service.  
`-n 50` shows the last 50 log entries.

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-05/11.png)

This command is used to quickly check recent SSH service logs to identify:
- startup failures
- crashes
- authentication errors
- configuration issues

This helps confirm whether the service itself is failing or behaving normally.

---

**Inspect application logs (tail)**

**Command:**
```bash
grep CRON /var/log/syslog | tail -n 20
```
![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-05/12.png)

Displays the last 20 lines of the authentication log file.

This command is used to: 
- inspect recent login attempts
- detect failed authentications
- identify suspicious access patterns

---

## Resources
You may refer to:

- Notes from Day 02–04
- Linux `man` pages (`top`, `ps`, `df`, `journalctl`, `ss/netstat`)
- class notes

---

## Why This Matters for DevOps
Incidents rarely come with perfect clues. A fast, repeatable checklist saves minutes when services misbehave.

This drill builds:
- Habit of capturing evidence before acting
- Confidence reading resource signals (CPU, memory, disk, network)
- Log-first mindset before restarts or escalations

These habits reduce downtime and prevent guesswork in production.

---

Use hashtags:  
#90DaysOfDevOps  
#DevOpsKaJosh  
#TrainWithShubham

Happy Learning  

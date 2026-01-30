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

This command is used to confirm kernel version and CPU architecture when:
- correlating issues with kernel bugs
- checking driver compatibility
- validating OS consistency across servers

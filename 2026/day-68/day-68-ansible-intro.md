# Day 68 — Introduction to Ansible and Inventory Setup

## Objective
Learn Ansible fundamentals, set up inventory, and manage remote EC2 instances without installing agents.

---

## What is Configuration Management?

Configuration management ensures systems remain in the desired state automatically.

Examples:
- install packages
- manage users
- configure services
- copy files
- enforce consistency

Without it:
manual configuration becomes slow and error-prone.

---

## Why Ansible?

Compared to:

### Chef
- agent-based
- Ruby DSL
- heavier setup

### Puppet
- agent-based
- declarative manifests
- central server model

### Salt
- supports agent/minion mode
- fast messaging architecture

### Ansible
- agentless
- SSH-based
- YAML
- easy learning curve

---

## What Does Agentless Mean?

No software required on target machines.

Only:
- SSH
- credentials
- Python (usually preinstalled)

This reduces complexity.

---

## Ansible Architecture

Control Node:
Your Ubuntu laptop where Ansible runs.

Managed Nodes:
AWS EC2 servers being configured.

Inventory:
List of hosts Ansible manages.

Modules:
Reusable units of work.

Examples:
- ping
- copy
- yum
- apt
- command
- shell

Playbooks:
YAML automation instructions.

Architecture:

Control Node
↓ SSH
Managed Nodes

---

## Lab Setup

Used AWS EC2.

Instances:
- web-server
- app-server
- db-server

Specs:
- Amazon Linux
- t2.micro
- SSH enabled
- common key pair

---

## Inventory

```ini
[web]
web-server ansible_host=13.233.xxx.xxx

[app]
app-server ansible_host=13.234.xxx.xxx

[db]
db-server ansible_host=43.204.xxx.xxx

[application:children]
web
app

[all_servers:children]
application
db

[all:vars]
ansible_user=ec2-user
ansible_ssh_private_key_file=~/aws-key.pem
```

---

## Ad-Hoc Commands Run

Ping:

```bash
ansible all -m ping
```

Uptime:

```bash
ansible all -m command -a "uptime"
```

Memory:

```bash
ansible web -m command -a "free -h"
```

Disk:

```bash
ansible all -m command -a "df -h"
```

Install git:

```bash
ansible web -m yum -a "name=git state=present" --become
```

Copy file:

```bash
ansible all -m copy -a "src=hello.txt dest=/tmp/hello.txt"
```

---

## command vs shell

command:
- safer
- no shell operators

shell:
- supports pipes
- supports redirects
- less secure

Examples:

command:

```bash
ansible all -m command -a "uptime"
```

shell:

```bash
ansible all -m shell -a "ps aux | grep nginx"
```

---

## What is --become?

Privilege escalation.

Equivalent to sudo.

Needed for:
- package installation
- service management
- system config

---

## Key Learnings

- agentless automation
- inventory grouping
- ad-hoc remote execution
- SSH-based management
- command vs shell modules
- privilege escalation
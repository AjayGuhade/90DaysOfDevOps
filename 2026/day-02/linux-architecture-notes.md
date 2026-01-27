# Linux Under the Hood – DevOps Foundation

These notes explain how Linux works internally. This understanding is **core to troubleshooting, performance tuning, and reliability** as a DevOps engineer.

---

## 1. Core Components of Linux

### 1.1 Kernel (The Heart of Linux)

The **Linux kernel** is the core program that directly interacts with hardware.

**What the kernel does:**

* Process management (CPU scheduling)
* Memory management (RAM, swap, paging)
* Device drivers (disk, network, USB)
* Filesystem access
* Networking stack
* System calls interface

👉 Applications **never talk to hardware directly**. They request services from the kernel via **system calls**.

**Key idea:**

> If something crashes at a low level (OOM kill, kernel panic, driver issue), the kernel is involved.

---

### 1.2 User Space (Where Applications Live)

**User space** contains everything that is *not* the kernel.

Includes:

* Shells (bash, zsh)
* Core utilities (ls, ps, grep, systemctl)
* Applications (nginx, docker, java, python)
* Libraries (glibc)

User-space programs:

* Run with **limited privileges**
* Cannot access hardware directly
* Must use **system calls** to request kernel services

👉 This separation is why Linux is **secure and stable**.

---

### 1.3 Init System (systemd)

When Linux boots:

1. BIOS/UEFI loads bootloader (GRUB)
2. Bootloader loads the **kernel**
3. Kernel starts the **first process** → `PID 1`

On modern Linux, `PID 1` is **systemd**.

---

## 2. How Processes Are Created and Managed

### 2.1 Process Creation

In Linux, **every program is a process**.

Process creation flow:

1. A parent process calls `fork()`
2. Kernel creates a child process (copy of parent)
3. Child calls `exec()` to load a new program

Example:

* Shell (`bash`) → `fork()` → `exec(ls)`

👉 This is why **everything starts from PID 1**.

---

### 2.2 Process States

Common Linux process states:

* **R** – Running
* **S** – Sleeping (waiting for I/O)
* **D** – Uninterruptible sleep (disk/network wait)
* **Z** – Zombie (terminated, not cleaned up)
* **T** – Stopped

Commands:

* `ps aux`
* `top` / `htop`
* `pstree`

---

### 2.3 Scheduling & Resource Control

The kernel:

* Schedules CPU time
* Allocates memory
* Enforces limits

DevOps relevance:

* `nice`, `renice`
* `ulimit`
* cgroups (used by Docker & Kubernetes)

👉 Containers work because Linux **already had these features**.

---

## 3. What systemd Does (and Why It Matters)

### 3.1 systemd Responsibilities

`systemd` is more than a service manager.

It handles:

* Service startup & shutdown
* Dependency management
* Logging (`journald`)
* Mount points
* Timers (cron replacement)
* User sessions

Everything is defined as a **unit**:

* `service`
* `socket`
* `mount`
* `timer`

---

### 3.2 Why systemd Is Important for DevOps

systemd provides:

* Faster boot (parallel startup)
* Reliable service restarts
* Clear dependency control
* Centralized logs

Common commands:

* `systemctl status nginx`
* `systemctl restart docker`
* `journalctl -u nginx`

👉 Most production outages involve **services**, and systemd is how you control them.

---

## 4. DevOps Troubleshooting Mental Model

When something breaks, think in layers:

1. **Hardware** – disk, memory, network
2. **Kernel** – OOM, CPU scheduling, drivers
3. **systemd** – service failed, dependency issue
4. **Process** – crashed app, wrong config
5. **Application** – bugs, bad deployment

> Linux troubleshooting is about **finding the layer where reality diverged from expectation**.



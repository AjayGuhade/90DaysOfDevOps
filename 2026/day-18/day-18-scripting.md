# 📅 Day 18 – Shell Scripting: Functions & Advanced Concepts
## 🎯 Objective

## Today’s focus was to write cleaner, safer, and reusable shell scripts using:

### Functions

### Return values

### Local variables

### Strict mode (set -euo pipefail)

### Structured scripting with main()

## 🟢 Task 1 – Basic Functions

### 📝 functions.sh

    #!/bin/bash

    greet() {
        echo "Hello, $1!"
    }

    add() {
        sum=$(( $1 + $2 ))
        echo "Sum: $sum"
    }

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-18/01.png)

## Calling functions

greet "Ajay"
add 10 20

### ✅ Output
Hello, Ajay!
Sum: 30

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-18/02.png)

## 🟢 Task 2 – Functions with Return Values

### 📝 disk_check.sh
    #!/bin/bash

    check_disk() {
        echo "Disk Usage:"
        df -h /
    }

    check_memory() {
        echo "Memory Usage:"
        free -h
    }

    main() {
        check_disk
        echo "------------------------"
        check_memory
    }

    main

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-18/03.png)

### ✅ Output Example

Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   20G   28G  42% /

------------------------

Memory Usage:
              total        used        free
Mem:           7.6G        2.1G        3.5G

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-18/04.png)

## 🟢 Task 3 – Strict Mode (set -euo pipefail)

### 📝 strict_demo.sh
    #!/bin/bash
    set -euo pipefail

    echo "Strict mode enabled"

    # set -u (undefined variable)
    echo "Value: $undefined_var"

    # set -e (command failure)
    false

    # set -o pipefail (pipeline failure)
    grep "text" nonexistentfile | wc -l

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-18/05.png)

## 📘 Strict Mode Explanation
set -e → Exit immediately if any command fails.
set -u → Exit if an undefined variable is used.
set -o pipefail → Fail the whole pipeline if any command fails.

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-18/06.png)

## 🔎 Observations

Using an undefined variable immediately stops the script.

A failing command exits the script.

If any command inside a pipe fails, the script exits.

This makes scripts safer and production-ready.

## 🟢 Task 4 – Local Variables

### 📝 local_demo.sh
    #!/bin/bash

    demo_local() {
        local var="I am local"
        echo "Inside function: $var"
    }

     demo_global() {
        var2="I am global"
    }

    demo_local
    echo "Outside function (local var): ${var:-Not Accessible}"

    demo_global
    echo "Outside function (global var): $var2"

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-18/07.png)

### ✅ Output
Inside function: I am local
Outside function (local var): Not Accessible
Outside function (global var): I am global

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-18/08.png)

## 🟢 Task 5 – System Info Reporter

### 📝 system_info.sh
    #!/bin/bash
    set -euo pipefail

    print_header() {
       echo "===================================="
       echo "$1"
       echo "===================================="
    }

    system_info() {
       print_header "System Information"
       echo "Hostname: $(hostname)"
       echo "OS Info: $(uname -a)"
    }

    uptime_info() {
       print_header "Uptime"
       uptime
    }

    disk_usage() {
       print_header "Top 5 Disk Usage"
       df -h | sort -k5 -nr | head -n 6
    }

    memory_usage() {
       print_header "Memory Usage"
       free -h
    }

    cpu_usage() {
       print_header "Top 5 CPU Processes"
       ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    }

    main() {
        system_info
        uptime_info
        disk_usage
        memory_usage
        cpu_usage
    }

    main

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-18/09.png)

### ✅ Output :

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-18/10.png)

## 📚 What I Learned (3 Key Points)
1️⃣ Functions Improve Script Structure

Breaking scripts into functions makes them readable, reusable, and modular.

2️⃣ Strict Mode Prevents Silent Failures

Using set -euo pipefail ensures scripts fail fast and safely.

3️⃣ Local Variables Prevent Bugs

Using local avoids variable conflicts in larger scripts.

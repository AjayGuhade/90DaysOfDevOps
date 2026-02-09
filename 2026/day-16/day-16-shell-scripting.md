# Day 16 – Shell Scripting Basics

## Goal
Learn the fundamentals of shell scripting: shebang, variables, user input, and basic conditional logic.

---

## Task 1: Your First Script

### Script: hello.sh

    #!/bin/bash
    echo "Hello, DevOps!"

### Commands Used

    chmod +x hello.sh
    ./hello.sh

### Output

Hello, DevOps!



### What happens if you remove the shebang?

Without the shebang (#!/bin/bash), the system does not know which interpreter to use.
The script may fail or run incorrectly depending on the shell being used.

## Task 2: Variables

### Script: variables.sh
    #!/bin/bash

    NAME="Ajay"
    ROLE="DevOps Engineer"
   
    echo "Hello, I am $NAME and I am a $ROLE"

### Output

    Hello, I am Ajay and I am a DevOps Engineer

### Single Quotes vs Double Quotes

Single quotes ('') treat variables as plain text (no expansion)

Double quotes ("") allow variable expansion

Example:

    echo '$NAME'   # Prints $NAME
    echo "$NAME"   # Prints Ajay

![Verify](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-16/04.png))

## Task 3: User Input with read
### Script: greet.sh

    #!/bin/bash

    read -p "Enter your name: " NAME
    read -p "Enter your favourite tool: " TOOL

    echo "Hello $NAME, your favourite tool is $TOOL"

### Sample Run
    
    Enter your name: Ajay
    Enter your favourite tool: Docker
    Hello Ajay, your favourite tool is Docker

![Verify](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-16/02.png))

## Task 4: If-Else Conditions

### Script 1: check_number.sh
    #!/bin/bash

    read -p "Enter a number: " NUM

    if [ "$NUM" -gt 0 ]; then
    echo "The number is positive"
    elif [ "$NUM" -lt 0 ]; then
    echo "The number is negative"
    else
    echo "The number is zero"
    fi`

### Sample Output

Enter a number: -5
The number is negative



### Script 2: file_check.sh
    #!/bin/bash

    read -p "Enter filename: " FILE

    if [ -f "$FILE" ]; then
    echo "File exists"
    else
    echo "File does not exist"
    fi

### Sample Output
Enter filename: test.txt
File exists

![Verify](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-16/01.png))

## Task 5: Combine It All
### Script: server_check.sh
    #!/bin/bash

    SERVICE="sshd"

    read -p "Do you want to check the status of $SERVICE? (y/n): " ANSWER

    if [ "$ANSWER" = "y" ]; then
    systemctl is-active --quiet $SERVICE
    if [ $? -eq 0 ]; then
    echo "$SERVICE is running"
    else
    echo "$SERVICE is not running"
    fi
    else
    echo "Skipped."
    fi

### Sample Output
    Do you want to check the status of sshd? (y/n): y
    sshd is running

![Verify](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-16/03.png))

## What I Learned (Key Takeaways)

The shebang defines which shell interpreter executes the script.

Variables and user input make scripts dynamic and reusable.

Conditional logic allows scripts to make decisions automatically.

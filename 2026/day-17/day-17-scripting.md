# 📅 Day 17 – Shell Scripting: Loops, Arguments & Error Handling
## 🎯 Objective

### Today’s focus was to level up shell scripting by working with:

###  for loops

### while loops

### Command-line arguments ($1, $#, $@)

### Package installation automation

### Error handling

### Root validation

## 🟢 Task 1 – For Loop

### 📝 for_loop.sh


    #!/bin/bash

    fruits=("Apple" "Banana" "Mango" "Orange" "Grapes")

    for fruit in "${fruits[@]}"
    do
       echo "Fruit: $fruit"
    done

### ✅ Output

Fruit: Apple
Fruit: Banana
Fruit: Mango
Fruit: Orange
Fruit: Grapes

### 📝 count.sh

    #!/bin/bash

    for i in {1..10}
    do
       echo $i
    done

### ✅ Output
1
2
3
4
5
6
7
8
9
10

## 🟢 Task 2 – While Loop

### 📝 countdown.sh

    #!/bin/bash

    echo "Enter a number:"
    read num

    while [ $num -ge 0 ]
    do
       echo $num
       num=$((num-1))
    done

    echo "Done!"

### ✅ Output Example
Enter a number:
7
7
6
5
4
3
2
1
0
Done!

## 🟢 Task 3 – Command-Line Arguments
### 📝 greet.sh
 
    #!/bin/bash

    if [ $# -eq 0 ]
    then
        echo "Usage: ./greet.sh <name>"
    else
        echo "Hello, $1!"
    fi

### ✅ Output
./greet.sh Ajay
Hello, Ajay!

### 📝 args_demo.sh
    #!/bin/bash

    echo "Script Name: $0"
    echo "Total Arguments: $#"
    echo "All Arguments: $@"

### ✅ Output
./args_demo.sh DevOps Linux Docker
Script Name: ./args_demo.sh
Total Arguments: 3
All Arguments: DevOps Linux Docker

## 🟢 Task 4 – Install Packages via Script
### 📝 install_packages.sh
    
    #!/bin/bash

    # Check if script is run as root
    if [ "$EUID" -ne 0 ]
    then
       echo "Please run as root (sudo)"
       exit 1
    fi

    packages=("nginx" "curl" "wget")

    for pkg in "${packages[@]}"
    do
        if dpkg -s "$pkg" &> /dev/null
        then
           echo "$pkg is already installed. Skipping..."
         else
           echo "Installing $pkg..."
           apt update -y
           apt install -y "$pkg"
           echo "$pkg installed successfully."
        fi
    done

### ✅  Output
nginx is already installed. Skipping...
Installing curl...
curl installed successfully.
Installing wget...
wget installed successfully.

## 🟢 Task 5 – Error Handling
### 📝 safe_script.sh

    #!/bin/bash

    set -e

    mkdir /tmp/devops-test || echo "Directory already exists"

    cd /tmp/devops-test || { echo "Failed to enter directory"; exit 1; }

    touch testfile.txt || echo "Failed to create file"

    echo "Script executed successfully."

### ✅ Output

Directory already exists
Script executed successfully.

# 📚 What I Learned (3 Key Points)

## 1️⃣ Loops Enable Automation

Using for and while makes repetitive tasks efficient and scalable.

## 2️⃣ Command-Line Arguments Make Scripts Dynamic

Using $1, $#, and $@ allows scripts to accept user input and behave differently.

## 3️⃣ Error Handling Makes Scripts Production-Ready

# Using:

set -e

|| operator

Root checks ($EUID)

Prevents silent failures and improves reliability.

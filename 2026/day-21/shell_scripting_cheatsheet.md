# 1️⃣ Basics
## Shebang

 Tells system which interpreter to use.

    #!/bin/bash

## Running a Script

    chmod +x script.sh
    ./script.sh
    bash script.sh

## Comments

    # Single line comment
    echo "Hello"  # Inline comment

## Variables
    
    NAME="Ajay"
    echo $NAME
    echo "$NAME"
    echo '$NAME'

## Read User Input

    read USERNAME
    echo "Hello $USERNAME"


## Command-Line Arguments

    echo $0   # Script name
    echo $1   # First argument
    echo $#   # Number of args
    echo $@   # All args
    echo $?   # Last command exit code

# 2️⃣ Operators & Conditionals

## String Comparisons

    [ "$a" = "$b" ]
    [ "$a" != "$b" ]
    [ -z "$a" ]
    [ -n "$a" ]

## Integer Comparisons
    
    [ "$a" -eq "$b" ]
    [ "$a" -ne "$b" ]
    [ "$a" -lt "$b" ]
    [ "$a" -gt "$b" ]
    [ "$a" -le "$b" ]
    [ "$a" -ge "$b" ]

## File Test Operators

    [ -f file ]   # regular file
    [ -d dir ]    # directory
    [ -e file ]   # exists
    [ -r file ]   # readable
    [ -w file ]   # writable
    [ -x file ]   # executable
    [ -s file ]   # not empty

## If / Elif / Else

    if [ -f file ]; then
      echo "File exists"
    elif [ -d file ]; then
      echo "Directory"
    else
      echo "Not found"
    fi

## Logical Operators
 
    [ condition1 ] && echo "True"
    [ condition1 ] || echo "False"
    [ ! -f file ]

### Case Statement
    
    case $1 in
      start) echo "Starting";;
      stop) echo "Stopping";;
      *) echo "Usage: start|stop";;
    esac

# 3️⃣ Loops
    
   ## For Loop (List-Based)
    for i in 1 2 3; do
      echo $i
    done

   ## For Loop (C-style)
    for ((i=1; i<=5; i++)); do
      echo $i
    done

  ##  While Loop
    i=1
    while [ $i -le 5 ]; do
      echo $i
      ((i++))
    done

 ## Until Loop
    
    i=1
    until [ $i -gt 5 ]; do
      echo $i
      ((i++))
    done

  ## Loop Control

    break
    continue

  ## Loop Over Files

    for file in *.log; do
      echo "$file"
    done

  ## Loop Over Command Output

    ls | while read line; do
      echo "$line"
    done

# 4️⃣ Functions

## Define Function

    greet() {
      echo "Hello $1"
    }

## Call Function
  
    greet Ajay

##  Return Values
    add() {
      echo $(($1 + $2))
    }
    result=$(add 2 3)

## Using return

    check() {
      return 1
    }

## Local Variables
    
    myfunc() {
      local VAR="inside"
    }

# 5️⃣ Text Processing Commands

## Grep
    grep "error" file.log
    grep -i "error" file.log
    grep -r "error" .
    grep -c "error" file.log
    grep -n "error" file.log
    grep -v "info" file.log
    grep -E "error|fail" file.log

## Awk

    awk '{print $1}' file
    awk -F: '{print $1}' /etc/passwd
    awk '/error/ {print $0}' file
    awk 'BEGIN {print "Start"} END {print "Done"}' file

## Sed

    sed 's/old/new/g' file
    sed -i 's/foo/bar/g' file
    sed '2d' file

## Cut
    
    cut -d: -f1 /etc/passwd

## Sort

    sort file
    sort -n file
    sort -r file
    sort -u file

## Uniq
    
    uniq file
    uniq -c file

## Tr
    
    tr 'a-z' 'A-Z'
    tr -d '\n'

## WC

    wc -l file
    wc -w file
    wc -c file

## Head / Tail

    head -n 10 file
    tail -n 10 file
    tail -f file

# 6️⃣ Useful One-Liners

## Delete Files Older Than 7 Days

    find /path -type f -mtime +7 -delete

## Count Lines in All .log Files

    wc -l *.log

## Replace String Across Multiple Files
    
    sed -i 's/old/new/g' *.txt

## Check If Service Is Running
    
    systemctl is-active nginx

## Disk Usage Alert
 
    df -h | awk '$5 > 80 {print $0}'

## Real-Time Error Monitoring

    tail -f app.log | grep --line-buffered "ERROR"

# 7️⃣ Error Handling & Debugging

## Exit Codes

    exit 0
    exit 1
    echo $?

## Exit on Error
    
    set -e

## Unset Variable as Error

    set -u

## Pipe Fail
    
    set -o pipefail

## Debug Mode

    set -x

## Trap Cleanup

    cleanup() {
      echo "Cleaning up..."
    }
    trap cleanup EXIT

# ✅ Final Notes

✔ Keep scripts executable

✔ Always quote variables

✔ Check exit codes

✔ Use set -euo pipefail in production scripts

✔ Log everything in real-world automation

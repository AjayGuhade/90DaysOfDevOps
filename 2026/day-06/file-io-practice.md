# Day 06 – Linux Fundamentals: Read and Write Text Files

## Task
This is a **continuation of Day 05**, but much simpler.

Today’s goal is to **practice basic file read/write** using only fundamental commands.

You will create a small text file and practice:
- Creating a file
- Writing text to a file
- Appending new lines
- Reading the file back

Keep it basic and repeatable.

---
## Environment Basics

### Command
    touch day06.txt
- this will create a new file name day06.txt   
### Command
    ls 
- this wil list dowen this folders fils contain in it.

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-06/Untitled%20design.png)

### Command
    echo "Day 06: Learning how to read and write files in Linux" > day06.txt

- `> `  overwrites existing content.  
### Command
    echo "This file was created using touch command" >> day06.txt
- Use `>>` to add more content without deleting previous text:

### Command 
    cat day06.txt
- View entire file

### Command
    head day06.txt
- Show first few lines:

### Command 
    tail day06.txt
- Show last few lines

### Command
     ls -l day06.txt
- Verify the details like check the file size and file permissions

![Verify ](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-06/02.png)

### What You Practiced Today

`touch` → create files

`echo >` → write data

`echo >>` → append data

`cat`, `less` → read files

`head`, `tail` → partial reading

These commands are used daily by DevOps engineers for logs, configs, and scripts.

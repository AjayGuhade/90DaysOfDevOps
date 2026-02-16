# 🚀 Day 19 – Shell Scripting Project
## Log Rotation, Backup & Crontab

## Today I combined everything from Days 16–18 and built real-world automation scripts like a DevOps engineer.

## ✅ Task 1: Log Rotation Script

### 📜 log_rotate.sh
     
     #!/bin/bash

    LOG_DIR=$1

    if [ -z "$LOG_DIR" ]; then
        echo "Usage: $0 <log_directory>"
        exit 1
    fi

    if [ ! -d "$LOG_DIR" ]; then
        echo "Error: Directory does not exist."
        exit 1
    fi

    COMPRESSED_COUNT=0
    DELETED_COUNT=0

    # Compress .log files older than 7 days
    for file in $(find "$LOG_DIR" -type f -name "*.log" -mtime +7); do
        gzip "$file"
        ((COMPRESSED_COUNT++))
    done

    # Delete .gz files older than 30 days
    for file in $(find "$LOG_DIR" -type f -name "*.gz" -mtime +30); do
        rm "$file"
        ((DELETED_COUNT++))
    done

    echo "Compressed files: $COMPRESSED_COUNT"
    echo "Deleted files: $DELETED_COUNT"

### 🔍 What It Does

Takes log directory as argument

Compresses .log files older than 7 days

Deletes .gz files older than 30 days

Prints summary

Exits if directory doesn't exist

## ✅ Task 2: Server Backup Script

### 📜 backup.sh

    #!/bin/bash

    SOURCE=$1
    DEST=$2

    if [ -z "$SOURCE" ] || [ -z "$DEST" ]; then
        echo "Usage: $0 <source_directory> <backup_destination>"
        exit 1
    fi

    if [ ! -d "$SOURCE" ]; then
        echo "Error: Source directory does not exist."
        exit 1
    fi

    mkdir -p "$DEST"

    TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
    ARCHIVE_NAME="backup-$TIMESTAMP.tar.gz"
    ARCHIVE_PATH="$DEST/$ARCHIVE_NAME"

    tar -czf "$ARCHIVE_PATH" "$SOURCE"

    if [ $? -eq 0 ]; then
        echo "Backup successful!"
        echo "Archive: $ARCHIVE_NAME"
        echo "Size: $(du -h "$ARCHIVE_PATH" | cut -f1)"
    else
        echo "Backup failed!"
        exit 1
    fi

    # Delete backups older than 14 days
    find "$DEST" -type f -name "backup-*.tar.gz" -mtime +14 -exec rm {} \;

## 🔍 What It Does

Creates timestamped backup

Verifies success

Prints archive name & size

Deletes backups older than 14 days

Exits if source missing

## ✅ Task 3: Crontab Entries

📌 Current Scheduled Jobs

    crontab -l

bash

* * * * * command

│   │   │   │   │

│   │   │   │   └── Day of week (0-7)

│   │   │   └──── Month (1-12)

│   │   └────── Day of month (1-31)

│   └──────── Hour (0-23)

└────────── Minute (0-59)



🗓 Required Cron Jobs

🔹 Run log_rotate.sh every day at 2 AM
0 2 * * * /path/to/log_rotate.sh /var/log/myapp

🔹 Run backup.sh every Sunday at 3 AM
0 3 * * 0 /path/to/backup.sh /home/user/data /backup

🔹 Health check every 5 minutes
*/5 * * * * /path/to/health_check.sh

## ✅ Task 4: Combined Maintenance Script

### 📜 maintenance.sh
    
    #!/bin/bash

    LOG_FILE="/var/log/maintenance.log"
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

    echo "[$TIMESTAMP] Starting maintenance..." >> "$LOG_FILE"

    # Call log rotation
    /path/to/log_rotate.sh /var/log/myapp >> "$LOG_FILE" 2>&1

    # Call backup
    /path/to/backup.sh /home/user/data /backup >> "$LOG_FILE" 2>&1

    echo "[$TIMESTAMP] Maintenance completed." >> "$LOG_FILE"
    echo "-------------------------------------" >> "$LOG_FILE"

    🗓 Cron Entry (Daily at 1 AM)
    0 1 * * * /path/to/maintenance.sh

## 🎯 What I Learned (Key Takeaways)

Real DevOps = Automation + Scheduling

How to safely handle errors and exit conditions

How cron jobs power production servers

#!/bin/bash

<< README

 Log Analyzer & Report Script

README

# Task 1: Input Validation
if [ $# -eq 0 ]; then
    echo "❌ Error: Please provide a log file path."
    echo "Usage: ./log_analyzer.sh <log_file>"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "❌ Error: File does not exist."
    exit 1
fi

# Date for report
CURRENT_DATE=$(date +"%Y-%m-%d")
REPORT_FILE="log_report_${CURRENT_DATE}.txt"

echo "Analyzing log file: $LOG_FILE"
echo "--------------------------------"

# Task 2: Error Count
ERROR_COUNT=$(grep -Ei "ERROR|Failed" "$LOG_FILE" | wc -l)
TOTAL_LINES=$(wc -l < "$LOG_FILE")

echo "Total Errors (ERROR/Failed): $ERROR_COUNT"

# Task 3: Critical Events
CRITICAL_EVENTS=$(grep -n "CRITICAL" "$LOG_FILE")

echo ""
echo "--- Critical Events ---"
if [ -z "$CRITICAL_EVENTS" ]; then
    echo "No critical events found."
else
    echo "$CRITICAL_EVENTS"
fi

# Task 4: Top 5 Error Messages
echo ""
echo "--- Top 5 Error Messages ---"

TOP_ERRORS=$(grep "ERROR" "$LOG_FILE" \
    | sed 's/.*ERROR[: ]*//' \
    | sort \
    | uniq -c \
    | sort -nr \
    | head -5)

if [ -z "$TOP_ERRORS" ]; then
    echo "No ERROR messages found."
else
    echo "$TOP_ERRORS"
fi

# Task 5: Generate Report
{
    echo "===== Log Analysis Report ====="
    echo "Date of Analysis: $CURRENT_DATE"
    echo "Log File: $LOG_FILE"
    echo "Total Lines Processed: $TOTAL_LINES"
    echo "Total Errors (ERROR/Failed): $ERROR_COUNT"
    echo ""
    echo "--- Top 5 Error Messages ---"
    echo "$TOP_ERRORS"
    echo ""
    echo "--- Critical Events ---"
    if [ -z "$CRITICAL_EVENTS" ]; then
        echo "No critical events found."
    else
        echo "$CRITICAL_EVENTS"
    fi
} > "$REPORT_FILE"

echo ""
echo "✅ Report generated: $REPORT_FILE"

# Task 6: Archive Processed Logs (Optional)
ARCHIVE_DIR="archive"

if [ ! -d "$ARCHIVE_DIR" ]; then
    mkdir "$ARCHIVE_DIR"
fi

mv "$LOG_FILE" "$ARCHIVE_DIR"/

echo "📦 Log file moved to archive/"

echo "🎯 Analysis Complete!"


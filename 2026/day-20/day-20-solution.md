# Day 20 – Log Analyzer & Report Generator

## Objective
Build a Bash script that analyzes log files, extracts errors and critical events,
and generates a structured summary report.

---

## Approach

### 1. Input Validation
- Checked if argument is provided.
- Verified file existence.
- Exited with meaningful error messages.

### 2. Error Counting
Used:
grep -Ei "ERROR|Failed" file | wc -l

To count total failures.

### 3. Critical Events
Used:
grep -n "CRITICAL" file

To print line numbers with critical messages.

### 4. Top 5 Error Messages
Pipeline used:
grep → sed → sort → uniq -c → sort -nr → head -5

This extracts, groups, and ranks most frequent error messages.

### 5. Report Generation
Used output redirection `>` to generate:
log_report_<date>.txt

Included:
- Date
- Log filename
- Total lines
- Error count
- Top errors
- Critical events

### 6. Archiving Logs
- Created archive/ directory if missing
- Moved processed log file
- Confirmed action

---
## Scrpt:
`
![verify](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-20/log_analyzer.sh)



## Output:

`![verify](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-20/log_report_2026-02-17.txt)

## Log File:

![verify](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-20/data.txt)

## Key Learnings

1. Advanced grep usage with case-insensitive search.
2. Text processing using sed, sort, uniq.
3. Automating reporting and file management in Bash.

---

## How to Run

chmod +x log_analyzer.sh
./log_analyzer.sh system.log

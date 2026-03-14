    # Day 41 – GitHub Actions Triggers & Matrix Builds

## Pull Request Trigger

Workflow: pr-check.yml

Explanation:
Runs when a pull request targets the main branch.

Screenshot:
(Add PR check screenshot)

---

## Scheduled Trigger

Workflow: schedule.yml

Cron used:
0 0 * * *

Meaning:
Runs every day at midnight UTC.

Question:
What is cron for every Monday at 9 AM?

Answer:
0 9 * * 1

---

## Manual Trigger

Workflow: manual.yml

Explanation:
Triggered manually from the GitHub Actions tab.

Screenshot:
(Add run workflow screenshot)

---

## Matrix Builds

Workflow: matrix.yml

Matrix combinations:

Python versions:
- 3.10
- 3.11
- 3.12

Operating Systems:
- Ubuntu
- Windows

Total Jobs:
6 jobs running in parallel

---

## Exclude & Fail-Fast

Excluded:
Python 3.10 on Windows

Fail-fast comparison:

fail-fast: true  
Stops all jobs when one fails.

fail-fast: false  
Other jobs continue even if one fails.
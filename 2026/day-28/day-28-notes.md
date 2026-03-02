# Day 28 – Revision Day (Day 1–27 Recap)

## Goal of Today

No new concepts.
Only revision, gap identification, and confidence building.

After 27 days of consistent learning across DevOps fundamentals, Linux, Shell scripting, Git, GitHub, and branding — today is about strengthening foundations.

## Task 1: Self-Assessment Checklist

### Linux

Topic	Status
| Topic                             | Status                                       |
| --------------------------------- | -------------------------------------------- |
| File navigation & management      | ✅ Can do confidently                         |
| Process management                | ⚠️ Need to revisit (advanced signals & jobs) |
| systemd service management        | ✅ Confident                                  |
| Text editing (vim/nano)           | ✅ Confident                                  |
| CPU, memory, disk troubleshooting | ⚠️ Need to revisit (deep memory analysis)    |
| Linux file system hierarchy       | ✅ Confident                                  |
| Users & groups management         | ✅ Confident                                  |
| chmod (numeric & symbolic)        | ✅ Confident                                  |
| chown & chgrp                     | ✅ Confident                                  |
| LVM management                    | ⚠️ Need more hands-on                        |
| Networking checks                 | ⚠️ Revisit dig & DNS troubleshooting         |
| DNS, IP, subnets, ports theory    | ⚠️ Revise subnetting                         |

### Shell Scripting
Topic	Status
| Topic                              | Status                      |
| ---------------------------------- | --------------------------- |
| Variables & arguments              | ✅ Confident                 |
| Conditionals                       | ✅ Confident                 |
| Loops                              | ✅ Confident                 |
| Functions                          | ⚠️ Practice return handling |
| grep, awk, sed                     | ⚠️ Need deeper awk practice |
| Error handling (set -euo pipefail) | ⚠️ Revisit edge cases       |
| Crontab scheduling                 | ✅ Confident                 |

### Git & GitHub
Topic	Status
| Topic                 | Status                          |
| --------------------- | ------------------------------- |
| Init, stage, commit   | ✅ Confident                     |
| Branching             | ✅ Confident                     |
| Push & pull           | ✅ Confident                     |
| Clone vs fork         | ✅ Confident                     |
| Merge vs fast-forward | ⚠️ Revisit merge commit history |
| Rebase vs merge       | ⚠️ More practice                |
| git stash             | ✅ Confident                     |
| Cherry-pick           | ⚠️ Need more practice           |
| Reset vs revert       | ⚠️ Reconfirm scenarios          |
| Branching strategies  | ⚠️ Revise comparison            |
| GitHub CLI            | ✅ Confident                     |


## Task 2: Weak Spots Revisited

1️⃣ LVM

- Re-practiced creating PV → VG → LV

- Mounted logical volume

- Extended volume and resized filesystem

- Understood why LVM is flexible compared to static partitions

2️⃣ Git Rebase vs Merge

- Merge preserves history

- Rebase rewrites history for cleaner linear logs

-Never rebase shared/public branches

3️⃣ awk & Advanced Text Processing

- Practiced column extraction

-Used field separators

- Combined with sort and uniq for log analysis

## Task 3: Quick-Fire Answers

### 1. What does chmod 755 script.sh do?
- Owner: read, write, execute
- Group: read, execute
- Others: read, execute

### 2. Process vs Service?
- A process is a running program instance.
- A service is a managed background process (usually controlled by systemd).

### 3. Find process using port 8080?

    sudo lsof -i :8080

or

    ss -tulnp | grep 8080

### 4. What does set -euo pipefail do?

-e → exit on error

-u → error on unset variable

-o pipefail → fail pipeline if any command fails

### 5. git reset --hard vs git revert?

- reset --hard rewrites history and deletes commits

- revert creates a new commit that undoes changes

### 6. Best branching strategy for 5 developers shipping weekly?

- GitHub Flow or simplified GitFlow with feature branches + protected main branch.

### 7. What does git stash do?

- Temporarily saves uncommitted changes so you can switch branches safely.

### 8. Schedule script daily at 3 AM?

-  0 3 * * * /path/to/script.sh

### 9. git fetch vs git pull?

- fetch downloads changes

- pull fetch + merge

### 10. What is LVM?
- Logical Volume Manager allows dynamic resizing and flexible disk management compared to fixed partitions.

## Task 4: Organization Checklist

✅ All Day 1–27 pushed

✅ git-commands.md updated

✅ Shell scripting cheat sheet updated

✅ GitHub profile cleaned & organized

## Task 5: Teach It Back

### Explaining Git Branching to a Beginner

Git branching allows developers to work on new features without affecting the main project.

Think of it like creating a copy of your project where you can safely experiment. Once your feature is complete and tested, you merge it back into the main branch.

This allows multiple developers to work in parallel without breaking production code.

Branches make collaboration safe, structured, and scalable.

## Reflection

27 days ago, I was learning concepts.
Today, I can execute, troubleshoot, and explain them.

Revision isn’t optional in DevOps — it’s survival.

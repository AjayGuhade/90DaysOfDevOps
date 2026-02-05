# Day 12 – Breather & Revision (Days 01–11)

## Goal
Pause for one day to consolidate everything learned from Days 01–11 and strengthen fundamentals before moving forward.

---

## What I Reviewed Today

### 1. Mindset & Plan (Day 01 Revisit)
- Original goal: Build strong Linux + DevOps fundamentals step by step.
- Status: ✅ On track
- Tweaks:
  - Spend more time **repeating commands**, not just reading.
  - Add **mini runbooks** after each troubleshooting task.
  - Focus on confidence with permissions and services.

---

### 2. Processes & Services 

#### Commands Re-run

    ps aux | head
    systemctl status ssh
    journalctl -u ssh --no-pager | tail

#### Observations

`ps aux` gives a quick snapshot of running processes and resource usage.

`systemctl` status is the fastest way to confirm service health.

`journalctl -u <service>` is essential for debugging failures.

---

### 3. File Skills Practice (Days 06–11)

#### Commands Practiced
    echo "Revision test" >> notes.txt
    chmod 644 notes.txt
    ls -l notes.txt
    cp notes.txt notes-backup.txt
    mkdir revision-test

#### Notes

- Permissions should always be checked after changes (ls -l).

- Copying before modifying files is a safe habit.

- Directory creation with clear naming helps organization.

---

### 4. Cheat Sheet Refresh (Day 03)

#### Top 5 Commands I’d Use First in an Incident

`ls -l` → verify permissions and ownership

`ps aux` → check running processes

`df -h` → check disk usage

`systemctl status <service>` → service health

`journalctl -xe` → recent system errors

### 5. User / Group Sanity Check 

#### Scenario Recreated

    sudo useradd tester
    sudo groupadd dev-team
    sudo usermod -aG dev-team tester
    touch testfile.txt
    sudo chown tester:dev-team testfile.txt

#### Verification
    id tester
    ls -l testfile.txt


#### ✅ Ownership and group assignment verified successfully.

## Mini Self-Check

1. Which 3 commands save you the most time right now, and why?

`ls -l` → instantly shows permission & ownership issues

`systemctl status` → quick service health check

`journalctl -u <service>` → fastest way to find root cause

2. How do you check if a service is healthy?

       systemctl status <service>
       ps aux | grep <service>
       journalctl -u <service>

4. How do you safely change ownership and permissions?

Always check first, then change.

    ls -l file.txt
    sudo chown user:group file.txt
    chmod 644 file.txt

4. What will I focus on in the next 3 days?

 - Stronger grasp of chmod numeric values

 - Writing basic troubleshooting runbooks

 - Applying Linux skills to real DevOps scenarios
    

# Linux Fundamentals – Hands-On Practice Note


## 1️⃣ Check Running Processes
### Command Used

    ps aux | head

#### What I Observed

 - A list of running processes with:

   - USER – who owns the process

   - PID – process ID

   - %CPU / %MEM – resource usage

   - COMMAND – what is running

#### System processes like:

     -systemd

     -kthreadd

     -cron

     -sshd

#### Real-Time Monitoring

     -top

#### Observation:

  - CPU and memory usage updated live

  - load average shows system load

  - Easy to spot heavy processes

✅ Learning:
Linux runs many background processes even when idle. ps gives a snapshot, top gives live view.


## 2️⃣ Inspect One systemd Service

### Check Status of SSH Service
    systemctl status ssh

#### What I Observed

 - Service state: active (running)

 -  Main PID shown

 - Logs from recent starts

 - Enabled/disabled info

#### Key Fields Explained

 - Loaded → Whether service starts at boot

 - Active → Current running state

 - Main PID → Actual process ID

#### View Service Logs
    journalctl -u ssh --no-pager | tail

#### Observation

 - Shows authentication attempts

 - Timestamped logs

 - Useful for debugging login issues

✅ Learning:
  systemctl controls services, journalctl explains why they behave the way they do.


## 3️⃣ Small Troubleshooting Flow (Fundamental)
### Scenario

👉 “Service is running, but I want to confirm it’s really working.”

#### Step 1: Is the process running?
    ps aux | grep ssh


✔ Process exists → Service is alive

#### Step 2: Is the service active?
    systemctl is-active ssh

Output:

    active

#### Step 3: Is the port listening?
    ss -tulnp | grep :22


#### Observation:

 - Port 22 is listening

 - Owned by sshd

#### Step 4: Check recent logs
    journalctl -u ssh -n 10


#### Observation:

  - No errors

 - Normal startup messages

✅ Conclusion:
Service is healthy → no issue at OS level.
  

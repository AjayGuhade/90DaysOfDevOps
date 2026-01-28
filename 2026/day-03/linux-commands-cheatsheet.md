# Linux-commands-cheatsheet

## Processes Management


### view running Processes

  ps aux  – Show all running processes (classic troubleshooting command)

  ps -ef  – Full-format listing (often used on servers)

  top  – Real-time process monitoring (CPU, memory)

  htop  – Better, interactive version of top (if installed)



### Find a Specific Process

  ps aux | grep nginx – Find process by name

  pgrep nginx – Get PID of a process

  pidof nginx – Get PID (if running)
  


### Kill / Stop Processes

  kill PID – Gracefully stop a process

  kill -9 PID – Force kill (use only if needed)

  pkill nginx – Kill process by name

  killall nginx – Kill all matching processes



### Process Priorities

  nice -n 10 command – Start process with lower priority

  renice -n 5 PID – Change priority of running process



 ### Background & Foreground Jobs

  command & – Run command in background

  jobs – List background jobs

  fg %1 – Bring job to foreground

  bg %1 – Resume job in background

  Ctrl + Z – Pause a running process

## 2. File System Commands

###  Navigation

pwd – Show current directory

ls – List files

ls -l – Long listing

ls -la – Include hidden files

cd /path – Change directory

cd .. – Go up one directory

cd ~ – Go to home directory

###  File & Directory Operations

touch file.txt – Create empty file

mkdir dir – Create directory

mkdir -p a/b/c – Create nested directories

cp file1 file2 – Copy file

cp -r dir1 dir2 – Copy directory

mv old new – Rename or move file

rm file – Delete file

rm -r dir – Delete directory

rm -rf dir – Force delete (⚠️ dangerous)

### View File Content

cat file – Show entire file

less file – Scrollable view (preferred)

head file – First 10 lines

tail file – Last 10 lines

tail -f logfile – Live log monitoring

### File Search

find /path -name file.txt – Search file by name

locate file.txt – Fast search (uses database)

grep "error" file – Search text inside file

grep -r "error" /var/log – Recursive search

### Disk Usage

df -h – Disk space usage

du -sh dir – Size of directory

lsblk – List block devices

mount – Show mounted file systems

 ### Permissions & Ownership

chmod 755 file – Change permissions

chmod +x script.sh – Make executable

chown user:group file – Change owner

ls -l – View permissions  

#  Networking Troubleshooting
### Network Information

ip a – Show IP addresses

ip r – Show routing table

hostname – Show hostname

hostname -I – Show IP address

uname -a – Kernel and system info

### Connectivity Testing

ping google.com – Check connectivity

ping -c 4 google.com – Ping 4 times

traceroute google.com – Trace network path

mtr google.com – Live traceroute (if installed)

### Port & Service Checks

ss -tulnp – Show listening ports (modern)

netstat -tulnp – Older but common

lsof -i :80 – Check what uses port 80

nc -zv host port – Check port connectivity

### DNS Troubleshooting

nslookup google.com – DNS lookup

dig google.com – Detailed DNS info

cat /etc/resolv.conf – DNS configuration

### Download & API Testing

curl http://example.com – Test HTTP endpoint

curl -I http://example.com – Headers only

wget http://example.com/file – Download file

### Firewall Basics

iptables -L – List firewall rules

ufw status – Firewall status (Ubuntu/Debian)

ufw allow 80 – Allow port 80

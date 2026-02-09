# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Goal
Understand the fundamental networking concepts every DevOps engineer must know, including DNS, IP addressing, subnetting, CIDR notation, and ports.

---

## Task 1: DNS – How Names Become IPs

### What happens when you type `google.com` in a browser?
When you enter `google.com`, your system first checks the local DNS cache.  
If not found, it queries a DNS resolver, which contacts root servers, then TLD servers, and finally the authoritative DNS server for `google.com`.  
The authoritative server returns the IP address, and the browser uses it to connect to the server.

### DNS Record Types
- **A** – Maps a domain name to an IPv4 address  
- **AAAA** – Maps a domain name to an IPv6 address  
- **CNAME** – Creates an alias from one domain to another  
- **MX** – Specifies mail servers for a domain  
- **NS** – Specifies authoritative name servers for a domain  

### Command Output

    dig google.com

Identified from output:

- A Record: 142.250.xxx.xxx (example)

- TTL: ~300 seconds (may vary)



## Task 2: IP Addressing
### What is an IPv4 address?

An IPv4 address is a 32-bit numeric identifier used to identify devices on a network.
It is written in dotted decimal format, e.g., 192.168.1.10.

### Public vs Private IP

Public IP: Routable on the internet (e.g., 8.8.8.8)

Private IP: Used inside local networks (e.g., 192.168.1.10)

### Private IP Ranges

10.0.0.0 – 10.255.255.255

172.16.0.0 – 172.31.255.255

192.168.0.0 – 192.168.255.255

### Command Output

    ip addr show

### Identified Private IP:

192.168.x.x (local network interface)


![Verify](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-15/01.png))


## Task 3: CIDR & Subnetting

### What does /24 mean in 192.168.1.0/24?

- /24 means the first 24 bits are used for the network portion, leaving 8 bits for host addresses.

Usable Hosts

- /24: 254 usable hosts

- /16: 65,534 usable hosts

- /28: 14 usable hosts

### Why do we subnet?

Subnetting helps divide large networks into smaller, manageable segments.
It improves security, reduces broadcast traffic, and optimizes IP usage.

### CIDR Table

| CIDR | Subnet Mask     | Total IPs | Usable Hosts |
| ---: | --------------- | --------- | ------------ |
|  /24 | 255.255.255.0   | 256       | 254          |
|  /16 | 255.255.0.0     | 65,536    | 65,534       |
|  /28 | 255.255.255.240 | 16        | 14           |

## Task 4: Ports – The Doors to Services
### What is a port?

A port is a logical endpoint that allows multiple services to run on a single IP address.
Ports help the OS know which application should receive incoming traffic.

### Common Ports

|  Port | Service |
| ----: | ------- |
|    22 | SSH     |
|    80 | HTTP    |
|   443 | HTTPS   |
|    53 | DNS     |
|  3306 | MySQL   |
|  6379 | Redis   |
| 27017 | MongoDB |

### Command Output
  
    ss -tulpn

![Verify](https://github.com/AjayGuhade/90DaysOfDevOps/blob/master/2026/day-15/02.png))

### Observed Listening Ports:

- `22` → SSH

- `631` → CUPS (printing service) (example)


## Task 5: Putting It Together

### curl http://myapp.com:8080 — what concepts are involved ?

DNS resolves myapp.com to an IP address.
Port 8080 directs traffic to the correct application.
TCP/IP handles packet delivery between client and server.

### App can’t reach database at 10.0.1.50:3306 — what to check first?

Check network connectivity and routing to the private IP.
Verify the database service is running and listening on port 3306.
Ensure firewall or security group rules allow access.

## What I Learned (Key Takeaways)

DNS is a multi-step resolution process that maps human-readable names to IPs.

CIDR and subnetting help efficiently manage and secure networks.

Ports allow multiple services to coexist on the same machine without conflict.

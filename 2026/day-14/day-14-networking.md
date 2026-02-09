# Day 14 – Networking Fundamentals & Hands-on Checks

## 🎯 Goal
Get comfortable with **core networking concepts** and the **commands used during real troubleshooting**.

---

## 🧠 Quick Concepts

### OSI Model (L1–L7) vs TCP/IP Model
- **OSI**: Conceptual model (Physical → Application) used for learning & debugging
- **TCP/IP**: Practical implementation used by real networks

| OSI Layer | TCP/IP Layer | Examples |
|---------|-------------|----------|
| L1–L2 | Link | Ethernet, Wi-Fi |
| L3 | Internet | IP, ICMP |
| L4 | Transport | TCP, UDP |
| L5–L7 | Application | HTTP, HTTPS, DNS, SSH |

---

### Where Common Protocols Sit
- **IP** → Internet layer
- **TCP / UDP** → Transport layer
- **DNS, HTTP, HTTPS, SSH** → Application layer

---

### Real Example
> `curl https://example.com`  
= **Application (HTTP)** → **Transport (TCP)** → **Internet (IP)** → **Link (Ethernet/Wi-Fi)**

---

## 🧪 Hands-on Networking Checklist

### 🔹 Identity – Check IP Address

    hostname -I

Observation: Displays the local machine’s IP address.

### 🔹 Reachability – Ping Target

    ping google.com -c 4


Observation: Confirms reachability, latency, and packet loss.

### 🔹 Path – Trace Network Route
 
    traceroute google.com
  
   or
 
    tracepath google.com


Observation: Shows network hops; timeouts may indicate firewalls or routing issues.

### 🔹 Ports – Check Listening Services

    ss -tulpn


Observation: Lists active listening services and their ports
(e.g., SSH listening on port 22).

### 🔹 Name Resolution – DNS Lookup

    dig google.com
  or
    nslookup google.com


Observation: Confirms DNS resolution and resolved IP address.

### 🔹 HTTP Check – Application Layer

    curl -I https://google.com


Observation: Returns HTTP status code (e.g., 200 OK).

### 🔹 Connections Snapshot

    netstat -an | head


Observation: Quick view of connection states (ESTABLISHED, LISTEN).

## 🎯 Target Host Used

All checks were performed using:

    google.com

##  🔌 Mini Task: Port Probe & Interpretation

### Identify a Listening Port

From ss -tulpn, SSH was listening on:

    Port 22

Test Port Locally

    nc -zv localhost 22


Result: Port is reachable.

If not reachable:
Next checks → service status (systemctl status ssh) or firewall rules.

## 🧠 Reflection

### - Fastest Signal When Something Is Broken

`ping` and `curl` give the quickest indication of network or app issues.


### - Which Layer to Inspect Next?

DNS fails → Application layer (DNS), then Transport

HTTP 500 error → Application layer (web server / backend)


### - Two Follow-up Checks in a Real Incident

Check firewall rules (ufw status / iptables -L)

Inspect service logs (journalctl, application logs)


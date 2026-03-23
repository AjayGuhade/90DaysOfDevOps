# Day 49 – DevSecOps: Adding Security to CI/CD Pipeline 🔐

## 🚀 Overview

Today I upgraded my CI/CD pipeline by integrating **DevSecOps practices** — adding automated security checks directly into the pipeline.

Instead of detecting vulnerabilities after deployment, my pipeline now catches issues **early during development**, making it faster and safer to ship code.

---

## 🧠 What is DevSecOps?

DevSecOps means integrating security into every stage of the CI/CD pipeline.  
It ensures vulnerabilities are detected and fixed early, rather than after deployment.

---

## 🔧 What I Implemented

### ✅ 1. Docker Image Vulnerability Scanning (Trivy)

- Added Trivy to scan Docker images for vulnerabilities
- Pipeline fails if **HIGH or CRITICAL** issues are found

- name: Scan Docker Image for Vulnerabilities
  uses: aquasecurity/trivy-action@master
  with:
    image-ref: 'your-dockerhub-username/your-image:latest'
    format: 'table'
    exit-code: '1'
    severity: 'CRITICAL,HIGH'

### ✅ 2. Dependency Vulnerability Check (PR Pipeline)

Added dependency review action
Prevents merging insecure packages
- name: Check Dependencies for Vulnerabilities
  uses: actions/dependency-review-action@v4
  with:
    fail-on-severity: critical


### ✅ 3. GitHub Secret Scanning

Enabled from repository settings:

Detects leaked API keys, tokens, passwords
Push protection blocks accidental exposure

### ✅ 4. Workflow Permissions (Security Best Practice)

Restricted workflow access using least privilege:

permissions:
  contents: read

#### 🔄 Final Secure Pipeline Flow

🔹 Pull Request Workflow
Build & Test
Dependency Vulnerability Scan
PR passes/fails based on security

🔹 Main Branch Workflow
Build & Test
Docker Build
Trivy Security Scan
Docker Push (only if secure)
Deploy

🔹 Continuous Protection
Secret Scanning always active
Push Protection enabled

###  Key Learnings
- Security should be integrated into CI/CD, not added later

- Trivy helps detect real-world vulnerabilities in Docker images

- Dependency review prevents insecure libraries from entering codebase

- Secret scanning protects against accidental leaks

- Limiting permissions reduces risk if a workflow is compromised

###  Important Concepts

- Secret Scanning vs Push Protection

- Secret Scanning: Detects secrets after they are pushed

- Push Protection: Blocks the push before it happens

- Real-World Impact

### With these changes, my pipeline now:

- Automatically scans for vulnerabilities

- Blocks insecure code from being merged or deployed

- Follows modern DevSecOps practices used in production systems

### Conclusion

- Today I transformed my CI/CD pipeline into a secure DevSecOps pipeline.

- Security is no longer an afterthought — it's now an automated part of my development workflow.

#90DaysOfDevOps #DevSecOps #GitHubActions #Docker #CyberSecurity #DevOpsKaJosh
# Day 42 – GitHub Actions Runners

## GitHub Hosted Runners

Workflow:
runner-os.yml

Jobs ran on:
- ubuntu-latest
- windows-latest
- macos-latest

---

## Preinstalled Tools

Checked versions of:
- Docker
- Python
- Node
- Git

These tools come pre-installed which makes workflows faster.

---

## Self Hosted Runner

Set up a self-hosted runner on my Linux machine.

Steps:
1. Download runner
2. Configure with repo token
3. Start runner

---

## Workflow Using Self Hosted Runner

Workflow:
self-hosted.yml

The job ran on my machine and created a file.

---

## GitHub Hosted vs Self Hosted

| Feature | GitHub Hosted | Self Hosted |
|------|------|------|
| Who manages it | GitHub | You |
| Cost | GitHub minutes | Your server |
| Tools | Pre-installed | Manual install |
| Good for | Quick CI | Custom infra |
| Security | Managed by GitHub | You secure it |

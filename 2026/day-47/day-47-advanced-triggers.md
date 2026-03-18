# Day 47 – Advanced Triggers: PR Events, Cron Schedules & Event-Driven Pipelines 🚀

## 📌 Overview

Today I explored advanced GitHub Actions triggers beyond basic `push` and `pull_request`.

I built **event-driven CI/CD pipelines** using:

* PR lifecycle events
* Automated PR validation checks
* Scheduled workflows using cron
* Smart triggers (paths & branches)
* Workflow chaining (`workflow_run`)
* External triggers (`repository_dispatch`)

---

## 🔹 Task 1: PR Lifecycle Workflow

📄 `.github/workflows/pr-lifecycle.yml`

```yaml
name: PR Lifecycle

on:
  pull_request:
    types: [opened, synchronize, reopened, closed]

jobs:
  pr-info:
    runs-on: ubuntu-latest

    steps:
      - name: Print PR Info
        run: |
          echo "Event Type: ${{ github.event.action }}"
          echo "PR Title: ${{ github.event.pull_request.title }}"
          echo "PR Author: ${{ github.event.pull_request.user.login }}"
          echo "Source Branch: ${{ github.head_ref }}"
          echo "Target Branch: ${{ github.base_ref }}"

      - name: Run only if PR merged
        if: github.event.pull_request.merged == true
        run: echo "PR was merged 🎉"
```

✅ Tested:

* PR opened → workflow triggered
* PR updated → workflow triggered
* PR merged → conditional step executed

---

## 🔹 Task 2: PR Validation Workflow (CI Gate)

📄 `.github/workflows/pr-checks.yml`

```yaml
name: PR Checks

on:
  pull_request:
    branches:
      - main

jobs:
  file-size-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Check file size
        run: |
          find . -type f -size +1M && echo "Large file found!" && exit 1 || echo "OK"

  branch-name-check:
    runs-on: ubuntu-latest
    steps:
      - name: Validate branch name
        run: |
          if [[ ! "${{ github.head_ref }}" =~ ^(feature|fix|docs)/ ]]; then
            echo "Invalid branch name!"
            exit 1
          fi

  pr-body-check:
    runs-on: ubuntu-latest
    steps:
      - name: Check PR description
        run: |
          if [ -z "${{ github.event.pull_request.body }}" ]; then
            echo "⚠️ PR description is empty"
          fi
```

✅ Result:

* Invalid branch → ❌ Failed
* Large file → ❌ Failed
* Missing PR description → ⚠️ Warning

---

## 🔹 Task 3: Scheduled Workflows (Cron)

📄 `.github/workflows/scheduled-tasks.yml`

```yaml
name: Scheduled Tasks

on:
  schedule:
    - cron: '30 2 * * 1'
    - cron: '0 */6 * * *'
  workflow_dispatch:

jobs:
  schedule-job:
    runs-on: ubuntu-latest
    steps:
      - name: Print trigger
        run: echo "Triggered by: ${{ github.event.schedule }}"

      - name: Health check
        run: curl -o /dev/null -s -w "%{http_code}\n" https://example.com
```

### 🧠 Cron Expressions Learned

| Use Case                    | Cron           |
| --------------------------- | -------------- |
| Weekdays at 9 AM IST        | `30 3 * * 1-5` |
| First day of month midnight | `0 0 1 * *`    |

### ⚠️ Note

Scheduled workflows:

* Run only on default branch
* May be delayed/skipped for inactive repositories

---

## 🔹 Task 4: Path & Branch Filters

📄 `.github/workflows/smart-triggers.yml`

```yaml
name: Smart Trigger

on:
  push:
    branches:
      - main
      - 'release/*'
    paths:
      - 'src/**'
      - 'app/**'

jobs:
  run:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Triggered by code changes"
```

📄 `.github/workflows/ignore-docs.yml`

```yaml
name: Ignore Docs

on:
  push:
    paths-ignore:
      - '*.md'
      - 'docs/**'

jobs:
  skip:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Docs change ignored"
```

### 🧠 When to use what?

* `paths` → Run workflow ONLY when specific files change
* `paths-ignore` → Skip workflow when only certain files change

---

## 🔹 Task 5: Workflow Chaining (`workflow_run`)

📄 `.github/workflows/tests.yml`

```yaml
name: Run Tests

on:
  push:

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Running tests..."
```

📄 `.github/workflows/deploy-after-tests.yml`

```yaml
name: Deploy After Tests

on:
  workflow_run:
    workflows: ["Run Tests"]
    types: [completed]

jobs:
  deploy:
    runs-on: ubuntu-latest

    if: ${{ github.event.workflow_run.conclusion == 'success' }}

    steps:
      - run: echo "Deploying..."
```

### 🧠 workflow_run vs workflow_call

| Feature    | workflow_run                     | workflow_call                       |
| ---------- | -------------------------------- | ----------------------------------- |
| Trigger    | After another workflow completes | Called directly by another workflow |
| Use case   | CI → CD chaining                 | Reusable workflows                  |
| Dependency | Yes (event-based)                | Explicit call                       |

---

## 🔹 Task 6: External Trigger (`repository_dispatch`)

📄 `.github/workflows/external-trigger.yml`

```yaml
name: External Trigger

on:
  repository_dispatch:
    types: [deploy-request]

jobs:
  external:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Environment: ${{ github.event.client_payload.environment }}"
```

### 🔥 Trigger Command

```bash
gh api repos/<owner>/<repo>/dispatches \
  -f event_type=deploy-request \
  -f client_payload='{"environment":"production"}'
```

### 🧠 Use Case

External systems (Slack bots, monitoring tools, alerts) can trigger pipelines dynamically.

---

## 📸 Proof of Work

* PR checks executed successfully
* Scheduled workflow configured
* Workflow chaining tested

(Add screenshots here)

---

## 🚀 Key Takeaways

* GitHub Actions is **event-driven**, not just push-based
* PR validation acts as a **quality gate**
* Cron jobs enable **automation without manual triggers**
* Workflow chaining builds **real CI/CD pipelines**
* External triggers integrate with **real-world systems**

---

## 🔗 Repository Structure

```
2026/day-47/
  ├── day-47-advanced-triggers.md
.github/workflows/
  ├── pr-lifecycle.yml
  ├── pr-checks.yml
  ├── scheduled-tasks.yml
  ├── smart-triggers.yml
  ├── ignore-docs.yml
  ├── tests.yml
  ├── deploy-after-tests.yml
  ├── external-trigger.yml
```

---

🔥 Day 47 complete — moving closer to production-grade DevOps systems.

#90DaysOfDevOps #DevOps #GitHubActions #CICD

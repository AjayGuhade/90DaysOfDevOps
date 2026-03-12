# Day 40 – First GitHub Actions Workflow

## Overview

Today I created my **first GitHub Actions CI pipeline**.  
Whenever code is pushed to the repository, GitHub automatically runs a workflow in the cloud using a runner.

This workflow checks out the code and executes a series of commands.

---

# Workflow YAML

    name: First Workflow

    on: push

    jobs:
      greet:
        runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Say Hello
        run: echo "Hello from GitHub Actions!"

      - name: Show Date
        run: date

      - name: List Files
        run: ls -la

      - name: Show Runner OS
        run: uname -a


## Workflow Explanation

    on:

Defines when the workflow should run.

Example:

    on: push

This means the workflow runs every time code is pushed to the repository.

    jobs:

Defines the tasks that will run in the workflow.

A workflow can have multiple jobs that run sequentially or in parallel.

Example:

    jobs:
      greet:
        runs-on:

Specifies the environment where the job runs.

Example:

    runs-on: ubuntu-latest

GitHub creates a temporary Ubuntu virtual machine (runner) to execute the job.

    steps:

A job is divided into steps.
Each step runs one command or action.

Steps execute one after another.

    uses:

Runs a pre-built GitHub Action created by GitHub or the community.

Example:

    uses: actions/checkout@v4

This action downloads the repository code into the runner.

    run:

Executes shell commands on the runner.

Example:

    run: echo "Hello from GitHub Actions!"
    name: (step name)

Provides a readable label for each step in the workflow logs.

Example:

    name: Checkout Repository

This helps identify what each step is doing.

## Pipeline Run Result

1 . After pushing the workflow file to GitHub:

2 . The workflow was automatically triggered.

3 . GitHub created an Ubuntu runner.

4 . Each step executed sequentially.

5 . The pipeline completed successfully.

A green checkmark (✔) appeared in the GitHub Actions tab indicating a successful run.

Failed Pipeline Test

To understand failures, I intentionally added a step that caused the workflow to fail:

- name: Break the pipeline
  run: exit 1

This resulted in a failed pipeline (❌) in the GitHub Actions tab.

By clicking the failed job, I could see the exact step and error logs that caused the failure.

After removing the failing step and pushing again, the pipeline ran successfully.

## What I Learned

- GitHub Actions automates workflows when events occur (like pushing code).

- Each workflow runs inside a temporary cloud runner.

- Workflows are defined using YAML files.

- Pipelines provide clear logs for debugging failures.

- CI/CD helps automate repetitive development tasks.

## Repository Structure

    github-actions-practice
    │
    .github
       └── workflows
         └── hello.yml



#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham
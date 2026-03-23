# Day 48 – PR Pipelines with Reusable Workflows
## Overview

On Day 48, I implemented a Pull Request (PR) pipeline using reusable workflows in GitHub Actions.

This simulates real-world CI pipelines where every PR is automatically validated before merging into the main branch.

## Objective

Trigger workflows on PR events

Reuse existing workflow logic

Ensure code quality before merging

Follow production-level CI/CD practices

## Workflow File
    .github/workflows/pr-pipeline.yml


    name: PR Pipeline

    on:
      pull_request:
        branches: [main]
        types: [opened, synchronize]

    jobs:
      build-test:
        uses: ./.github/workflows/reusable-build-test.yml
        with:
          python_version: "3.10"
          run_tests: true

## Reusable Workflow

This workflow calls a reusable workflow:

    .github/workflows/reusable-build-test.yml

## Key Features:

- Accepts inputs like Python version

- Runs build and tests

- Promotes DRY (Don't Repeat Yourself) principle

## How It Works

Developer creates a PR to main

GitHub Actions triggers the PR pipeline

Reusable workflow is executed

Code is built and tested automatically

PR is validated before merge

## Key Learnings

- PR Events: Trigger workflows on PR lifecycle events

- Reusable Workflows: Avoid duplication in CI pipelines

- Automation: Validate code before merging

- Best Practice: Keep CI logic modular and scalable

## Output

✅ Automated PR validation pipeline

✅ Reusable workflow integration

✅ Clean and modular CI structure
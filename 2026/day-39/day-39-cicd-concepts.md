
# Day 39 – CI/CD Concepts

## 1. The Problem (Before CI/CD)

Imagine a team of 5 developers pushing code to the same repository and deploying manually.

### What can go wrong?

- Developers may overwrite each other's code.

- Bugs may reach production because code isn't tested automatically.

- Different environments may behave differently.

- Deployment steps may be forgotten or done incorrectly.

- Manual deployments are slow and error-prone.

What does “It works on my machine” mean?

This phrase means that code works correctly on the developer's local system but fails in another environment such as staging or production.

This happens because of:

- Different operating systems

- Missing dependencies

- Different environment variables

- Different library versions

- CI/CD helps by running code in a standardized environment automatically.

How many times can a team safely deploy manually?

Manual deployments are risky and slow, so most teams can deploy only once per day or even once per week safely.

CI/CD allows teams to deploy multiple times per day safely.

## 2. CI vs CD
Continuous Integration (CI)

Continuous Integration is the practice of frequently merging code changes into a shared repository, where automated tests and builds run to verify the code.

CI helps detect:

- integration conflicts

- build failures

- broken tests

Example

A developer pushes code to GitHub → automated tests run → build is verified.

Continuous Delivery

Continuous Delivery ensures that code changes are automatically prepared and ready for production, but deployment requires manual approval.

It guarantees the application is always in a deployable state.

Example

Code passes tests → Docker image is built → application is deployed to staging → team manually approves production release.

Continuous Deployment

Continuous Deployment goes one step further — every successful change is automatically deployed to production without manual approval.

Example

Code pushed → tests pass → build succeeds → app is automatically deployed to production.

Companies like Netflix and Amazon use this model.

## 3. Pipeline Anatomy

### Trigger

A trigger starts the pipeline.

Examples:

- pushing code to GitHub

- opening a pull request

- scheduled job

- manual trigger

- Stage

A stage is a logical phase of the pipeline.

Common stages:

- Build

- Test

- Security Scan

- Deploy

Job

A job is a set of tasks executed inside a stage.

Example:

Test stage might have jobs like:

- unit tests

- integration tests

Step

A step is a single command executed inside a job.

Example:

    npm install
    npm test
    docker build .

Runner

A runner is the machine that executes the pipeline jobs.

Examples:

- GitHub Actions Runner

- Jenkins Agent

- GitLab Runner

Artifact

An artifact is the output produced by a pipeline job.

Examples:

- compiled binaries

- Docker images

- test reports

- build packages

Artifacts are passed to later stages.

## 4. CI/CD Pipeline Diagram

Example scenario:

Developer pushes code → app is tested → Docker image built → deployed to staging.

    Developer Pushes Code
        │
        ▼
    GitHub Repository
        │
        ▼
      CI Pipeline Triggered
        │
    ┌───────────────┐
    │   Stage 1     │
    │     Build     │
    │ Install deps  │
    │ Compile code  │
    └───────────────┘
        │
        ▼
    ┌───────────────┐
    │   Stage 2     │
    │     Test      │
    │ Unit tests    │
    │ Integration   │
    └───────────────┘
        │
        ▼
    ┌───────────────┐
    │   Stage 3     │
    │ Docker Build  │
    │ Build image   │
    │ Push to repo  │
    └───────────────┘
        │
        ▼
    ┌───────────────┐
    │   Stage 4     │
    │   Deploy      │
    │ Deploy to     │
    │ staging       │
    └───────────────┘

You can also draw this on paper and upload a photo for LinkedIn.

5. Explore in the Wild (Example: FastAPI Repo)

Repository explored:

    https://github.com/tiangolo/fastapi

Folder checked:

    .github/workflows/

Example workflow file:

    tests.yml
What triggers it?

Push events

Pull requests

How many jobs does it have?

Typically 1–3 jobs depending on the workflow.

Example jobs:

- test

- lint

- build

What does it do?

The workflow:

- installs dependencies

- runs tests

- checks code quality

- ensures the project builds successfully

This ensures new code changes do not break the project.
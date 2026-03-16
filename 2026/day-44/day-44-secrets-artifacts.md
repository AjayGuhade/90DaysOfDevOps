# Day 44 – Secrets, Artifacts & Running Real Tests in CI

Today I learned how CI pipelines securely handle secrets, store artifacts, and run real tests.

---

## GitHub Secrets

Secrets store sensitive values securely.

Examples:
- API keys
- Docker credentials
- Cloud tokens

Usage:

${{ secrets.SECRET_NAME }}

GitHub masks secrets in logs automatically.

Example output:

***

Never print secrets in CI logs because they could expose credentials.

---

## Artifacts

Artifacts store files generated during workflow runs.

Examples:
- test reports
- build outputs
- logs
- coverage reports

Upload artifact:

actions/upload-artifact

Download artifact:

actions/download-artifact

Artifacts allow sharing files between jobs.

---

## Running Tests in CI

Steps:

1. Checkout repository
2. Install dependencies
3. Run test script

If the script exits with a non-zero status:

Pipeline fails.

---

## Caching

Caching speeds up CI builds.

Example cached items:

- pip dependencies
- node_modules
- build dependencies

Stored in GitHub's workflow cache storage.

Second workflow runs are significantly faster.

---

#90DaysOfDevOps
#DevOps
#GitHubActions
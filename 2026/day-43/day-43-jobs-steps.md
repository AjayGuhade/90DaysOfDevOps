# Day 43 – Jobs, Steps, Env Vars & Conditionals

## Today I learned how to control the flow of a GitHub Actions pipeline using:

- Multiple jobs
- Job dependencies
- Environment variables
- Job outputs
- Conditional execution

---

## Multi Job Workflows

Jobs can run sequentially using `needs`.

Example:

build → test → deploy

Environment Variables

Environment variables can be defined at three levels:

Workflow Level
Job Level
Step Level

Example:

env:
 
    APP_NAME: myapp

Access using:

    $APP_NAME

GitHub context variables provide metadata such as:

    ${{ github.sha }}
    ${{ github.actor }}

Job Outputs

Jobs can pass data to other jobs using outputs.

Example:

    echo "today=$(date)" >> $GITHUB_OUTPUT

Access output in another job:

    ${{ needs.generate-date.outputs.today }}

Why pass outputs?

Outputs allow jobs to share information such as:

- build versions

- artifact names

- timestamps

- environment info

This enables complex pipelines where later jobs depend on earlier results.

Conditionals

GitHub Actions allows conditional execution using if.

Examples:

Run step only on main branch

if: github.ref == 'refs/heads/main'

Run if previous step failed

if: failure()

Allow step to fail without stopping workflow

continue-on-error: true
Key Takeaways

needs: controls job order

outputs: passes data between jobs

env: manages environment variables

if: enables conditional execution

These features allow building intelligent CI/CD pipelines.

#90DaysOfDevOps
#DevOps
#GitHubActions
# Day 46 – Reusable Workflows & Composite Actions

🔹 What is a reusable workflow?

A reusable workflow is a GitHub Actions workflow that can be called by other workflows using workflow_call.
It helps avoid duplication and standardizes CI/CD across repos.

🔹 What is workflow_call?

A trigger that allows a workflow to be invoked by another workflow instead of running on events like push/pull.

🔹 Difference: Reusable Workflow vs Action

Reusable Workflow → called at job level

Action (uses:) → called at step level

## What I Learned

- Created reusable workflows using workflow_call
- Passed inputs and secrets securely
- Generated outputs and consumed them in caller workflows
- Built a custom composite GitHub Action

## Key Concepts

- Reusable workflows reduce duplication
- Composite actions simplify repeated steps
- Outputs help pass data between jobs/workflows

## Comparison

| Feature | Reusable Workflow | Composite Action |
|--------|-----------------|----------------|
| Triggered by | workflow_call | uses |
| Jobs | Yes | No |
| Steps | Yes | Yes |
| Location | .github/workflows | .github/actions |
| Secrets | Yes | No |
| Use Case | Full pipelines | Small reusable logic |

## Outcome

- Built production-level reusable CI pipeline
- Learned how DevOps teams scale workflows
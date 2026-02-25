# Day 25 – Git Reset vs Revert & Branching Strategies

## Task 1: Git Reset — Hands-On

### 🔹 Experiment Setup

Created 3 commits:

 Commit A

 Commit B

 Commit C

### 🔹`git reset --soft HEAD~1`

What happened?

- Commit C was removed from history.

- Changes from Commit C stayed in the staging area.

- Files were ready to commit again.

✅ Nothing was lost. Only commit history moved back.

### 🔹 `git reset --mixed HEAD~1`

What happened?

- Commit removed from history.

- Changes moved to working directory.

- Files were NOT staged.

✅ Changes still exist but need git add again.

### 🔹`git reset --hard HEAD~1`

What happened?

- Commit removed.

- Changes deleted from staging area.

- Changes deleted from working directory.

❌ Changes were permanently lost.

### Difference Between --soft, --mixed, and --hard

| Option    | Commit History | Staging Area         | Working Directory |
| --------- | -------------- | -------------------- | ----------------- |
| `--soft`  | Moves back     | Keeps staged changes | Keeps changes     |
| `--mixed` | Moves back     | Unstages changes     | Keeps changes     |
| `--hard`  | Moves back     | Removes staged       | Deletes changes   |


Which One Is Destructive?

 - git reset --hard is destructive because it deletes changes permanently.

When To Use Each?

- --soft → Fix last commit message or combine commits.

- --mixed → Unstage files but keep changes.

- --hard → Completely discard changes (be very careful).

Should You Use Reset on Pushed Commits?

No.

- It rewrites history and breaks collaboration.

- Only use on local, unpushed commits.

## Task 2: Git Revert — Hands-On

### 🔹 Setup

Created:

 Commit X

 Commit Y

 Commit Z

Ran:

    git revert <commit-Y-hash>

What Happened?

- A new commit was created.

- It reversed the changes introduced in Commit Y.

- Commit Y is still visible in history.

Is Commit Y Still in History?

Yes.

Git created a new commit that undid Y instead of deleting it.

### Reset vs Revert Difference

| Feature                   | `git reset` | `git revert` |
| ------------------------- | ----------- | ------------ |
| Rewrites history?         | Yes         | No           |
| Safe for shared branches? | No          | Yes          |
| Creates new commit?       | No          | Yes          |
| Deletes commits?          | Yes         | No           |

Why Revert Is Safer?

- Because it does NOT rewrite history.
- It simply adds a new commit that cancels previous changes.

Perfect for shared branches like main.

🧠 When To Use?

- reset → Local cleanup before pushing.

- revert → Undo changes in shared branches.

##  Task 3: Reset vs Revert — Summary

| Feature                      | git reset                     | git revert                             |
| ---------------------------- | ----------------------------- | -------------------------------------- |
| What it does                 | Moves branch pointer backward | Creates new commit that undoes changes |
| Removes commit from history? | Yes                           | No                                     |
| Safe for shared branches?    | No                            | Yes                                    |
| When to use                  | Local cleanup                 | Undo pushed commits safely             |

##  Task 4: Branching Strategies

### GitFlow

How It Works

Uses multiple long-lived branches:

main

develop

feature/*

release/*

hotfix/*

### Flow Diagram

     main ────────────────●───────────●
        \ 
       develop ────●────●────●
          \        \
         feature   release

Used In

- Large teams with scheduled releases.

### Pros

- Structured

- Good for versioned releases

### Cons

- Complex

- Slower for fast startups

### GitHub Flow

How It Works

- Single main branch

- Create feature branch

- Pull request

- Merge to main

📊 Flow
      
    main ───●────●────●
             \
            feature ──●──→ merge

Used In

- Startups & SaaS products deploying continuously.

Pros

- Simple

- Fast

- CI/CD friendly

Cons

- Not ideal for heavy release cycles

### Trunk-Based Development

How It Works

- Everyone commits to main

- Short-lived branches (1–2 days max)

📊 Flow

    main ──●─●─●─●─●─●
          ↑  ↑  ↑
      small frequent commits
      
Used In

- High-performing DevOps teams.

Pros

- Fast delivery

- Less merge conflict

Cons

- Requires strong CI/CD

- Needs disciplined team

## Strategy Answers

- Startup shipping fast? → GitHub Flow or Trunk-Based

- Large team with scheduled releases? → GitFlow

- Many open-source projects (like Linux & Kubernetes) use a variation of Trunk-Based Development.

## Task 5: Git Commands Reference (Days 22–25)

### Setup & Config

    git config --global user.name "Your Name"
    git config --global user.email "your@email.com"
    git init

### Basic Workflow
   
    git status
    git add .
    git commit -m "message"
    git log
    git diff

### Branching

    git branch
    git branch feature-name
    git checkout feature-name
    git switch feature-name

### Remote

    git clone <url>
    git remote -v
    git push origin main
    git pull origin main
    git fetch

### Merging & Rebasing
 
    git merge branch-name
    git rebase branch-name
### Stash & Cherry Pick

    git stash
    git stash pop
    git cherry-pick <commit-hash>

### Reset & Revert

    git reset --soft HEAD~1
    git reset --mixed HEAD~1
    git reset --hard HEAD~1
    git revert <commit-hash>

## Final Learning

-- Reset rewrites history.

-- Revert preserves history.

-- Branching strategy depends on team size & release model.

-- Never rewrite public history.

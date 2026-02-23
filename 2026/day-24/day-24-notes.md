# Day 24 – Advanced Git: Merge, Rebase, Stash & Cherry Pick

## Today I practiced advanced Git workflows that are used in real-world DevOps and software teams.

### 🔀 Task 1: Git Merge — Hands-On

#### 🟢 Fast-Forward Merge

- What I Did

  - Created branch: `feature-login`
  - Added 2 commits
  - Switched back to `main`
  - Ran:

        git merge feature-login

- What Happened?

  Git performed a fast-forward merge.

#### ✅ What is a Fast-Forward Merge?

- A fast-forward merge happens when:

  - main has no new commits after branch creation.
  - Git simply moves the pointer forward.
  - No extra merge commit is created.

👉 History stays linear.

#### 🔵 Merge Commit Scenario

- What I Did

  - Created branch: `feature-signup`
  - Added commits
  - Added a new commit on `main`
  - Then merged feature-signup

- What Happened?

  Git created a merge commit.

#### ✅ When Does Git Create a Merge Commit?

- When both branches have new commits.

- Git combines histories.

- A new merge commit is created to join them.

#### 🔴 Merge Conflict

- What is a Merge Conflict?

  A merge conflict happens when:

   - The same line of the same file is modified in two branches.

   - Git cannot decide which change to keep.

Git marks conflict like this:

    <<<<<<< HEAD
    Main branch code
    =======

    Feature branch code

    >>>>>>> feature-branch

You must manually resolve it and commit again.

### 🔁 Task 2: Git Rebase — Hands-On

What I Did

- Created feature-dashboard

- Added 2–3 commits

- Added a new commit on main

- Switched to feature-dashboard

- Ran:

      git rebase main

#### ✅ What Does Rebase Actually Do?

Rebase:

- Takes your branch commits

- Re-applies them on top of the latest main

- Rewrites commit history

- It creates new commit hashes.

#### 📊 History Comparison

Merge History

- Shows branching structure

- Has merge commits

- Non-linear history

Rebase History

- Clean and linear

- Looks like everything happened in sequence

- No extra merge commit

Command used:

    git log --oneline --graph --all

### Why You Should NEVER Rebase Shared Commits

Rebase rewrites commit history.

If commits are:

- Already pushed

- Being used by teammates

Rebasing will:

- Change commit hashes

- Cause serious conflicts for others

### Rule: Never rebase public/shared branches.

When to Use Rebase vs Merge?
- Use Rebase	Use Merge
- Cleaning up local branch	Preserving history
- Before opening PR	Working in shared branches
- Making history linear	When team collaboration matters

### 🧱 Task 3: Squash Merge vs Regular Merge

🔹 Squash Merge

    git merge --squash feature-profile

What Happened?

 - All commits combined into ONE commit.

 - Only one new commit added to main.

✅ What Does Squash Do?

 - Combines multiple commits into one.

 - Cleaner history.

 - Removes small fixes like "typo fix".

🔹 Regular Merge

    git merge feature-settings

 What Happened?

- All commits preserved.

- Merge commit created.

- Full history maintained.

#### 🧠 Trade-Off of Squashing

Squash	Regular Merge

Clean history	Full traceability

One commit only	All commits preserved

Easier to read	More detailed history


##### Use squash when:

Feature has many small messy commits.

### 📦 Task 4: Git Stash — Hands-On

#### What I Did

Modified a file without committing

Tried switching branches → Git stopped me

Used:

    git stash

What is Git Stash?

    Git stash:

Saves uncommitted work temporarily

Cleans working directory

Allows branch switching

## Stash Commands Practiced

    git stash push -m "login work in progress"
    git stash list
    git stash pop
    git stash apply stash@{0}

## 🔎 Difference: stash pop vs stash apply

stash pop	stash apply
Applies and removes stash	Applies but keeps stash
One-time use	Reusable stash
When Is Stash Used in Real Life?

Urgent production bug appears

You are mid-feature

Need to switch quickly without committing half-done work

### 🍒 Task 5: Cherry Pick

#### What I Did

Created feature-hotfix

Made 3 commits

Switched to main

Picked only the 2nd commit:

    git cherry-pick <commit-hash>

#### ✅ What Does Cherry Pick Do?

Cherry-pick:

Copies a specific commit

Applies it to another branch

Does NOT merge entire branch

🛠 When Is Cherry Pick Used?

Urgent hotfix needed in production

Only one specific fix required

Backporting bug fixes

#### ⚠️ What Can Go Wrong?

Duplicate commits

Conflicts

Confusing history

Harder debugging later

#### 📌 Final Observations

Today I learned:

Merge preserves history.

Rebase rewrites history.

Squash keeps history clean.

Stash helps in emergency context switching.

Cherry-pick applies specific commits only.

These are advanced Git tools used daily in real DevOps workflows.

## 🚀 Commands Added to git-commands.md

    git merge branch-name
    git merge --squash branch-name
    git rebase main
    git stash
    git stash list
    git stash pop
    git stash apply stash@{n}
    git cherry-pick <commit-hash>
    git log --oneline --graph --all

    

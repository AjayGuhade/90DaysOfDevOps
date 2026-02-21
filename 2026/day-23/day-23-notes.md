# Day 23 – Git Branching & Working with GitHub

## 🔹 Task 1: Understanding Branches

### 1️⃣ What is a branch in Git?

- A branch in Git is a separate line of development.
  It allows you to work on new features or fixes without affecting the main codebase.

- Each branch points to a commit and moves forward when new commits are added.

### 2️⃣ Why do we use branches instead of committing everything to main?

We use branches because:

  - To prevent breaking the main (production) code

  - To develop features independently

  - To work in teams without conflicts

  - To test changes safely

In real projects, developers never work directly on main.

### 3️⃣ What is HEAD in Git?

HEAD is a pointer that refers to the current active branch.

When you commit, Git adds the commit to the branch where HEAD is pointing.

Example:
If you are on feature-1, HEAD points to feature-1.

### 4️⃣ What happens when you switch branches?

When you switch branches:

 - Git updates your working directory

 - Files change to match the selected branch

 - Commits from other branches disappear (until you switch back)

Each branch has its own snapshot of files.

## 🔹 Task 2: Branching Commands — Hands-On

### ✅ List all branches
    
    git branch
### ✅ Create a new branch
    
    git branch feature-1
### ✅ Switch to feature-1

    git switch feature-1

OR

    git checkout feature-1


### ✅ Create and switch in one command

    git switch -c feature-2

OR (old way)

    git checkout -b feature-2
    
### ✅ Difference: git switch vs git checkout

    git switch → used only for switching branches (safer & clearer)

    git checkout → older command, used for branches AND files

Modern Git recommends git switch.

### ✅ Make a commit on feature-1

    git switch feature-1
    echo "Feature 1 work" >> feature.txt
    git add .
    git commit -m "Added feature-1 work"

### ✅ Switch back to main

    git switch main

Now check:

    cat feature.txt

File will NOT exist on main (because commit was only on feature-1).

### ✅ Delete a branch

    git branch -d feature-2

Force delete (if not merged):

    git branch -D feature-2

## 🔹 Task 3: Push to GitHub

### ✅ Create new GitHub repo (without README)

Go to GitHub → New Repository
Do NOT initialize with README.

### ✅ Connect local repo to GitHub

    git remote add origin https://github.com/your-username/devops-git-practice.git

Verify:

    git remote -v
### ✅ Push main branch

    git push -u origin main

### ✅ Push feature-1 branch

    git push -u origin feature-1

Now both branches will be visible on GitHub.

🔹 What is the difference between origin and upstream?

    origin → your remote repository (usually your GitHub repo)

    upstream → original repository you forked from

Example:

You fork a repo →
Your copy = origin
Original repo = upstream

### 🔹 Task 4: Pull from GitHub

#### Make change directly on GitHub

Edit any file using GitHub editor → Commit changes.

Pull changes locally
git pull origin main

`🔹` Difference between git fetch and git pull

    git fetch → downloads changes but does NOT merge

    git pull → downloads AND merges automatically

So:

fetch = safe check
pull = fetch + merge

## 🔹 Task 5: Clone vs Fork

Clone a public repository

    git clone https://github.com/user/repo.git

Fork the same repository

On GitHub → Click Fork
Then clone your fork:

    git clone https://github.com/your-username/repo.git
    
🔹 Difference between clone and fork

Clone	Fork
Git command	GitHub feature
Creates local copy	Creates copy on GitHub
Used to work locally	Used to contribute to others' projects

🔹 When to use clone vs fork?

Clone → when you just want to use the project
Fork → when you want to contribute to someone else's repository

🔹 How to keep your fork updated?

Add upstream:

    git remote add upstream https://github.com/original-owner/repo.git

Fetch upstream changes:

    git fetch upstream

Merge upstream changes:

    git merge upstream/main


## What I Learned Today

- Branching prevents breaking main code

- HEAD points to current branch

- git switch is modern branch command

- origin and upstream are different remotes

- fetch is safer than pull

- fork is GitHub concept, not Git

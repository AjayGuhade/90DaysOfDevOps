# 🚀 Day 22 – Introduction to Git: Your First Repository

## Welcome to the backbone of DevOps — Git. Every CI/CD pipeline, collaboration workflow, and infrastructure repo depends on it. Today is about building strong foundations.

## 🧠 What is Git?

Git is a distributed version control system that tracks changes in your code and allows you to collaborate safely and efficiently.

## Why Git Matters in DevOps:

Tracks infrastructure changes

Enables CI/CD pipelines

Supports team collaboration

Maintains complete project history

Allows rollback if something breaks

## 🔹 Task 1: Install & Configure Git

### 1️⃣ Verify Git Installation

    git --version


### If not installed:

    sudo apt update
    sudo apt install git

### 2️⃣ Configure Identity

    git config --global user.name "Ajay Guhade"
    git config --global user.email "your-email@example.com"

### 3️⃣ Verify Configuration

    git config --list

## 🔹 Task 2: Create Your Git Project

### 1️⃣ Create Project Folder
 
    mkdir devops-git-practice
    cd devops-git-practice

### 2️⃣ Initialize Git Repository

    git init


Git creates a hidden .git/ folder.

### 3️⃣ Check Status
  
    git status


### This tells you:

Current branch

Untracked files

Staged files

Changes not staged

### 4️⃣ Explore .git/

    ls -la
    cd .git
    ls


### Inside .git/ you'll see:

HEAD

config

objects/

refs/

👉 This folder stores your entire repository history.
Delete it → Your repo stops being a Git repo.

## 🔹 Task 3: Create git-commands.md

### Create file:

    touch git-commands.md

Example Structure Inside git-commands.md

# Git Commands Reference

## Setup & Config

### git config
Used to configure Git settings.
Example:

    git config --global user.name "Ajay"

### git init
Initializes a new Git repository.
Example:

    git init

## 🔹 Task 4: Stage & Commit

### 1️⃣ Stage File

    git add git-commands.md

### 2️⃣ Check What’s Staged

    git status

### 3️⃣ Commit

    git commit -m "Initial commit: Add git-commands reference file"

### 4️⃣ View History

    git log


### Compact version:

    git log --oneline

## 🔹 Task 5: Build Commit History (IMPORTANT)

### Now repeat:

Edit git-commands.md

Add new commands (git status, git log, git diff, etc.)


### Check changes:

    git diff


Stage:

    git add .


Commit:

    
    git commit -m "Add viewing changes commands"


### Do this at least 3–4 times.

Example commit messages:

Add setup commands

Add basic workflow commands

Add viewing changes section

Update examples and formatting

### Then run:

    git log --oneline

### 🔥 Understanding the Git Workflow

🧩 Working Directory

Where you edit files normally.

🟡 Staging Area

Temporary area where you prepare changes before committing.

🟢 Repository

Where commits are permanently stored.

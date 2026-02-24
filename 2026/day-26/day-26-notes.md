📘 Day 26 – GitHub CLI: Manage GitHub from Your Terminal
🎯 Objective

Learn how to manage GitHub directly from the terminal using GitHub CLI (gh) — essential for DevOps automation and workflow scripting.

✅ Task 1: Install and Authenticate
🔹 Install GitHub CLI (Ubuntu)
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] \
https://cli.github.com/packages stable main" | \
sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update
sudo apt install gh -y

Verify:

gh --version
🔹 Authenticate
gh auth login

Options chosen:

GitHub.com

HTTPS

Login via browser

Verify login:

gh auth status
🧠 What Authentication Methods Does gh Support?

Browser-based OAuth login

Personal Access Token (PAT)

SSH authentication

GitHub Enterprise authentication

✅ Task 2: Working with Repositories
🔹 Create New Repo (Public + README)
gh repo create devops-gh-test \
  --public \
  --description "GitHub CLI practice repo" \
  --add-readme \
  --clone
🔹 Clone Repo Using gh
gh repo clone username/repo-name
🔹 View Repo Details
gh repo view devops-gh-test

Add --web to open in browser.

🔹 List All My Repositories
gh repo list
🔹 Open Repo in Browser
gh repo view --web
🔹 Delete Test Repo (Be Careful ⚠)
gh repo delete devops-gh-test
✅ Task 3: Issues
🔹 Create Issue
gh issue create \
  --title "Test Issue from CLI" \
  --body "Created using GitHub CLI" \
  --label "bug"
🔹 List Open Issues
gh issue list
🔹 View Specific Issue
gh issue view 1
🔹 Close Issue
gh issue close 1
🧠 How Can gh issue Be Used in Automation?

Auto-create issues when monitoring scripts detect failures

Generate bug reports from CI pipeline

Auto-close stale issues

Use --json output for automation workflows

Example:

gh issue list --json title,number
✅ Task 4: Pull Requests
🔹 Create Branch & Push
git checkout -b feature/cli-test
echo "CLI practice" >> test.txt
git add .
git commit -m "Add CLI test file"
git push origin feature/cli-test
🔹 Create PR from Terminal
gh pr create --fill

Or specify manually:

gh pr create \
  --title "CLI PR Test" \
  --body "Created from terminal"
🔹 List Open PRs
gh pr list
🔹 View PR Details
gh pr view 1

Check checks & status:

gh pr checks
🔹 Merge PR from Terminal
gh pr merge 1 --merge
🧠 What Merge Methods Does gh pr merge Support?

--merge → Regular merge commit

--squash → Squash commits into one

--rebase → Rebase and merge

🧠 How to Review Someone Else’s PR?
gh pr checkout 12
gh pr review 12 --approve
gh pr review 12 --comment -b "Looks good!"
gh pr review 12 --request-changes -b "Please fix tests"
✅ Task 5: GitHub Actions & Workflows (Preview)
🔹 List Workflow Runs
gh run list

For specific repo:

gh run list --repo owner/repo
🔹 View Workflow Run Status
gh run view <run-id>

Watch live logs:

gh run watch
🧠 How gh run & gh workflow Help in CI/CD?

Monitor deployments from terminal

Auto-trigger workflows

Fetch build logs for debugging

Integrate into automation scripts

Alert teams on failures

Perfect for DevOps engineers working in production systems.

✅ Task 6: Useful gh Tricks
🔹 Make Raw API Calls
gh api repos/username/repo

Useful for automation scripts.

🔹 Create Gist
gh gist create file.txt --public
🔹 Create Release
gh release create v1.0.0
🔹 Create Aliases
gh alias set prc "pr create --fill"

Now run:

gh prc
🔹 Search Repositories
gh search repos devops --limit 5
📌 Add to git-commands.md
🔷 GitHub CLI Commands
# Authentication
gh auth login
gh auth status

# Repo Management
gh repo create
gh repo list
gh repo view
gh repo delete
gh repo clone

# Issues
gh issue create
gh issue list
gh issue view
gh issue close

# Pull Requests
gh pr create
gh pr list
gh pr view
gh pr merge
gh pr review

# Actions
gh run list
gh run view
gh run watch

# Advanced
gh api
gh gist create
gh release create
gh alias set
gh search repos
🏁 Final Learning

GitHub CLI reduces browser dependency.

Enables automation-friendly GitHub management.

Critical tool for DevOps pipelines.

--json output makes scripting powerful.

Combine gh + Bash scripts = serious automation.

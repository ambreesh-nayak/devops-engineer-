

# 📝 Git Commands 

## 🔹 **Setup**

```bash
git --version                       # Check Git version
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git config --list                   # View Git configuration
```

---

## 🔹 **Start a Repository**

```bash
git init                            # Initialize new Git repository
git clone <url>                     # Clone entire repo
git clone -b <branch> <url>         # Clone specific branch
git clone --single-branch <url>     # Clone only the default branch
```

---

## 🔹 **Basic Snapshotting**

```bash
git status                          # Show changes
git add <file>                      # Stage file
git add .                           # Stage all changes
git reset <file>                     # Unstage file
git commit -m "message"             # Commit staged changes
git commit -am "message"            # Add & commit tracked files
```

---

## 🔹 **Branches**

```bash
git branch                          # List branches
git branch <name>                   # Create branch
git checkout <branch>               # Switch branch
git checkout -b <name>              # Create + switch branch
git merge <branch>                  # Merge branch into current
git branch -d <name>                # Delete branch
```

---

## 🔹 **Remote Repositories**

```bash
git remote -v                       # List remotes
git remote add origin <url>         # Add remote
git push -u origin main             # Push branch first time
git push                            # Push changes
git pull                            # Fetch + merge changes from remote
git fetch                           # Download updates (no merge)
git fetch --all                     # Fetch all branches
git pull origin <branch>            # Pull updates for a specific branch
```

---

## 🔹 **Undoing Things**

```bash
git restore <file>                  # Discard local changes
git checkout -- <file>              # (Old way) Discard changes
git reset --soft HEAD~1             # Undo last commit, keep changes staged
git reset --hard HEAD~1             # Undo last commit, discard changes
git revert <commit>                 # Create new commit undoing given commit
```

---

## 🔹 **Stash**

```bash
git stash                           # Save uncommitted changes
git stash save "message"            # Save stash with a message
git stash list                      # List stashes
git stash apply                     # Apply last stash
git stash apply stash@{2}           # Apply specific stash
git stash drop stash@{0}            # Delete specific stash
git stash pop                       # Apply + remove last stash
```

---

## 🔹 **Cherry-pick**

```bash
git cherry-pick <commit-hash>       # Apply commit from another branch
```

---

## 🔹 **Logs & Diffs**

```bash
git log                             # Commit history
git log --oneline          # Compact log
git diff                            # Show unstaged changes
git diff --staged                   # Show staged changes
```

---



---


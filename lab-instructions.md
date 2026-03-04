# Git & GitHub Lab Exercise

## about this lab
In this lab, you will practice essential Git commands including branching, committing, merging, and creating pull requests. You'll work with the organization repository and submit your work for review.

---

## Lab Setup

#### Step 1:Fork the Repository

- Start by forking the repository to your own GitHub account:
- Click on the green "Fork" button in the upper right corner

```url
https://github.com/Aviel-Amitay/linux-git-tutorial
```
### Step 2: Clone the Repository
- Clone your fork locally:

```bash
git clone https://github.com/<YOUR-USERNAME>/linux-git-tutorial.git
cd linux-git-tutorial
```
you can clone to the VM or on your PC `pro tip: use vscode`

### Step 3: Configure Your Git Identity (if not already done)
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

---

## Lab 1: Basic Branching and Committing

### Step 1: Create Your Working Branch
Create a new branch with your name. Replace `yourname` with your actual name (use lowercase, no spaces).


### Step 2: Create Your Lab 1 File
Create a new file named `yourname-lab1.txt`:


### Step 3: Answer the Linux Exercise Questions
Open the file in your text editor and answer the following questions:

**Linux Basic Questions:**
1. What command do you use to list all files in a directory (including hidden files)?
2. How do you create a new directory called "test"?
3. What command shows your current working directory?
4. How do you copy a file named "file1.txt" to "file2.txt"?
5. What command do you use to view the contents of a file?

Write your answers in the `yourname-lab1.txt` file like this:

```
Name: [Your Name]
Date: [Today's Date]

Lab 1 - Linux Basic Commands
=============================

1. Answer: 
2. Answer: 
3. Answer: 
4. Answer: 
5. Answer: 
```

### Step 4: Stage and Commit Your Changes

add and commit the changes after your review

---

## Lab 2: Advanced Branching and Merging

### Step 1: Create a New Branch from Your Current Branch
Create a second branch for Lab 2 `yourname-lab2`


### Step 2: Create Your Lab 2 File
Create a second file yourname-lab2.txt

### Step 3: Answer the Git Exercise Questions
Open the file and answer these questions:

**Git Basic Questions:**
1. What command creates a new branch?
2. How do you switch to an existing branch?
3. What's the difference between `git fetch` and `git pull`?
4. What command do you use to merge branch A into branch B?
5. How do you push your local branch to a remote repository?

Write your answers in the `yourname-lab2.txt` file:

```
Name: [Your Name]
Date: [Today's Date]

Lab 2 - Git Basic Commands
===========================

1. Answer: 
2. Answer: 
3. Answer: 
4. Answer: 
5. Answer: 
```

### Step 4: Commit Your Lab 2 Changes
add and commit the changes after review 

### Step 5: Merge Lab 2 into Lab 1 Branch
Switch back to your Lab 1 branch `yourname` and merge Lab 2 into it `yourname-lab2`

You should now see both `yourname-lab1.txt` and `yourname-lab2.txt` in your branch.

---

## Lab 3: Push and Create Pull Request

### Step 1: Push Your Branch to GitHub
Push your `yourname` branch (which now contains both labs) to the remote repository:

**Note:** If this is your first push to this branch, Git might ask you to set the upstream branch.

### Step 2: Create a Pull Request
1. Go to https://github.com/Aviel-Amitay/linux-git-tutorial
2. You should see a yellow banner suggesting to create a pull request for your recently pushed branch
3. Click the **"Compare & pull request"** button
4. Fill in the PR details:
   - **Title:** `[Your Name] - Git Lab Exercise Submission`
   - **Description:**
   ```
   ## Submission Details
   - **Student Name:** [Your Name]
   - **Branch:** yourname
   - **Labs Completed:** Lab 1 and Lab 2
   
   ## Summary
   - Created branch yourname-lab1
   - Completed Linux basic commands exercise
   - Created branch yourname-lab2
   - Completed Git basic commands exercise
   - Merged lab2 into lab1
   - Pushed to remote repository
   
   Ready for review!
   ```
5. Click **"Create pull request"**

---

## branch structure
```
*   ffffff (main) Merge PR #3: david
|\
| * 9f8e7d6 (origin/david) Merge branch 'david-lab2' into david
| |\
| | * 8e7d6c5 (origin/david-lab2) Add Lab 2 answers for David
| * | 7d6c5b4 Add Lab 1 answers for David
| |/
|/
*   eeeeee Merge PR #2: guy
|\
| * 6c5b4a3 (origin/guy) Merge branch 'guy-lab2' into guy
| |\
| | * 5b4a392 (origin/guy-lab2) Add Lab 2 answers for guy
| * | 4a39281 Add Lab 1 answers for guy
| |/
|/
* 5543210 Initial commit

```
## Common Issues and Solutions

### Issue 1: Merge conflicts
**Solution:** This shouldn't happen if you're working on your own files. If it does:
```bash
git status  # See which files have conflicts
# Edit the files to resolve conflicts
git add <resolved-files>
git commit -m "Resolve merge conflicts"
```

### Issue 2: Wrong branch
**Solution:** Check your current branch:
```bash
git branch  # Shows all branches, current one marked with *
git switch <correct-branch>
```

### Issue 3: Forgot to commit before switching branches
**Solution:** Commit or stash your changes:
```bash
git stash  # Temporarily save changes
git switch <other-branch>
git stash pop  # Restore changes when needed
```

---

## Git Commands Summary

### Basic Commands
```bash
git status                    # Check status of working directory
git branch                    # List all branches
git branch <name>             # Create new branch
git checkout <branch>         # Switch to branch
git checkout -b <branch>      # Create and switch to new branch
git add <file>                # Stage file
git commit -m "message"       # Commit staged changes
git merge <branch>            # Merge branch into current branch
git push origin <branch>      # Push branch to remote
git pull origin <branch>      # Pull and merge from remote
git fetch                     # Download changes without merging
```

### Useful Commands
```bash
git log                       # View commit history
git log --oneline             # Compact commit history
git diff                      # Show unstaged changes
git branch -d <branch>        # Delete local branch
git remote -v                 # Show remote repositories
```

---

## Grading Criteria
- **Correct branching structure** (3 points)
- **Complete answers to questions** (4 points)
- **Proper commit messages** (1 points)
- **Successful merge** (1 points)
- **Pull request creation and description** (1 points)

**Total: 100 points**

---

Good luck with your lab exercise! 🚀

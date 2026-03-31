---
id: 2026-03-31-cursor-ai-workflow
title: "Cursor AI workflow — open, instruct, review, push"
tags: [cursor, git, github, beginner]
status: verified
replicated_by: []
sandbox_ref: ""
created: 2026-03-31
last_verified: 2026-03-31
constella: false
---

## Intent

This runbook describes a repeatable way to use **Cursor** (the AI IDE) to build and change software projects, then **review** those changes and **publish** them to **GitHub**. It uses the author’s real primary workspace path **`/home/jonat/ai-stack/`** as the example. A complete beginner should be able to follow the same pattern on their own machine by swapping the path for their project folder.

## Prerequisites

- **Cursor** installed and signed in (so AI features work).
- **Git** installed and a basic idea of what a repository is (a folder whose history Git tracks).
- A **GitHub** account if you want to push to GitHub.
- **Terminal access** inside Cursor (integrated terminal is enough).
- You know where your project lives on disk. Example used here: **`/home/jonat/ai-stack/`** (a Linux path; on Windows with WSL this is inside your Linux distro, not `C:\`).

## Steps

### 1. Open the correct project folder

1. Launch **Cursor**.
2. Use **File → Open Folder…** (or **Open…** and choose a folder, not a single file).
3. Select your project’s **root directory** — the top-level folder that contains `.git` (or where you want `.git` to live).  
   - Example: open **`/home/jonat/ai-stack/`** so the AI sees the whole repo (scripts, docs, configs) in one workspace.
4. Wait for indexing to settle if Cursor shows a progress indicator. You want the AI’s file search and edits to target the right tree.

**Why this matters:** If you open a subfolder only (e.g. just `docs/`), the model may miss `AGENTS.md`, `package.json`, or backend files at the repo root and suggest wrong paths or incomplete changes.

### 2. Orient yourself in the repo (optional but recommended)

1. In the file explorer, skim the root: look for **`README.md`**, **`AGENTS.md`**, **`CONTEXT.md`**, or project-specific rules.
2. If the project documents how to run tests or the app, read that once so you can ask the AI to follow it.

For **`/home/jonat/ai-stack/`**, the repo’s own guidelines live in **`AGENTS.md`** at the repo root. Cursor may also load **workspace rules** from `.cursor/rules` if present — those are extra instructions to the AI.

### 3. Start a conversation with clear instructions

Cursor gives you several ways to work with AI; the common pattern is: **pick an input, state the goal, add constraints**.

1. **Open the AI panel** (Chat or Agent, depending on your Cursor version and layout).
2. Write instructions as if briefing a skilled teammate:
   - **Goal:** what “done” looks like (e.g. “add a script under `scripts/` that …”).
   - **Scope:** which area of the repo (e.g. “only under `runbook-to-rule-them-all/`”).
   - **Constraints:** style, tests, “don’t refactor unrelated files,” or “match existing patterns in file X.”
   - **Paths:** use **absolute paths** when possible to avoid ambiguity, e.g. **`/home/jonat/ai-stack/runbook-to-rule-them-all/scripts/new_runbook.sh`**.
3. If the task is multi-step, say so explicitly (“first scaffold, then document, then commit”) so the agent plans in order.
4. Paste **error messages** or **logs** verbatim when something fails; the model debugs much faster with real output.

**Tips for better results:**

- Ask for **small commits** or **one logical change per commit** when you plan to push to GitHub.
- Say **“read file X before editing”** when touching delicate code.
- If the project has a test command (e.g. `pytest`, `npm test`), ask the AI to **run it and fix failures** using the integrated terminal.

### 4. Let the AI make changes; watch what it touches

1. When the AI proposes edits, use the **diff / review UI** to see which files changed and what was added or removed.
2. Prefer **accepting file-by-file** or **hunk-by-hunk** if you are unsure, rather than blindly approving everything.
3. If something looks wrong, **stop** and message: “Revert X and instead do Y” — iteration is normal.

### 5. Review what it did (your responsibility)

Treat AI output as **suggested** until you verify:

1. **Read the important diffs** for files you care about (security, data, public API).
2. **Run the project’s tests or smoke checks** from the terminal, for example:

   ```bash
   cd /home/jonat/ai-stack
   python -m pytest tests/ -v
   ```

   (Adjust the command to what your repo actually documents.)

3. **Run the app or script** if that is the only way to validate behavior.
4. If the AI added new dependencies, check **`requirements.txt`**, **`package.json`**, or similar for surprises.

### 6. Commit your work with Git (inside Cursor’s terminal)

1. Open the **terminal** in Cursor (**Terminal → New Terminal** or backtick shortcut).
2. Go to the repo (or the sub-repo) you are committing:

   ```bash
   cd /home/jonat/ai-stack/runbook-to-rule-them-all
   ```

3. Check status:

   ```bash
   git status
   ```

4. Stage files:

   ```bash
   git add .
   ```

   Or stage selectively: `git add path/to/file`.

5. Commit with a **clear message**:

   ```bash
   git commit -m "docs: describe the change in one line"
   ```

6. If Git says you need `user.name` / `user.email`, configure once:

   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "you@example.com"
   ```

### 7. Push changes to GitHub

**First time for this folder** (no `origin` yet):

1. Create an **empty** repository on GitHub (no README if you already have one locally) — e.g. repository name **`runbook-to-rule-them-all`** under your user **`Nightmarejam`**.
2. In the project directory:

   ```bash
   cd /home/jonat/ai-stack/runbook-to-rule-them-all
   git remote add origin https://github.com/Nightmarejam/runbook-to-rule-them-all.git
   git branch -M main
   git push -u origin main
   ```

3. If `git push` asks for credentials, use a **Personal Access Token** (HTTPS) or set up **SSH keys** and use an `git@github.com:…` remote instead. Cursor’s terminal uses the same Git as your system.

**Subsequent pushes:**

```bash
cd /home/jonat/ai-stack/runbook-to-rule-them-all
git push
```

For the **parent monorepo** at **`/home/jonat/ai-stack/`**, `cd` there instead and push that repo’s `origin` the same way.

## Verification

- **`git status`** shows a clean working tree after commit (or only intentional unstaged files).
- **`git log -1 --oneline`** shows your latest commit.
- On GitHub, the branch (**`main`**) shows the new commit after **`git push`**.
- Any tests or manual checks you defined in **Steps 5** pass.

## Known failure modes

- **Wrong folder open in Cursor** — AI edits the wrong project or creates files outside your intent. Fix: **File → Open Folder** on the repo root; close extra windows if confused.
- **Push rejected** — often branch behind remote; run **`git pull --rebase`** (or merge) then push again, after understanding what changed on the remote.
- **Authentication failures** — HTTPS needs a valid token; SSH needs `ssh-agent` and a key added to GitHub.
- **Sub-repo vs monorepo** — **`/home/jonat/ai-stack/runbook-to-rule-them-all/`** can be its **own** git repository nested inside **`/home/jonat/ai-stack/`**. Commit and push **from the directory that contains the `.git` you intend**, or you will accidentally only record changes in one layer.

## Notes

- Cursor’s exact UI labels (Chat vs Composer vs Agent) evolve; the **workflow** stays the same: **open correct workspace → instruct clearly → review diffs → verify → commit → push**.
- Keeping **`AGENTS.md`** (or similar) accurate makes future AI sessions behave more consistently for **`/home/jonat/ai-stack/`**.
- When automating GitHub repo creation from a headless environment, **`gh repo create`** (GitHub CLI) or the **GitHub API** with a token is typical; interactive push from your laptop after `git remote add` is the manual fallback.

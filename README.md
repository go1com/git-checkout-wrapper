Awesome, Trúc! Here's your polished `README.md` for the `git-checkout-wrapper` repo — professional, beginner-friendly, and ready for your team to use 🚀

---

### 📄 `README.md`

```md
# 🚀 Git Checkout Wrapper for Jira Branch Naming

This is an internal CLI wrapper that enhances `git checkout -b` with a smart, interactive flow for creating Jira-linked branches and commit messages — fast, consistent, and team-friendly.

---

## ✨ Features

✅ Choose branch type: `feat`, `bug`, `spike`, or `task`  
✅ Auto-create branch using your GitHub username & ticket ID  
✅ Auto-generate an **empty commit** with Jira link  
❌ No temporary files  
✅ Installs in one line

---

## 🧩 Branch Naming Convention

When you run:

```bash
git checkout -b
```

You’ll be prompted for:

- **Branch type**: e.g. `feat`, `bug`
- **Jira ticket**: e.g. `PANDA-123`
- **Short description**: e.g. `Fix login bug`

And it will create:

```
feat/your-username/PANDA-123_fix-login-bug
```

Along with an empty commit:

```
PANDA-123: Fix login bug

Related ticket: https://yourcompany.atlassian.net/browse/PANDA-123
```

---

## ⚙️ 1-Line Install (Recommended)

Paste this in your terminal:

```bash
curl -s https://raw.githubusercontent.com/your-org/git-checkout-wrapper/main/install-wrapper.sh | bash
```

---

## 🛠 Manual Setup (Advanced)

1. Clone the repo:

```bash
git clone git@github.com:your-org/git-checkout-wrapper.git ~/.git-checkout-wrapper
cd ~/.git-checkout-wrapper
```

2. Create your `.env` file from the example:

```bash
cp .env.example .env
```

3. Add this line to your shell config:

```bash
# For zsh
echo "alias git='~/.git-checkout-wrapper/git-checkout-wrapper.sh'" >> ~/.zshrc
source ~/.zshrc

# For bash
echo "alias git='~/.git-checkout-wrapper/git-checkout-wrapper.sh'" >> ~/.bashrc
source ~/.bashrc
```

---

## 🧪 Example Run

```bash
git checkout -b
```

```
📦 Choose branch type (default: feat):
1) feat
2) bug
3) spike
4) task
Type #: 1
🪪 Jira Ticket ID (e.g., PANDA-123): PANDA-456
📝 Short description: Fix checkout error
✅ Creating branch: feat/truc/PANDA-456_fix-checkout-error
✅ Created empty commit with message.
```

---

## 🧼 Maintainers

If you update the script:

```bash
cd ~/.git-checkout-wrapper
git pull origin main
```

Or just rerun the installer to refresh everything 🔄

---

Let’s standardize branches and ship faster 🚀  
Made with 💛 by Trúc
```

---

All set! Let me know if you want this packaged into a `.zip`, or help deploying it on a private repo with `README`, scripts, and everything bundled 👩‍💻
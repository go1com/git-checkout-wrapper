# 🚀 Git Checkout Wrapper

Simplifies Git branch names and commit messages using Jira tickets.

---

## 🛠 Usage

```bash
git checkout -b
```
Prompts you to:
- Select type (`feat`, `bug`, etc.)
- Enter ticket ID (e.g. `GO1-123`)
- Write a short description

Creates:
```
feat/yourname/GO1-123_fix-login
```
And a commit:
```
GO1-123: Fix login

Related ticket: https://go1web.atlassian.net/browse/GO1-123
```

---

## ⚙️ Install

```bash
curl -s https://raw.githubusercontent.com/go1com/git-checkout-wrapper/main/install-wrapper.sh | bash
```

You'll be prompted to enter your Jira base URL (e.g. `https://go1web.atlassian.net`) during setup.

---

## 🧹 Uninstall

```bash
curl -s https://raw.githubusercontent.com/go1com/git-checkout-wrapper/main/uninstall-wrapper.sh | bash
```

Made with 💛 by Trúc


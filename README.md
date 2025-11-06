# 💻 MacOS setup

## ⚙️ Migration

```
# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

```
# Clone dotfiles repo and link files
git clone git@github.com:katafractari/dotfiles.git
cd dotfiles
./bootstrap.sh
```

```
# Install software
brew bundle --global
sudo brew services start asimov
```
## ⦾ Commands

| Name       | Description             |
|------------|-------------------------|
| eza        | Better `ls`             |
| btop       | Better `htop`           |
| lazygit    | TUI for `git`           |
| lazydocker | TUI for `docker`        |
| fastfetch  | Show pretty system info |
| fd         | Better `find`           |
| rg         | Better `grep`           |
| nvim       | Better `vim`            |
| fzf        | TUI for `grep`          |
| gping      | TUI for `ping`          |

## Special dotfiles

Below is a list of dotfiles that are not tracked in this repository, mostly for security reasons.

- `.hammerspooon/config.json`
- `.ssh/config`
- `.gitconfig.personal`
- `.gitconfig.work`
- `.idasen/linak-controller`

## ⏳ Time machine

Before backing up to Time Machine

- Check that asimov is running
- Exclude virtual machine drives

Check if a file or directory is excluded:
```
tmutil isexcluded <file/directory>
```

## MacOS Defaults

https://github.com/kevinSuttle/macOS-Defaults

## Extra Fonts

Fonts used: https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k

## Installing Git Pre-commit Hook for Secret Prevention

To prevent accidentally committing secrets to git, install the gitleaks pre-commit hook:

1. **Install gitleaks** (if not already installed):
   ```bash
   brew install gitleaks
   ```

2. **Install the pre-commit hook** in this repository:
   ```bash
   ./install-gitleaks-hook.sh
   ```

The hook will automatically scan staged files for secrets before each commit and block the commit if any are found. This provides an extra layer of protection beyond Bruno's secret marking feature.

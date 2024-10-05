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

### eza

A better `ls`.

### btop

A better `htop`.

### lazygit

A git TUI.

### lazydocker

A docker TUI.

### fastfetch

Show pretty system information.

### fd

A better `find`.

### rg

A better `grep`.

### nvim

A better `vim`.

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

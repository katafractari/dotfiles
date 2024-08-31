#!/bin/zsh

dotfiles=(.nvim .ideavimrc .p10k.zsh .macos .Brewfile .zshrc .config/kitty/kitty.conf .alacritty.yml .fzf.zsh .gitconfig .gitconfig.kaldi .gvimrc .hammerspoon .tmux.conf .vim .vimrc .zshenv)

mkdir -p .config/kitty

for file in $dotfiles; do
  if [[ -f ~/$file || -d ~/$file ]]; then
    if [ -L ~/$file ]; then
      echo ~/$file already exists and is a symbolic link
    else
      echo ~/$file already exists
    fi

    continue
  fi

  ln -s ~/Workspace/personal/dotfiles/$file ~/$file
done

# Add psql, pg_dump, etc. to PATH
brew link --force libpq


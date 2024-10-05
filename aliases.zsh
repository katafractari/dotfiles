# Pulumi
alias p="pulumi"

# NeoVim
alias v=nvim
alias vi=nvim
alias vim=nvim

# Eza
alias l='eza -1lF --icons -a --group-directories-first'

# Git
alias lg='lazygit'
alias gflrfm='GIT_MERGE_AUTOEDIT=no git flow release finish -m "Release version"'
alias gflhfm='GIT_MERGE_AUTOEDIT=no git flow hotfix finish -m "Hotfix version"'

# Node
alias n=npm

# Docker
alias ldo='lazydocker'

# Quarkus
alias qd='quarkus dev'

# cd to directory
k() {
  local dir
  dir=$(find ~/Workspace/kaldi -type d -mindepth 1 -maxdepth 1 | sort -r 2> /dev/null | fzf +m) &&
  cd "$dir"
}

gcoz() {
  gco $(git branch | fzf | tr -d '[:space:]')
}

# ZSH
ZSH_DISABLE_COMPFIX=true

# Git flow
alias gflrfm='GIT_MERGE_AUTOEDIT=no git flow release finish -m "Release version"'
alias gflhfm='GIT_MERGE_AUTOEDIT=no git flow hotfix finish -m "Hotfix version"'

# Node
alias n=npm

# Editor
export EDITOR='vim'

# Disable MacOS's "Save/Restore Shell State" feature
export SHELL_SESSIONS_DISABLE=1

alias assume=". assume"

# Granted
fpath=(~/.granted/zsh_autocomplete/assume/ $fpath)
fpath=(~/.granted/zsh_autocomplete/granted/ $fpath)

# Shortcuts
alias lg='lazygit'
alias ldo='lazydocker'
alias qd='quarkus dev'

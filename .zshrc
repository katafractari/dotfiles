autoload -Uz compinit
compinit -i

ZSH_DISABLE_COMPFIX=true

# Editor
export EDITOR='vim'

# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Antigen
source ~/Workspace/personal/dotfiles/antigen.zsh

antigen use oh-my-zsh

# Antigen Bundles
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle git-flow
antigen bundle npm
antigen bundle docker
antigen bundle brew
antigen bundle aws
antigen bundle colored-man-pages
antigen bundle lukechilds/zsh-nvm
antigen bundle akarzim/zsh-docker-aliases.git
antigen bundle MichaelAquilina/zsh-you-should-use

# Antigen Theme
antigen theme romkatv/powerlevel10k

# Apply Antigen configuration
antigen apply

# Homebrew
if [[ "$(/usr/bin/uname -m)" == "arm64" ]]; then
    export HOMEBREW_PREFIX=/opt/homebrew
else
    export HOMEBREW_PREFIX=/usr/local
fi

export PATH=$HOMEBREW_PREFIX/bin:$PATH
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1 # kill lag when toggling between modes

LC_ALL=en_US.UTF-8

# FZF
source <(fzf --zsh)

# Aliases
source ~/Workspace/personal/dotfiles/aliases.zsh

# powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# SDKMan
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Go
export GOPATH=$HOME/Workspace/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Docker Desktop
export PATH=$HOME/.docker/bin:$PATH

# Ruby 3
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# zsh-autosuggestions
bindkey '^ ' autosuggest-accept

# Disable MacOS's "Save/Restore Shell State" feature
export SHELL_SESSIONS_DISABLE=1

# Granted
alias assume=". assume"
fpath=(~/.granted/zsh_autocomplete/assume/ $fpath)
fpath=(~/.granted/zsh_autocomplete/granted/ $fpath)

# fzf-tab
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1lF --color=always --icons -a --group-directories-first $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# Setup fzf
# ---------
FZF_PREFIX=/opt/homebrew/opt/fzf

export PATH="${PATH:+${PATH}:}$FZF_PREFIX/bin"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF_PREFIX/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$FZF_PREFIX/shell/key-bindings.zsh"

# Make fzf-tab work on light background
zstyle ':fzf-tab:*' default-color $fg[default]

# Kaldi
k() {
  local dir
  dir=$(find ~/Workspace/kaldi -type d -mindepth 1 -maxdepth 1 | sort -r 2> /dev/null | fzf +m) &&
  cd "$dir"
}

gcoz() {
  gco $(git branch | fzf | tr -d '[:space:]')
}

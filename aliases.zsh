# AWS
function s3sync() {
  if [[ -z "$1" ]]; then
    echo "Usage: s3sync <bucket>"
    return
  fi

  aws s3 sync s3://$1 $1
}

# Pulumi
alias p="pulumi"

# NeoVim
alias vi=nvim
alias vim=nvim

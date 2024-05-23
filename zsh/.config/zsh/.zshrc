# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
### ZSH Home
export ZSH=$HOME/.config/zsh

# ZSH History settings
export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# ZSH Plugins
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/elixir/elixir.plugin.zsh
source $ZSH/plugins/fzf-tab/fzf-tab.plugin.zsh
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# Local variables
export FONTAWESOME_NPM_AUTH_TOKEN=06536BB0-ECE8-4A79-941F-416036FE5BD2
export NODE_HEROKU=true
export PRETTIERD_DEFAULT_CONFIG=$HOME/dev/ozone/prettier.config.js


# PATHS
export DEFAULT="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin"
export SCRIPTS="$HOME/scripts/bin"
export NODE="/Users/zack/.nvm/versions/node/v14.17.0/bin"
export FZF_DEFAULT_OPTS="--reverse --ansi --color=bg+:-1,fg:15,fg+:-1,prompt:6,header:5,pointer:2,hl:3,hl+:3,spinner:05,info:15,border:15"
export MANPAGER="nvim +Man!"
export YARN="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$DEFAULT:$SCRIPTS:$NODE:$YARN
export ERL_AFLAGS="-kernel shell_history enabled"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Tab complete
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Set vim as terminal editor
bindkey -v
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

alias vi="nvim"
alias I="echo -e '\n// IEX Phoenix Server';iex -S mix phx.server"
# alias R="echo -e '\n// Removing node_modules/';rm -rf node_modules/"
alias D="echo -e '\n// Removing deps/';rm -rf deps/"
alias grep="history | grep --color=auto"
alias branchcopy="git rev-parse --abbrev-ref HEAD | pbcopy"
alias PG="psql --host=gif-master-db.cgbafay9iyen.us-east-1.rds.amazonaws.com --port=5432 --username=superuser --password --dbname=postgres"
alias cat="bat --paging=never"

alias -g CC="| pbcopy"
alias -g R="| rg"

source <(fzf --zsh)

eval "$(/opt/homebrew/bin/brew shellenv)"
. $(brew --prefix asdf)/libexec/asdf.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zack/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zack/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zack/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zack/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/zack/.oh-my-zsh"

# Local variables
export FONTAWESOME_NPM_AUTH_TOKEN=06536BB0-ECE8-4A79-941F-416036FE5BD2
export NODE_HEROKU=true
export DEV_MONGO_CONNECTION_STRING=mongodb://heroku_fq3mct63:oviqo6fug1mufnqilqjhskbu5t@ds343098-a0.mlab.com:43098,ds343098-a1.mlab.com:43098/heroku_fq3mct63?replicaSet\=rs-ds343098

# Spotify
export SPOTIFY_CLIENT_ID="c14414221f0141f0b6ea5620c64fb5a0"
export SPOTIFY_CLIENT_SECRET="016f11e74a70490a898020bc9c59b5af"
export SPOTIFY_STATE="da4u3A4gB4uyasf8"
export SPOTIFY_DEVICE_ID_PRIMARY=""
export SPOTIFY_TOKEN_REFRESH="AQDbxmefQ4bI5ufUHprFHkXf3U5P1q7vz8TH5CKy7g0yPBczA4D6V9eSsdy3Y8FTeIVSip3Odnk4-r78GTnMHDiyT2-jV8vFZ6SmqdFHY9lyq3z_0UNST5I_H_xHKP_yMes"
export SPOTIFY_TOKEN_ACTIVE="BQAKdi1qCRjDAp62jU7OzqEAym6Y5K4_GihXn791VxHAHZpXzDEhJaHUVBMH6xbMmFv40ChYgv-IQEpPCfZSzjv8xk-eWBZ2WYWycfIdlFUObRYUmIENmVsjxOMaf0bSg1yMM2wmM_hXNqRkZLGrLM1ryrnOqSkjW1l5wI3alfQhvP4ABA79THMODthFC4CO8cueG-W8iQXwOwtAfRrXd4uHKLItufwZKJFZjShPLeq6hbCdh8rsf4RSiQAYVcCZ3LU"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GO
export GOPATH="$HOME/dev/go"

# PATHS
export DEFAULT="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin"
export SCRIPTS="$HOME/scripts/bin"
export NODE="/Users/zack/.nvm/versions/node/v14.17.0/bin"
export GO="/usr/local/go/bin"
export QMK="/usr/local/opt/avr-gcc@8/bin"
export FZF_DEFAULT_OPTS="--reverse --ansi --color=bg+:-1,fg:15,fg+:-1,prompt:6,header:5,pointer:2,hl:3,hl+:3,spinner:05,info:15,border:15"
export MANPAGER="nvim +Man!"
export YARN="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$DEFAULT:$SCRIPTS:$NODE:$GO:$QMK:$YARN

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="geoffgarside"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting elixir)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set vim as terminal editor
bindkey -v
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias vi="nvim"
alias I="echo -e '\n// IEX Phoenix Server';iex -S mix phx.server"
alias R="echo -e '\n// Removing node_modules/';rm -rf node_modules/"
alias D="echo -e '\n// Removing deps/';rm -rf deps/"
alias grep="history | grep --color=auto"
alias branchcopy="git rev-parse --abbrev-ref HEAD | pbcopy"
alias PG="psql --host=gif-master-db.cgbafay9iyen.us-east-1.rds.amazonaws.com --port=5432 --username=superuser --password --dbname=postgres"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
. $(brew --prefix asdf)/libexec/asdf.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zack/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zack/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zack/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zack/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(direnv hook zsh)"

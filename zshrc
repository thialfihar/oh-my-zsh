# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="thi"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

WORKON_HOME=$HOME/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=$(which python2.7)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow django gnu-utils macports osx pip python virtualenvwrapper vi-mode)

source $ZSH/oh-my-zsh.sh

# prevent reloading of the history in each shell
unsetopt share_history
# disable spelling correction
unsetopt correctall

# show cpu usage stats for programs running for more than 10 seconds
REPORTTIME=10
EDITOR=vim

# add potential dirs to path array
path+=/opt/local/bin
path+=~/bin
# then filter out those that exist
path=($^path(N))

# set keyboard repeat rate and delay if X is running
pgrep -f /usr/bin/X > /dev/null && xset r rate 180 40



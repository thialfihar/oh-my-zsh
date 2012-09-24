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
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

WORKON_HOME=$HOME/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=$(which python)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow django gnu-utils macports pip python virtualenvwrapper vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# prevent reloading of the history in each shell
unsetopt share_history
# disable spelling correction
unsetopt correctall

# show cpu usage stats for programs running for more than 10 seconds
REPORTTIME=10
EDITOR=vim

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

# add potential dirs to path array
path=(/usr/local/bin $path)
path+=/usr/local/share/python
path+=~/bin
# then filter out those that exist
path=($^path(N))

# set keyboard repeat rate and delay if X is running
pgrep -f /usr/bin/X > /dev/null && xset r rate 180 40

[ -f ~/.dircolors ] && eval $(dircolors -b ~/.dircolors)
export ZLSCOLORS="${LS_COLORS}"
# make sure zsh's completion uses the same colours
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g A="| ack"
alias -g CA="2>&1 | cat -A"
alias -g C='| wc -l'
alias -g D="DISPLAY=:0.0"
alias -g DN=/dev/null
alias -g ED="export DISPLAY=:0.0"
alias -g EG='|& egrep'
alias -g EH='|& head'
alias -g EL='|& less'
alias -g ELS='|& less -S'
alias -g ETL='|& tail -20'
alias -g ET='|& tail'
alias -g F=' | fmt -'
alias -g G='| egrep'
alias -g H='| head'
alias -g HL='|& head -20'
alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
alias -g LL="2>&1 | less"
alias -g L="| less"
alias -g LS='| less -S'
alias -g MM='| most'
alias -g M='| more'
alias -g NE="2> /dev/null"
alias -g NS='| sort -n'
alias -g NUL="> /dev/null 2>&1"
alias -g PIPE='|'
alias -g R=' > /c/aaa/tee.txt '
alias -g RNS='| sort -nr'
alias -g S='| sort'
alias -g TL='| tail -20'
alias -g T='| tail'
alias -g US='| sort -u'
alias -g VM=/var/log/messages
alias -g X0G='| xargs -0 egrep'
alias -g X0='| xargs -0'
alias -g XG='| xargs egrep'
alias -g X='| xargs'
alias gvim='UBUNTU_MENUPROXY= gvim'

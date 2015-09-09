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
export CLASSPATH=/home/thi/stanford-postagger/
# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/home/thi/sdk/cocos2d-x/tools/cocos2d-console/bin
# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/home/thi/sdk/android-sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/bin
export ANDROID_NDK_ROOT=/home/thi/sdk/android-ndk
export NDK_ROOT=$ANDROID_NDK_ROOT

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump git git-flow django gnu-utils pip python virtualenvwrapper zsh-syntax-highlighting)

if [[ $(uname) == 'Linux' ]]; then
    plugins+=command-not-found
fi

source $ZSH/oh-my-zsh.sh

HISTSIZE=100000
SAVEIST=$HISTSIZE
# prevent reloading of the history in each shell
unsetopt share_history
# disable spelling correction
unsetopt correctall
# if a wildcard argument doesn't match, keep it as a plaintext string
unsetopt nomatch

# show cpu usage stats for programs running for more than 10 seconds
REPORTTIME=10
EDITOR=vim

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

if [[ $(uname) == 'Linux' ]]; then
    # set keyboard repeat rate and delay if X is running
    pgrep -f 'X' > /dev/null && xset r rate 180 40
else
    path=(/usr/local/bin $path)
    path+=$(brew --prefix coreutils)/libexec/gnubin
fi
#
# add potential dirs to path array
path2=(~/bin /usr/local/bin)
for (( i = 1; i <= $#path; i++ )) do
    path2+=$path[i]
done
path2+=/usr/local/share/python
path2+=/opt/sublime_text_3
path2+=$ANDROID_SDK_ROOT/tools
path2+=$ANDROID_SDK_ROOT/platform-tools
path2+=$ANDROID_NDK_ROOT
path2+=$COCOS_CONSOLE_ROOT
path=($path2)
# then filter out those that exist
path=($^path(N))

[ -f ~/.dircolors ] && eval $(dircolors -b ~/.dircolors)
export ZLSCOLORS="${LS_COLORS}"
# make sure zsh's completion uses the same colours
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

alias ack='ack-grep'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g A="| ack"
alias -g CA="2>&1 | cat -A"
alias -g C='| wc -l'
alias -g COL='| sed "s/^/_ /" | rev | column -t | rev | sed "s/^_  //"'
alias -g CU='| cut -f'
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
alias -g U='| uniq'
alias -g VM=/var/log/messages
alias -g X0G='| xargs -0 egrep'
alias -g X0='| xargs -0'
alias -g XG='| xargs egrep'
alias -g X='| xargs'
alias gvim='UBUNTU_MENUPROXY= gvim'
# old gu
alias guo='killall wish 2> /dev/null; gitk &; git gui &'
# new gu
alias gun='killall gitg git-cola wish 2> /dev/null; gitg &; git cola &'
# gu using cola and gitk til other issues are fixed
alias guf='killall gitg git-cola wish 2> /dev/null; gitk &; git cola &'
alias gu='killall gitg git-cola wish 2> /dev/null; git cola &'
alias cm='start_cmus_in_tmux.sh'
alias vd="vimdiff"

alias ipy="ipython3"
alias pip="pip3"

if [[ $(uname) == 'Linux' ]]; then
    alias open='gnome-open'
fi

autoload -U zmv
alias mmv='noglob zmv -W'

if which synclient >/dev/null; then
  # on the Samsung this should be ClickPad=0
  synclient ClickPad=1
  synclient ClickFinger2=3
  synclient ClickFinger3=2
  synclient TapButton1=0
  synclient TapButton2=0
  synclient TapButton3=0
  synclient AreaRightEdge=0
fi

_fab_list() {
    reply=(`fab --shortlist`)
}
compctl -K _fab_list fab

export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
autoload -Uz vcs_info
setopt promptsubst

zstyle ':vcs_info:*' stagedstr '%F{green}⚫'
zstyle ':vcs_info:*' unstagedstr '%F{blue}⚫'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn hg
precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' %{%F{grey}%K{black}%}[%F{green}%b%c%u%{%F{grey}%}]'
    } else {
        zstyle ':vcs_info:*' formats ' %{%F{grey}%K{black}%}[%F{green}%b%c%u%F{red}⚫%{%F{grey}%}]'
    }
    vcs_info
}

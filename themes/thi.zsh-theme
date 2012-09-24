ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%b%F{grey}%K{black}%}%D{%T} %{%b%F{green}%K{black}%}%n%{%b%F{grey}%K{black}%}@%{%b%F{white}%K{black}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{black}%}%~${vcs_info_msg_0_}%E%{%f%k%b%}
!%{%b%F{grey}%K{black}%}%!%{%f%k%b%} %#%{%f%k%b%} '
RPROMPT=''

MODE_INDICATOR="%{$fg_bold[red]%}<<<%{$reset_color%}"
RPS1='$(vi_mode_prompt_info)'

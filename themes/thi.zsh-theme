
function git_prompt() {
  result=${vcs_info_msg_0_//⚫/●}
  result=$(echo "$result" | sed -e 's/^[[:space:]]*//')
  echo $result
}

PROMPT='%{%f%k%b%}
%{%b%F{grey}%K{black}%}%D{%T} %{%b%F{green}%K{black}%}%n%{%b%F{grey}%K{black}%}@%{%b%F{white}%K{black}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{black}%}%~ %{%F{white}%K{black}%}$(git_prompt)%E%{%f%k%b%}
!%{%b%F{grey}%K{black}%}%!%{%f%k%b%} %#%{%f%k%b%} '
RPROMPT=''

MODE_INDICATOR="%{$fg_bold[red]%}<<<%{$reset_color%}"

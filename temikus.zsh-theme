#Host prompt
if [[ -z "$SSH_CLIENT" ]]; then
     prompt_host=""
  else
     prompt_host=%{$fg_bold[white]%}@%{$reset_color$fg[yellow]%}$(hostname -s)
fi

_rbenv_prompt()
{
  type rbenv >/dev/null 2>&1 || return 0
  rbenv_version=$(rbenv version-name)
  if [[ $rbenv_version == 'system' ]]; then
    return 0
  else
    echo "$rbenv_version "
  fi
}

PROMPT=$'$(_rbenv_prompt)%{$fg_bold[cyan]%}%~ %{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}%D{[%H:%M:%S]}$(battery_pct_prompt)\
%{$fg_bold[green]%}%n${prompt_host}%{$fg_bold[white]%} \x\xCE\xbb%{$reset_color%} '

RPROMPT='%(0?..(%?%))'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

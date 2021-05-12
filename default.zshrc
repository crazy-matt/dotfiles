#--> naf - zaliases-sourcing -
if [ -r "$HOME/.zaliases" ]; then
  . "$HOME/.zaliases"
else
  echo '$HOME/.zaliases missing or not readable'
fi
#<-- naf - zaliases-sourcing -

#--> naf - key_bindings-sourcing -
if [ -r "$HOME/.key_bindings" ]; then
  . "$HOME/.key_bindings"
fi
#<-- naf - key_bindings-sourcing -

#--> naf - folder-structures -
if [[ -n "${GIT_FOLDER}" && -n "${GIT_ORG}" && -n "${GITHUB_USER}" ]] && [[ ! -d "${GIT_FOLDER}/${GIT_ORG}" || ! -d "${GIT_FOLDER}/${GITHUB_USER}" ]]; then
  mkdir -p "${GIT_FOLDER}/${GIT_ORG}"
  mkdir -p "${GIT_FOLDER}/${GITHUB_USER}"
fi
#<-- naf - folder-structures -

#--> naf - rc-functions -
function find_alt() {
  for i; do
    command -v "$i" >/dev/null && {
      echo "$i"
      return 0
    }
  done
  return 1
}
function detect_path_duplicates() {
  [[ -n "$(cmp <(echo $PATH | tr ':' '\n' | sort) <(echo $PATH | tr ':' '\n' | sort | uniq) 2>/dev/null)" ]] && echo '$PATH duplicates detected!'
  [[ -n "$(cmp <(echo $FPATH | tr ':' '\n' | sort) <(echo $FPATH | tr ':' '\n' | sort | uniq) 2>/dev/null)" ]] && echo '$FPATH duplicates detected!'
  [[ -n "$(cmp <(echo $MANPATH | tr ':' '\n' | sort) <(echo $MANPATH | tr ':' '\n' | sort | uniq) 2>/dev/null)" ]] && echo '$MANPATH duplicates detected!'
  [[ -n "$(cmp <(echo $CDPATH | tr ':' '\n' | sort) <(echo $CDPATH | tr ':' '\n' | sort | uniq) 2>/dev/null)" ]] && echo '$CDPATH duplicates detected!'
  [[ -n "$(cmp <(echo $MAILPATH | tr ':' '\n' | sort) <(echo $MAILPATH | tr ':' '\n' | sort | uniq) 2>/dev/null)" ]] && echo '$MAILPATH duplicates detected!'
}
#<-- naf - rc-functions -

#--> naf - nnn-shell-spawning -
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"
#<-- naf - nnn-shell-spawning -

#--> naf - LESS -
#export LESS="-i -R -M -S -w -z-4"
export LESS="-i -M -S -w --mouse -z-4"
#<-- naf - LESS -

#--> naf - LESSOPEN -
export LESSOPEN="| $HOME/.local/bin/lesspipe %s"
#<-- naf - LESSOPEN -

#--> naf - PAGER -
export PAGER="less"
#<-- naf - PAGER -

#--> naf - MANPAGER -
if [[ -n "$(command which bat)" ]]; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
elif [[ -n "$(command which less)" ]]; then
  export MANPAGER="less"
else
  export MANPAGER="$PAGER"
fi
#<-- naf - MANPAGER -

#--> naf - EDITOR -
export EDITOR="$(find_alt vsc nano nvim vim vi nvi emacs)"
#export EDITOR="vi"
#<-- naf - EDITOR -

#--> naf - VISUAL -
export VISUAL="ewrap"
#<-- naf - VISUAL -

#--> naf - ZLE_RPROMPT_INDENT -
export ZLE_RPROMPT_INDENT=0
#<-- naf - ZLE_RPROMPT_INDENT -

#--> naf - jump -
[[ -n "$(command -v jump)" ]] && eval "$(jump shell)"
#<-- naf - jump -

#--> naf - HISTSIZE -

#<-- naf - HISTSIZE -

#--> naf - SAVEHIST -

#<-- naf - SAVEHIST -

#--> naf - HISTFILE -

#<-- naf - HISTFILE -

#--> naf - zsh-user-settings -

#<-- naf - zsh-user-settings -


# Vi-Mode
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
preexec() {
    echo -ne '\e[5 q'
}
_fix_cursor() {
    echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)
zle -N zle-line-init
zle -N zle-keymap-select

# # 把`ctrl c`改为zle进入normal mode
bindkey '^c' vi-cmd-mode


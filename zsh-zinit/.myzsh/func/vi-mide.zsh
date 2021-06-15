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


# [[ $- == *i* ]]

# 把`ctrl c`改为zle进入normal mode
bindkey '^c' vi-cmd-mode
# # 把中断信号改为`ctrl e`
stty intr '^E' &>/dev/null

# stty -a

# function terminate-current-job() { kill -s TERM %+ ; }
# zle -N terminate-current-job terminate-current-job
# bindkey "^/" terminate-current-job



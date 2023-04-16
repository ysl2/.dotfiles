# change cursor into insert mode.
echo -ne '\e[5 q'

# [[ $- == *i* ]]

# 把中断信号改为`ctrl e`
stty intr '^E' &>/dev/null

# stty -a

# function terminate-current-job() { kill -s TERM %+ ; }
# zle -N terminate-current-job terminate-current-job
# bindkey "^/" terminate-current-job

# [[ $- == *i* ]]

# 把`ctrl c`改为zle进入normal mode
bindkey '^c' vi-cmd-mode
# # 把中断信号改为`ctrl e`
stty intr '^E'

# stty -a

# function terminate-current-job() { kill -s TERM %+ ; }
# zle -N terminate-current-job terminate-current-job
# bindkey "^/" terminate-current-job


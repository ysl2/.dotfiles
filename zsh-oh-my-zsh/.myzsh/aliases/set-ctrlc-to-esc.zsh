# 把`ctrl c`改为zle进入normal mode
bindkey '^c' vi-cmd-mode
# 把中断信号改为`ctrl e`
stty intr ^E


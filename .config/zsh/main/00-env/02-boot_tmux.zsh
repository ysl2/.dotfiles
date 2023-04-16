# ====================
# === Zinit Things ===
# ====================
# 国内镜像的解决方法：
# light或者load，表示下载整个仓库。此时在ice部分加上`from"hub.fastgit.org"`
# snippet，表示下载单文件，此时依然用hub.fastgit.org进行单文件加速，但是先创建别名


# ===
# === load first
# ===
# # 让tmux先加载
# zinit ice from"hub.fastgit.org" atinit"
# export TMUX_MOTD=false
# "
# zinit light zpm-zsh/tmux

# # tmux 配置字段参考这里：https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
# zinit ice lucid atinit"
# export ZSH_TMUX_AUTOSTART=true
# export ZSH_TMUX_AUTOSTART_ONCE=true
# export ZSH_TMUX_AUTOCONNECT=true
# export ZSH_TMUX_AUTOQUIT=true
# export ZSH_TMUX_FIXTERM=false
# "
# zinit snippet 'https://cdn.jsdelivr.net/gh/ohmyzsh/ohmyzsh/plugins/tmux/tmux.plugin.zsh'

# # 作为嵌入式终端时禁用 tmux
# if [[ -z $TMUX && $- == *i* ]]; then
#   if [[ ! "$(</proc/$PPID/cmdline)" =~ "/usr/bin/(dolphin|emacs|kate)|visual-studio-code" ]]; then
#     # exec tmux -f "~/.tmux.conf.local"
#     # exec tmux -f "~/.tmux.conf.local_no_ip"
#     # exec tmux -f "~/.tmux.conf.local_original"
#     exec tmux
#   fi
# else
#   # 如果当前 shell 是由 konsole 启动的，则 unset 相关变量
#   # 免作为子进程的 konsole 继承相关变量导致 fzf-tab 误判为 tmux 环境
#   if [[ "$(</proc/$PPID/cmdline)" =~ "konsole" ]]; then
#     unset TMUX TMUX_PANE
#   fi
# fi

function ontmux () {
  [[ ! -e "${MYLOCK}"/tmux.flag ]] && touch "${MYLOCK}"/tmux.flag
  source ~/.zshrc
}

function notmux () {
  [[ -e "${MYLOCK}"/tmux.flag ]] && rm "${MYLOCK}"/tmux.flag
  source ~/.zshrc
}

# 用于配合ontmux或者notmux，也可以用于暂时获取tmux
function mytmux () {
  # if ! (( $+commands[tmux] )); then
  #   print ""${NOTICE}": Tmux not found. Please install tmux before using this plugin." >&2
  #   return 1
  # fi

  # if [[ -z "$TMUX" ]]; then
  #   function _tmux_autostart() {
  #     # TERM=xterm-256color tmux -2 new-session -A -s main
  #     tmux -2 new-session -A -s main
  #     exit 0
  #     add-zsh-hook -d precmd _tmux_autostart
  #   }

  # autoload -Uz add-zsh-hook
  # add-zsh-hook precmd _tmux_autostart
  # fi
  if [[ -z "${TMUX}" ]]; then
      if [[ -e "${MYBIN}"/tmux ]]; then
          MYTMUX="${MYBIN}"/tmux
      elif command -v tmux &> /dev/null; then
          MYTMUX=tmux
      fi
      if [[ ! -z "${MYTMUX}" ]]; then
          exec "${MYTMUX}" new-session -A -s main
      fi
  fi
}

# 这个必须放在下面。否则会无法输出base
# >>> tmux initialize >>>
# !! Contents within this block are managed by 'tmux init' !!
if [[ -e "${MYLOCK}"/tmux.flag ]]; then
  mytmux
fi
# <<< tmux initialize <<<

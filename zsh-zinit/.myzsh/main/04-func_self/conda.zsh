# 如果终端输入onconda，则启用anaconda。否则则不启用。
# 如果启用CONDA，zsh启动将会非常慢。如果不是必须要用，建议别开CONDA

# export PATH="/opt/anaconda/bin:$PATH"

function onconda () {
  if [[ ! -e "${MYZSH}"/.lock/conda.flag ]]; then
    touch "${MYZSH}"/.lock/conda.flag
  fi
  source ~/.zshrc
  # echo "Anaconda on"
}

function noconda () {
  if [[ -e "${MYZSH}"/.lock/conda.flag ]]; then
    rm "${MYZSH}"/.lock/conda.flag
  fi
  source ~/.zshrc
  # echo "Anaconda off"
}

# 用于配合onconda或者noconda，也可以用于暂时获取conda
function myconda () {
  __conda_setup="$("/opt/"${MYCONDA}"/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "/opt/"${MYCONDA}"/etc/profile.d/conda.sh" ]; then
      . "/opt/"${MYCONDA}"/etc/profile.d/conda.sh"
    else
      export PATH="/opt/"${MYCONDA}"/bin:$PATH"
    fi
  fi
  unset __conda_setup
}

# 这个必须放在下面。否则会无法输出base
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [[ -e "${MYZSH}"/.lock/conda.flag ]]; then
  myconda
fi
# <<< conda initialize <<<


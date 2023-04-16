# If you use manjaro or arch or pacman package manager,
# the default conda installation will be:
#
# ```
# /opt/anaconda
# /opt/miniconda
# ```
# And you should notice the export must be sourced before main zshrc.
#
# So if you want to use them, you need to export the location.
#
# vim ~/.zshenv.localhost, then:
#
# ```
# export MYCONDA=/opt/miniconda
#


# 如果终端输入onconda，则启用anaconda。否则则不启用。
# 如果启用CONDA，zsh启动将会非常慢。如果不是必须要用，建议别开CONDA

# export PATH="/opt/anaconda/bin:$PATH"

function onconda () {
  if [[ ! -e "${MYLOCK}"/conda.flag ]]; then
    touch "${MYLOCK}"/conda.flag
  fi
  source ~/.zshrc
  # echo "Anaconda on"
}

function noconda () {
  if [[ -e "${MYLOCK}"/conda.flag ]]; then
    rm "${MYLOCK}"/conda.flag
  fi
  source ~/.zshrc
  # echo "Anaconda off"
}

# 用于配合onconda或者noconda，也可以用于暂时获取conda
function myconda () {
  __conda_setup="$("${MYCONDA}/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "${MYCONDA}/etc/profile.d/conda.sh" ]; then
      . "${MYCONDA}/etc/profile.d/conda.sh"
    else
      export PATH="${MYCONDA}/bin:$PATH"
    fi
  fi
  unset __conda_setup
}

# 这个必须放在下面。否则会无法输出base
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [[ -e "${MYLOCK}"/conda.flag ]]; then
  myconda
fi
# <<< conda initialize <<<

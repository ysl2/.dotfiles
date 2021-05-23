# 如果终端输入onconda，则启用anaconda。否则则不启用。
# 如果启用CONDA，zsh启动将会非常慢。如果不是必须要用，建议别开CONDA
onconda () {
    if [[ ! -e "${MYZSH}"/.lock/conda.flag ]]; then
        touch "${MYZSH}"/.lock/conda.flag
    fi
    source ~/.zshrc
    echo "Anaconda on"
}

noconda () {
    if [[ -e "${MYZSH}"/.lock/conda.flag ]]; then
        rm "${MYZSH}"/.lock/conda.flag
    fi
    source ~/.zshrc
    echo "Anaconda off"
}

# 这个必须放在下面。否则会无法输出base
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [[ -e "${MYZSH}"/.lock/conda.flag ]]; then
    if [[ $(yay -Qeq | grep anaconda) == 1 ]]; then
        yay -S anaconda
    fi
    __conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
            . "/opt/anaconda/etc/profile.d/conda.sh"
        else
            export PATH="/opt/anaconda/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi
# <<< conda initialize <<<


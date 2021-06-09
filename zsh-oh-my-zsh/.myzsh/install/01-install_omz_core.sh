# ===
# === P10k Auto Config
# ===
# p10k自动配置的内容

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -n "$MY_THEME" && -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#---------------------------------------------------------------------------------



# ===
# === Check Oh-My-Zsh
# ===

# 如果没有oh-my-zsh，就先下载
if [[ ! -e ~/.oh-my-zsh ]]; then
    # 把github.com做一下处理，换成国内地址
    result=$(curl -fsSL https://ghproxy.com/https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed 's/github\.com/gitclone\.com\/github\.com/')
    # 执行变量中的命令，用eval
    eval "${result}" --keep-zshrc
fi

# 如果没下载主题，就下载主题
if [[ ! -e ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
    git clone --depth=1 https://gitclone.com/github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# 设置主题。如果上面定义了MY_THEME就用上面的。否则就用默认的
if [[ -e ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
    ZSH_THEME=${MY_THEME:-"powerlevel10k/powerlevel10k"}
else
    ZSH_THEME=${MY_THEME:-"robbyrussell"}
fi


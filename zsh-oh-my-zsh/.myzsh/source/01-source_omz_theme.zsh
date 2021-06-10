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

# 设置主题。如果上面定义了MY_THEME就用上面的。否则就用默认的
if [[ -e ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
  ZSH_THEME=${MY_THEME:-"powerlevel10k/powerlevel10k"}
else
  ZSH_THEME=${MY_THEME:-"robbyrussell"}
fi

# p10k或者starship自动配置的内容。这部分需要在omz初始化完成后再进行
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ "$ZSH_THEME" == "powerlevel10k/powerlevel10k" ]]; then
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else
  # starship配置的内容
  eval "$(starship init zsh)"
fi


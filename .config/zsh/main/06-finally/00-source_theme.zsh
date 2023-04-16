# ===
# === Theme
# ===

: ${THEME:=p10k}

case $THEME in
  spaceship)
    zinit ice depth=1 from"hub.fastgit.org"
    zinit light spaceship-prompt/spaceship-prompt
    ;;
  p10k)
    [[ ! -f "${MYZSH}"/p10k.zsh ]] || source "${MYZSH}"/p10k.zsh
    # zinit ice depth=1 from"hub.fastgit.org"
    # local grey='242'
    # local red='#FF5C57'
    # local yellow='#F3F99D'
    # local blue='#57C7FF'
    # local magenta='#FF6AC1'
    # local cyan='#9AEDFE'
    # local white='#F1F1F0'
    zinit ice depth=1 from"hub.fastgit.org" atinit"
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=#F1F1F0
    "
    zinit light romkatv/powerlevel10k
    ;;
  p10k-classic)
    # zinit ice lucid wait"!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd" from'hub.fastgit.org'
    zinit ice depth=1 from"hub.fastgit.org" src="config/p10k-classic.zsh"
    zinit light romkatv/powerlevel10k
    ;;
  p10k-lean-8colors)
    # zinit ice lucid wait"!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd" from'hub.fastgit.org'
    zinit ice depth=1 from"hub.fastgit.org" src="config/p10k-lean-8colors.zsh"
    zinit light romkatv/powerlevel10k
    ;;
  p10k-lean)
    # zinit ice lucid wait"!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd" from'hub.fastgit.org'
    zinit ice depth=1 from"hub.fastgit.org" src="config/p10k-lean.zsh"
    zinit light romkatv/powerlevel10k
    ;;
  p10k-rainbow)
    # zinit ice lucid wait"!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd" from'hub.fastgit.org'
    zinit ice depth=1 from"hub.fastgit.org" src="config/p10k-rainbow.zsh"
    zinit light romkatv/powerlevel10k
    ;;
  p10k-robbyrussell)
    # zinit ice lucid wait"!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd" from'hub.fastgit.org'
    zinit ice depth=1 from"hub.fastgit.org" src="config/p10k-robbyrussell.zsh"
    zinit light romkatv/powerlevel10k
    ;;
  p9k)
    [[ ! -f ~/.p9k.zsh ]] || source ~/.p9k.zsh
    zinit ice depth=1 from"gitee.com" atinit"
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    "
    zinit light m12uch1/powerlevel9k
    ;;
  pure)
    # zinit ice lucid wait="!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd" from="hub.fastgit.org"
    # zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh' from"hub.fastgit.org"
    # zinit light sindresorhus/pure
    PROMPT=$'\n%F{cyan}❯ %f'
    RPROMPT=""
    zstyle ':prompt:pure:prompt:success' color cyan
    # zinit ice lucid wait="!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd" from'hub.fastgit.org'
    zinit ice lucid wait"!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd" from'hub.fastgit.org'
    zinit light sindresorhus/pure
    ;;
  zemoji)
    zinit ice depth=1 from"hub.fastgit.org"
    zinit light therzka/zemoji
    ;;
  starship)
    # if [[ ! -e "${MYLOCK}"/starship.flag ]]; then
    # touch "${MYLOCK}"/starship.flag
    if [[ ! -e "${BIN_DIR:-/usr/local/bin/starship}" ]]; then
      curl https://starship.rs/install.sh -o starship-install.sh
      chmod a+x starship-install.sh
      sudo ./starship-install.sh --yes --base-url=https://ghproxy.com/https://github.com/starship/starship/releases
      rm starship-install.sh
      # result=$(curl -fsSL https://starship.rs/install.sh)
      # eval "sudo ./${result} --yes --base-url=https://ghproxy.com/https://github.com/starship/starship/releases"
    fi
    # starship配置的内容
    eval "$(starship init zsh)"
    ;;
  *)
    zinit ice depth=1 from"hub.fastgit.org"
    zinit light ysl2/mini-simple-zsh-prompt
    ;;
esac

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
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
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
  p9k)
    [[ ! -f ~/.p9k.zsh ]] || source ~/.p9k.zsh
    # zinit ice depth=1 from"hub.fastgit.org" atinit"
    # typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=$cyan
    # "
    zinit ice depth=1 from"gitee.com"
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
esac


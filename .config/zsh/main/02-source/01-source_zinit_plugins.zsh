# ===
# === zinit self plugins
# ===

zinit wait lucid light-mode from"hub.fastgit.org" for \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-submods

zinit wait"1" lucid light-mode from"hub.fastgit.org" for \
  zdharma-continuum/zui \
  zdharma-continuum/zinit-crasis \
  zdharma-continuum/zinit-annex-test \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
  zdharma-continuum/fast-syntax-highlighting

# zinit自己的增强插件结束

# 下面这个插件下载速度巨慢，因此关掉
#zinit ice from"hub.fastgit.org"
#zinit light zinit-zsh/z-a-man

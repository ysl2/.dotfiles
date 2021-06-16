# ===
# === zinit self plugins
# ===

zinit wait lucid light-mode from"hub.fastgit.org" for \
  zinit-zsh/z-a-bin-gem-node \
  zinit-zsh/z-a-patch-dl \
  zinit-zsh/z-a-submods

zinit wait"1" lucid light-mode from"hub.fastgit.org" for \
  zdharma/zui \
  zdharma/zplugin-crasis \
  zinit-zsh/z-a-test

# zinit自己的增强插件结束

# 下面这个插件下载速度巨慢，因此关掉
#zinit ice from"hub.fastgit.org"
#zinit light zinit-zsh/z-a-man

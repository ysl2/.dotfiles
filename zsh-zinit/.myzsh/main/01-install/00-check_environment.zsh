# 通过普通用户的ssh链接下载。因此如果没有设置ssh,就报错退出。
if [[ ! -e ~/.ssh ]]; then
  echo ""${NOTICE}": no github ssh key found." >&2
  exit 1
fi

# # 0: stdin
# # 1: stdout
# # 2: stderr
# # `&>/dev/null`的意思是：`1>/dev/null 2>&1`
# # 即先把stdout重定向到/dev/null, 再把stderr重定向到stdout的位置
# if ! cargo &>/dev/null; then
#   echo ""${NOTICE}": cargo is not installed."
#   exit 1
# fi


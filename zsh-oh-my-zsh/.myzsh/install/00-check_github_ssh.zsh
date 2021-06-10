# 通过普通用户的ssh链接下载。因此如果没有设置ssh,就报错退出。
if [[ ! -e ~/.ssh ]]; then
  echo "YSL: no github ssh key found." >&2
  exit 1
fi


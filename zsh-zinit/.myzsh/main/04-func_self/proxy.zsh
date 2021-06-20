# ===
# === FQ
# ===
# 设置翻墙用的
# export http_proxy="socks5://127.0.0.1:7891"
# export https_proxy="socks5://127.0.0.1:7891"

# 启动代理
function onproxy () {
  export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7891
  echo "HTTP Proxy on"
}

# 关闭代理
function noproxy () {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  echo "HTTP Proxy off"
}


# ===
# === FQ
# ===

function onproxy () {
  export http_proxy=http://127.0.0.1:7890
  export https_proxy=$http_proxy
  export all_proxy=socks5://127.0.0.1:7891
  curl -I www.google.com | head -n 1
}

function noproxy () {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  echo "HTTP Proxy off"
}

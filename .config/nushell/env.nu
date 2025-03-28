# ===================================================
# === Utils and some global environment variables ===
# ===================================================
$env.config.shell_integration.osc133 = false
$env.config.show_banner = false


# ============
# === PATH ===
# ============

# ===
# === In sequences, last in first out.
# ===
let vocal = ($nu.home-path | path join ".vocal" | str trim -r -c '"')
if not ($vocal | path exists) {
    mkdir $vocal
}
let vocalbins = (ls -a $vocal | where type == "dir" | each { |it|
    let tmp = $it.name
    let vocalbin = ($tmp | path join "bin")
    if ($vocalbin | path exists) and (not ($tmp | str contains "conda")) {
        $vocalbin
    }
})
let vocalunderscore = ($vocal | path join "_")
$env.PATH = ([$vocalunderscore, $vocal] | append $vocalbins | append $env.PATH)

# ===
# === Other special cases
# ===
let go = (which go | get --ignore-errors path.0)
if ($go | is-not-empty) {
    $env.GOPATH = ($go | path dirname | path dirname | path join "gopath")
    let tmp = ($env.GOPATH | path join "bin")
    if ($tmp | path exists) {
        $env.PATH = ($tmp | append $env.PATH)
    }
}


# ===================================
# === Other environment variables ===
# ===================================
$env.EDITOR = (which nvim | get --ignore-errors path.0 | default (which vim | get path.0))
$env.GOPROXY = "https://goproxy.cn"
$env.RUSTUP_DIST_SERVER = "https://rsproxy.cn"
$env.RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup"
if $nu.os-info.name == "windows" {
    $env.YAZI_FILE_ONE = "C:\\Program Files\\Git\\usr\\bin\\file.exe"
}

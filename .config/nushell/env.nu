# ===================================================
# === Utils and some global environment variables ===
# ===================================================
$env.config.shell_integration.osc133 = false
$env.config.show_banner = false


# ============
# === PATH ===
# ============

# ===
# === For homebrew apps.
# ===
if $nu.os-info.name == "macos" {
    $env.HOMEBREW_PREFIX = "/opt/homebrew"
} else if $nu.os-info.name == "linux" {
    $env.HOMEBREW_PREFIX = "/home/linuxbrew/.linuxbrew"
}
if ($env.HOMEBREW_PREFIX? | is-not-empty) and ($env.HOMEBREW_PREFIX | path exists) {
    $env.PATH = ($env.HOMEBREW_PREFIX | path join "sbin" | append $env.PATH)
    $env.PATH = ($env.HOMEBREW_PREFIX | path join "bin" | append $env.PATH)
}

# ===
# === No sequences, for system default.
# ===
$env.PATH = ($nu.home-path | path join "bin" | append $env.PATH)
$env.PATH = ($nu.home-path | path join ".local" "bin" | append $env.PATH)

# ===
# === No sequences, but put them last.
# ===
$env.PATH = ($nu.home-path | path join ".cargo" "bin" | append $env.PATH)
let go = (which go | get --ignore-errors path.0)
if ($go | is-not-empty) {
    $env.GOPATH = ($go | path dirname | path dirname | path join "gopath")
    $env.PATH = (($env.GOPATH | path join "bin") | append $env.PATH)
}
if ($nu.os-info.name == "macos") and ($env.HOMEBREW_PREFIX? | is-not-empty) and ($env.HOMEBREW_PREFIX | path exists) {
    $env.PATH = ($env.HOMEBREW_PREFIX | path join "opt/gnu-sed/libexec/gnubin" | append $env.PATH)
}

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
    # if ($vocalbin | path exists) and (not ($tmp | str contains "conda")) {
    if ($vocalbin | path exists) {
        $vocalbin
    }
})
let vocalzerobin = ($vocal | path join "0" | path join "bin")
$env.PATH = ([$vocalzerobin, $vocal] | append $vocalbins | append $env.PATH)


# ===================================
# === Other environment variables ===
# ===================================
# $env.EDITOR = (which nvim | get --ignore-errors path.0 | default (which vim | get path.0))
$env.EDITOR = (which nvim | "nvim" | default "vim")
$env.GOPROXY = "https://goproxy.cn"
$env.RUSTUP_DIST_SERVER = "https://rsproxy.cn"
$env.RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup"
$env.CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense" # optional
$env.HOMEBREW_NO_AUTO_UPDATE = 1
if $nu.os-info.name == "windows" {
    $env.YAZI_FILE_ONE = "C:\\Program Files\\Git\\usr\\bin\\file.exe"
}
$env.SHELL = $nu.current-exe
$env.LANG = "en_US.UTF-8"
$env.LC_ALL = "en_US.UTF-8"

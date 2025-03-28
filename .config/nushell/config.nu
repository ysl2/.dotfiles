let vocalock = ($vocal | path join ".lock")
mkdir $vocalock


# =========================
# === Boot tmux if need ===
# =========================
let vocalock_tmux = ($vocalock | path join "tmux")
def ontmux [] {
    if not ($vocalock_tmux | path exists) { return }

    let mytmux = (try { $env.MYTMUX } catch { "" })
    let mytmux = if ($mytmux | is-empty) or (not (which $mytmux | is-empty)) {
        if (which tmux | is-empty) {
            ""
        } else {
            "tmux"
        }
    } else {
        $mytmux
    }

    echo $"Current tmux value: `($mytmux)`" | save -f $vocalock_tmux
    if ($mytmux | is-empty) { return }

    if ($env.TMUX? | is-empty) {
        ^$mytmux new-session -A -s main $env.SHELL
        exit
    }
}
ontmux


# ==============
# === Others ===
# ==============

# ===
# === Functions
# ===
def toggle [file: string, cmd: closure] {
    if ($file | path exists) {
        rm $file
    } else {
        touch $file
    }
    do $cmd
}
def totmux [] {
    toggle $vocalock_tmux {|| ontmux}
}
def P [...args] {
    let old_http = ($env.http_proxy? | default null)
    let old_https = ($env.https_proxy? | default null)
    $env.http_proxy = "http://127.0.0.1:7890"
    $env.https_proxy = "http://127.0.0.1:7890"
    ^$args.0 ...($args | skip 1)
    $env.http_proxy = $old_http
    $env.https_proxy = $old_https
}

# ===
# === Aliases
# ===
alias :q = exit
alias :qa = exit
def --env lf [...args] {
    # if $nu.os-info.name == "windows" {
    let tmp = (mktemp -t "yazi-cwd.XXXXXX")
    ^yazi ...$args --cwd-file $tmp
    let cwd = (open $tmp)
    if $cwd != "" and $cwd != $env.PWD {
        cd $cwd
    }
    rm -fp $tmp
    # } else {
    #     cd (^lf -print-last-dir ...$args)
    # }
}
alias aim = nvim -u ~/.vimrc
alias vim = nvim -u ~/.vimrc
alias nim = nvim -u NONE
alias lg = lazygit
alias py = python
def cht [topic: string] {
    ^curl -s $"https://cht.sh/($topic)"
}

# ===
# === Outside sources
# ===
# NOTE: For nushell 0.102.0 and later:
# const user_autoload_dir = $nu.user-autoload-dirs.0
# NOTE: For nushell 0.101.0 and earlier:
const user_autoload_dir = $nu.default-config-dir | path join "autoload"
# TODO:
# `$vendor_autoload_dir` should be set depending on the platforms (win, linux, mac). Otherwise, it won't work.
# Currently, it is set but cannot be used because nushell won't autoload this path.
# const vendor_autoload_dir = $nu.vendor-autoload-dirs | last
let vendor_autoload_dir = (
    if ($nu.os-info.name == "linux") {
        $nu.home-path | path join ".local" "share" "nushell" "vendor" "autoload"
    } else if ($nu.os-info.name == "macos") {
        $nu.home-path | path join "Library" "Application Support" "nushell" "vendor" "autoload"
    } else {
        $user_autoload_dir
    }
)
mkdir $vendor_autoload_dir
let tmp = ($vendor_autoload_dir | path join "starship.nu")
if (not ($tmp | path exists) and (which starship | is-not-empty)) {
    starship init nu | save -f $tmp
}
# Ref: https://github.com/Magniquick/atuin-win/actions
let tmp = ($vendor_autoload_dir | path join "atuin.nu")
if (not ($tmp | path exists) and (which atuin | is-not-empty)) {
    atuin init nu | save -f $tmp
}
# let tmp = ($vendor_autoload_dir | path join "carapace.nu")
# if (not ($tmp | path exists) and (which carapace | is-not-empty)) {
#     carapace _carapace nushell | save -f $tmp
# }
# NOTE: On Linux, this below can only be used in nushell 0.101.0 and earlier.
# TODO: Need to find a way to make it work in all platforms and versions.
use ($user_autoload_dir | path join "conda.nu")


# ==================
# === Post loads ===
# ==================
# NOTE:
# Localhost config file location: $user_autoload_dir


# ========================
# === Unique varaibles ===
# ========================
$env.PATH = $env.PATH | each { |it| $it } | uniq

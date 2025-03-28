# ==============
# === Others ===
# ==============

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
alias nim = nvim -u NONE
alias lg = lazygit
alias py = python
def cht [topic: string] {
    ^curl -s $"https://cht.sh/($topic)"
}
# def P [...args] {
#     $env.http_proxy = "127.0.0.1:7890"
#     $env.https_proxy = "127.0.0.1:7890"
#     nu -c $args
#     $env.http_proxy = null
#     $env.https_proxy = null
# }
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
# === Outside sources
# ===
const USER_AUTOLOAD_DIR = $nu.user-autoload-dirs.0
mkdir $USER_AUTOLOAD_DIR
let tmp = ($USER_AUTOLOAD_DIR | path join "starship.nu")
if (not ($tmp | path exists) and (which starship | is-not-empty)) {
    starship init nu | save -f $tmp
}
# Ref: https://github.com/Magniquick/atuin-win/actions
let tmp = ($USER_AUTOLOAD_DIR | path join "atuin.nu")
if (not ($tmp | path exists) and (which atuin | is-not-empty)) {
    atuin init nu | save -f $tmp
}
let tmp = ($USER_AUTOLOAD_DIR | path join "carapace.nu")
if (not ($tmp | path exists) and (which carapace | is-not-empty)) {
    carapace _carapace nushell | save -f $tmp
}
use ($USER_AUTOLOAD_DIR | path join "conda.nu")


# ==================
# === Post loads ===
# ==================
# NOTE:
# Localhost config file location: $USER_AUTOLOAD_DIR

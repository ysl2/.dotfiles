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

# ===
# === Outside sources
# ===
let autoload = ($nu.data-dir | path join "vendor/autoload")
mkdir $autoload
if (which starship | is-not-empty) {
    starship init nu | save -f ($autoload | path join "starship.nu")
}
# Ref: https://github.com/Magniquick/atuin-win/actions
if (which atuin | is-not-empty) {
    atuin init nu | save -f ($autoload | path join "atuin.nu")
}


# ==================
# === Post loads ===
# ==================
# NOTE:
# Localhost config file location:
# const localhost_config_file = ($nu.data-dir | path join "vendor/autoload/config.localhost.nu")

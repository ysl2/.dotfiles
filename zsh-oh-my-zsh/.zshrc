# set the affix .zsh files can be sourced
unsetopt nomatch


# ===
# === manual check brew
# ===
# if [[ ! -e "${MYZSH}"/.lock/brew.lock ]]; then
#     echo "Homebrew isn't install. Please install it by automatic script in \`"${MYZSH}"/manual\`"
#     return
# fi

# ===
# === source
# ===
source "${MYZSH}"/sources.zsh

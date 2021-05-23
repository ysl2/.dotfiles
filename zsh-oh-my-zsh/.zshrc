# set the affix .zsh files can be sourced
unsetopt nomatch


# ===
# === manual check brew
# ===
if [[ ! -e "${MYZSH}"/.lock/brew.lock ]]; then
    echo "Homebrew isn't install. Please install it by automatic script in \`"${MYZSH}"/manual\`"
    return
fi


# ===
# === source script
# ===
for item in $(ls "${MYZSH}"/script); do
    source "${MYZSH}"/script/"${item}"
done


# ===
# === source omz
# ===
for item in $(ls "${MYZSH}"/omz); do
    source "${MYZSH}"/omz/"${item}"
done


# ===
# === source others (e.g conda)
# ===
for item in $(ls "${MYZSH}"/func); do
    source "${MYZSH}"/func/"${item}"
done


# ===
# === source aliases
# ===
source "${MYZSH}"/aliases.zsh



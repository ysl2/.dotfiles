# set the affix .zsh files can be sourced
unsetopt nomatch


# ===
# === check brew
# ===
if [[ ! -e "${MYZSH}"/.lock/brew.lock ]]; then
    echo "Homebrew isn't install. Please install it by automatic script in \`"${MYZSH}"/manual\`"
    return
fi


# ===
# === source script
# ===
for item in $(ls "${MYZSH}"/script); do
    echo source "${MYZSH}"/script/"${item}"
done


# ===
# === source omz
# ===
for item in $(ls "${MYZSH}"/omz); do
    echo source "${MYZSH}"/omz/"${item}"
done


# ===
# === source others (e.g conda)
# ===
for item in $(ls "${MYZSH}"/func); do
    echo source "${MYZSH}"/func/"${item}"
done


# ===
# === source aliases
# ===
echo source "${MYZSH}"/aliases.zsh



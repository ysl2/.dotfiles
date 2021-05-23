# ===
# === source manual
# ===
for item in $(\ls "${MYZSH}"/manual); do
    sh "${MYZSH}"/manual/"${item}"
done


# ===
# === source script
# ===
for item in $(\ls "${MYZSH}"/script); do
    source "${MYZSH}"/script/"${item}"
done


# ===
# === source omz
# ===
for item in $(\ls "${MYZSH}"/omz); do
    source "${MYZSH}"/omz/"${item}"
done


# ===
# === source others (e.g conda)
# ===
for item in $(\ls "${MYZSH}"/func); do
    source "${MYZSH}"/func/"${item}"
done


# ===
# === source aliases
# ===
source "${MYZSH}"/aliases/aliases.zsh


# ===
# === set environment
# ===
# for item in $(\ls "${MYZSH}"/install); do
for item in "${MYZSH}"/env/*.zsh; do
  # source "${MYZSH}"/install/"${item}"
  source $item
done


# ===
# === install needed
# ===
# for item in $(\ls "${MYZSH}"/install); do
for item in "${MYZSH}"/install/*.zsh; do
  # source "${MYZSH}"/install/"${item}"
  source $item
done

# ===
# === source environmental settings
# ===
# for item in $(\ls "${MYZSH}"/source); do
for item in "${MYZSH}"/source/*.zsh; do
  # source "${MYZSH}"/source/"${item}"
  source $item
done


# ===
# === source others (e.g conda)
# ===
# for item in $(\ls "${MYZSH}"/func); do
for item in "${MYZSH}"/func/*.zsh; do
  # source "${MYZSH}"/func/"${item}"
  source $item
done


# ===
# === source aliases
# ===
for item in "${MYZSH}"/aliases/*.zsh; do
  # source "${MYZSH}"/aliases/"${item}"
  source $item
done


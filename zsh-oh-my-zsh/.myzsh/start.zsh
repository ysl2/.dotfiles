# ===
# === install needed
# ===
for item in $(\ls "${MYZSH}"/install); do
  source "${MYZSH}"/install/"${item}"
done


# ===
# === source environmental settings
# ===
for item in $(\ls "${MYZSH}"/source); do
  source "${MYZSH}"/source/"${item}"
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
for item in $(\ls "${MYZSH}"/aliases); do
  source "${MYZSH}"/aliases/"${item}"
done


#!/bin/bash
cd ~
VIMP='~/.cache/vim/plug/repos'



# =========================
# === basic environment ===
# =========================


# ===
# === yay
# ===
# neovim
yay -S neovim-nightly-bin --needed --noconfirm

# dependencies
yay -S nodejs --needed --noconfirm
yay -S rust --needed --noconfirm
yay -S python --needed --noconfirm
yay -S bat --needed --noconfirm
yay -S ripgrep --needed --noconfirm
yay -S ctags --needed --noconfirm
yay -S jdtls --needed --noconfirm

# common packages
yay -S ranger --needed --noconfirm
yay -S lazygit --needed --noconfirm

# formater
yay -S astyle --needed --noconfirm


# ===
# === nodejs
# ===
sudo npm install -g yarn
sudo npm install -g instant-markdown-d


# ===
# === pip
# ===
pip install autopep8



# ========================
# === plugins specific ===
# ========================


# ===
# === vim-indent-blankline
# ===
cd ${VIMP}/indent-blankline/ && git checkout lua && cd -

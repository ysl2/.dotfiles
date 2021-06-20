# =====================
# === self settings ===
# =====================
export EDITOR=nvim
export DOTFILES_MAIN="${HOME}"/.dotfiles-main
export DOTFILES="${HOME}"/.dotfiles
# export THEME=spaceship
if [ $TERM = 'alacritty' ]
then
  export TERM=xterm-256color
fi


# ===
# === fzf
# ===
export FZF_DEFAULT_COMMAND='fd --hidden'

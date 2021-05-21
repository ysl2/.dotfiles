if [[ -e ~/.config/nvim-${USER} ]]; then
  echo 'Too many nvim distributions. Please clean them in `~/.config/`'
  exit 0
fi
if [[ -e ~/.config/nvim && -e ~/.config/nvim-bak ]]; then
  mv ~/.config/nvim-bak ~/.config/nvim-${USER}
fi
cd
if [[ ! -e install.sh ]]; then
  curl -fLo install.sh https://cdn.jsdelivr.net/gh/glepnir/jarvim@master/install.sh
fi
sed 's/github\.com/hub\.fastgit\.org/g' install.sh > tmp
mv tmp install.sh
chmod 777 install.sh
sh install.sh
rm install.sh
./jarvim -g
if [[ -f ~/.config/nvim/install.sh ]]; then
  chmod 777 ~/.config/nvim/install.sh
fi

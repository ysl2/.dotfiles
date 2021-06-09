#/usr/bin/nash

echo "YuSoLi: This shell script has some problems. Don't use this."
exit 0

curl -fsSL https://cdn.jsdelivr.net/gh/pacstall/pacstall/install.sh | sed 's/githubusercontent\.com/fastgit\.org/g' >~/pacstall-install.sh
sudo chmod 777 ~/pacstall-install.sh
sudo bash -c ~/pacstall-install.sh
rm ~/pacstall-install.sh
cd /usr/share/pacstall/scripts/
for item in $(ls .); do
  sudo sed -i 's/githubusercontent\.com/fastgit\.org/g' "${item}"
done
cd -

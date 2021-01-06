echo "Installing Jetbrains Toolbox..."

# shellcheck disable=SC2164
cd /home/vagrant
# https://unix.stackexchange.com/a/391801/448729
wget -q "https://data.services.jetbrains.com/products/download?code=tb&platform=linux" -O tb.tar.gz
tar xvf tb.tar.gz
rm tb.tar.gz
# shellcheck disable=SC2164
cd jetbrains-toolbox-*
# https://askubuntu.com/a/294748/453981
sudo -H -u vagrant bash -c './jetbrains-toolbox'
cd ../
rm -r jetbrains-toolbox-*

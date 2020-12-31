echo "Installing Jetbrains Toolbox..."
# https://unix.stackexchange.com/a/391801/448729
wget "https://data.services.jetbrains.com/products/download?code=tb&platform=linux" -O tb.tar.gz
tar xvf tb.tar.gz
rm tb.tar.gz
cd jetbrains-toolbox-*
./jetbrains-toolbox

echo "Installing NoMachine remote desktop"

cd /tmp/
NX_FILE="nomachine_7.0.211_4_amd64.deb"
wget "https://download.nomachine.com/download/7.0/Linux/$NX_FILE"
sudo dpkg -i $NX_FILE
rm $NX_FILE

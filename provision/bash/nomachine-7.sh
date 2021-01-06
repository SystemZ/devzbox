echo "Installing NoMachine remote desktop"

cd /tmp/
NX_FILE="nomachine_7.0.211_4_amd64.deb"
wget "https://download.nomachine.com/download/7.0/Linux/$NX_FILE"
sudo dpkg -i $NX_FILE
rm $NX_FILE

echo "Configuring NoMachine server"
# https://forums.nomachine.com/topic/connect-to-physical-display
sed -i 's/#CreateDisplay 0/CreateDisplay 1/g' /usr/NX/etc/server.cfg
sed -i 's/#DisplayOwner ""/DisplayOwner "vagrant"/g' /usr/NX/etc/server.cfg

echo "Restarting NoMachine server"
sudo /etc/NX/nxserver --restart

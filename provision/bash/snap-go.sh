echo "Installing Go..."
sudo snap install --classic go

echo "Adding go/bin to path..."
# shellcheck disable=SC2016
echo 'PATH="$PATH:/home/vagrant/go/bin/"' >> /home/vagrant/.bashrc

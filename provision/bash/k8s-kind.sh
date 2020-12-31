# requires installed Go

echo "Installing kind for k8s"
go get sigs.k8s.io/kind

echo "Installing kubectl..."
sudo snap install --classic kubectl

echo "Installing helm..."
sudo snap install --classic helm

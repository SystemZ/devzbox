echo "Setting new random password for 'vagrant' user..."

NEW_PASS=$(pwgen -s -A -B -1 6)
echo "vagrant:$NEW_PASS" | sudo chpasswd

echo ""
echo "New credentials:"
echo "username: vagrant"
echo "password: $NEW_PASS"

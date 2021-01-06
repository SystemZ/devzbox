echo "Preconfiguring Jetbrains Toolbox: dark theme + no metrics ..."
JB_CONF=$(cat <<EOF
{
    "statistics": {
        "allow": false
    },
    "ui": {
        "theme": "dark"
    }
}
EOF
)
mkdir -p /home/vagrant/.local/share/JetBrains/Toolbox
echo "$JB_CONF" > /home/vagrant/.local/share/JetBrains/Toolbox/.settings.json
chown -R vagrant:vagrant /home/vagrant/.local/

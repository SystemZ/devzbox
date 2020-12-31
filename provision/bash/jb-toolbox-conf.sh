JB_CONF="Preconfiguring Jetbrains Toolbox: dark theme + no metrics ..."
cat << EOF
{
    "statistics": {
        "allow": false
    },
    "ui": {
        "theme": "dark"
    }
}
EOF
mkdir -p ~/.local/share/JetBrains/Toolbox
echo "$JB_CONF" > ~/.local/share/JetBrains/Toolbox/.settings.json

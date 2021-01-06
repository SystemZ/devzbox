echo "Installing desktop environment..."
sudo apt-get install -y ubuntu-desktop-minimal
sudo apt-get install -y open-vm-tools open-vm-tools-desktop

echo "Removing password requirement for power off by vagrant user..."
# https://askubuntu.com/a/486425/453981
mkdir -p /etc/polkit-1/localauthority/50-local.d
cat << _EOF_ >/etc/polkit-1/localauthority/50-local.d/allow_all_users_to_shutdown_reboot_suspend.pkla
[Allow all users to shutdown]
Identity=unix-user:vagrant
Action=org.freedesktop.login1.power-off-multiple-sessions
ResultAny=yes

[Allow all users to reboot]
Identity=unix-user:vagrant
Action=org.freedesktop.login1.reboot-multiple-sessions
ResultAny=yes

[Allow all users to suspend]
Identity=unix-user:vagrant
Action=org.freedesktop.login1.suspend-multiple-sessions
ResultAny=yes

[Allow all users to ignore inhibit of shutdown]
Identity=unix-user:vagrant
Action=org.freedesktop.login1.power-off-ignore-inhibit
ResultAny=yes

[Allow all users to ignore inhibit of reboot]
Identity=unix-user:vagrant
Action=org.freedesktop.login1.reboot-ignore-inhibit
ResultAny=yes

[Allow all users to ignore inhibit of suspend]
Identity=unix-user:vagrant
Action=org.freedesktop.login1.suspend-ignore-inhibit
ResultAny=yes
_EOF_

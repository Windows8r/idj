echo Installing package (0/5)
sudo apt update
sudo apt upgrade -y
wget -O rdp.deb https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo systemctl disable lightdm.service

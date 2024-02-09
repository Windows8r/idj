echo Installing package (0/4)
sudo apt update
sudo apt upgrade -y
clear
echo Installing package (1/4)
wget -O rdp.deb https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
clear
echo Installing RDP (2/4)
sudo apt install ./rdp.deb
clear
echo Installing chrome (3/4)
sudo apt install ./chrome.deb
clear
echo setting up RDP (4/4)
sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo systemctl disable lightdm.service

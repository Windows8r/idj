echo Installing package (1/6)
sudo apt update
sudo apt upgrade -y
sudo apt install p7zip-full -y
clear
echo Installing package (2/6)
mkdir down
cd down
wget -O rdp.deb https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -O msof.rar https://download1325.mediafire.com/05lb1rluptagUXua7NEFLcQkEGNhPMHekDYQcijAuDTixUrQ_9kAAVu7NuLq2IT1xRophOxakTMoEzQoIdDYFUyQcVaSP-MYqknUDvziJZEGhou6HAE2WyONKiQi3M2W5sw_V8U-sRuCsk1jzgEdvvgTU2lbH5Vz60FMPix1PPUE/40dodk3xaxs1843/msof.rar
clear
echo Installing RDP (3/6
sudo apt install ./rdp.deb
clear
echo Installing chrome (4/6)
sudo apt install ./chrome.deb
clear
echo setting up RDP (5/6)
sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo systemctl disable lightdm.service
echo Installing office (6/6)
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources
sudo apt update
sudo apt install --install-recommends winehq-stable
7z x msof.rar
cd msof/Office2007SP2BlueEdition/
wine setup.exe

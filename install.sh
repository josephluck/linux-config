#! /bin/bash

# Update core repositories
sudo apt-get update &&

sudo apt-get install curl &&

# VS code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&

# Node
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - &&

# sur5r-keyring
sudo apt-get --allow-unauthenticated install sur5r-keyring &&

# Arc gtk theme
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list" &&
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key &&
sudo apt-key add - < Release.key &&
rm -rf Release.key &&

# Moka icons
sudo add-apt-repository ppa:moka/daily &&


# Update repositories
sudo apt-get update &&

# Install packages
sudo apt-get install -y nodejs git code i3 gksu amixer pulseaudio powertop feh arandr python-requests lxappearance arc-theme moka-icon-theme &&
sudo apt-get install gcc python-dev python-pip &&
pip install netifaces && pip install psutil

# Get font
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git &&
cp -v YosemiteSanFranciscoFont/*.ttf /usr/share/fonts &&

# Copy configs
rm -rf ~/.i3 && mkdir ~/.i3 && cp ./config ~/.i3/config &&

# Bumblebee status
git clone git://github.com/tobi-wan-kenobi/bumblebee-status &&
cp -rf ./bumblebee-status ~/.i3/bumblebee-status && rm -rf ./bumblebee-status

# Copy media key scripts to local bin
cp ./bright /usr/local/bin/bright &&

# Clean up
sudo apt autoremove &&
rm -rf YosemiteSanFranciscoFont &&

echo "Done! You'll need to reboot"

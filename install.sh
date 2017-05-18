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

# Update repositories
sudo apt-get update &&

# Install packages
sudo apt-get install -y nodejs git code i3 gksu amixer pulseaudio powertop feh arandr python-requests &&
sudo apt-get install gcc python-dev python-pip &&
pip install netifaces && pip install psutil

# Get font
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git &&
cp -v YosemiteSanFranciscoFont/*.ttf /usr/share/fonts &&

# Copy configs
rm -rf ~/.i3 && mkdir ~/.i3 && cp ./config ~/.i3/config &&

# Bumblebee status
git clone git://github.com/tobi-wan-kenobi/bumblebee-status &&
cp -rf ./bumblebee-status ./.i3 && rm -rf ./bumblebee-status

# Copy media key scripts to local bin
cp ./bright /usr/local/bin/bright &&

# Clean up
sudo apt autoremove &&
rm -rf YosemiteSanFranciscoFont &&

echo "Done! You'll need to reboot"

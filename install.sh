#! /bin/bash

# Update core repositories
sudo apt-get update &&

# Add curl for VS code
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

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 &&
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list &&

# Better font rendering
sudo add-apt-repository ppa:no1wantdthisname/ppa &&

# Update repositories
sudo apt-get update &&

# Install packages
# Terminal
sudo apt-get install -y nodejs &&
sudo apt-get install -y zsh &&
# Applications
sudo apt-get install -y i3 &&
sudo apt-get install -y spotify-client &&
sudo apt-get install -y code &&
sudo apt-get install -y thunar &&
sudo apt-get install -y gksu &&
sudo apt-get install -y feh &&
sudo apt-get install -y arandr &&
sudo apt-get install -y ranger &&
# Appearance
sudo apt-get install -y python-requests &&
sudo apt-get install -y arc-theme &&
sudo apt-get install -y fontconfig-infinality &&
sudo apt-get install -y lxappearance &&
# Misc
sudo apt-get install -y install &&
sudo apt-get install -y caca-utils &&
sudo apt-get install -y highlight &&
sudo apt-get install -y atool &&
sudo apt-get install -y w3m &&
sudo apt-get install -y poppler-utils &&
sudo apt-get install -y mediainfo &&
sudo apt-get install -y gcc &&
# Hardware
sudo apt-get install -y pulseaudio &&
sudo apt-get install -y powertop &&
sudo apt-get install -y xfce4-power-manager &&
sudo apt-get install -y xfce4-settings &&
sudo apt-get install -y xfce4-volumed &&

# Bumblebee status related items
sudo apt-get install -y python-dev &&
sudo apt-get install -y python-pip &&
pip install netifaces && pip install psutil &&

# Update repositories
sudo apt-get upgrade &&

# Bumblebee status
git clone git://github.com/tobi-wan-kenobi/bumblebee-status &&

# Get fonts
cp -v -r ./fonts/apercu/*.ttf /usr/share/fonts &&
rm -rf YosemiteSanFranciscoFont &&
sudo wget http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf &&
cp -v Monaco_Linux.ttf /usr/share/fonts &&
rm Monaco_Linux.ttf &&

# Copy configs
rm -rf ~/.i3 && mkdir ~/.i3 && cp ./config ~/.i3/config &&
sudo cp -rf ./bumblebee-status ~/.i3/bumblebee-status && rm -rf ./bumblebee-status &&

# oh my zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh &&

# Copy media key scripts to local bin
cp ./bright /usr/local/bin/bright &&

# Copy wallpaper
sudo cp ./wallpaper.jpeg ~/.i3/wallpaper.jpeg &&

# Clean up
sudo apt autoremove

#! /bin/bash

# Copy configs
rm -rf ~/.i3 && mkdir ~/.i3 &&
cp ./config ~/.i3/config &&
cp ./i3status.conf ~/.i3/i3status.conf &&

# Update core repositories
sudo apt-get update &&

# Install curl
sudo apt-get install curl &&

# Upgrade core apps
sudo apt-get upgrade &&

# Install packages
sudo apt-get install -y chromium-browser &&
sudo apt-get install -y thunar &&
sudo apt-get install -y gksu &&
sudo apt-get install -y feh &&
sudo apt-get install -y arandr &&
sudo apt-get install -y ranger &&
sudo apt-get install -y pulseaudio &&
sudo apt-get install -y powertop &&
sudo apt-get install -y xfce4-power-manager &&
sudo apt-get install -y xfce4-settings &&
sudo apt-get install -y xfce4-volumed &&

# VS code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&
sudo apt-get update &&
sudo apt-get install -y code &&

# Node
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - &&
sudo apt-get update &&
sudo apt-get install -y nodejs &&

# i3 / sur5r-keyring
sudo apt-get --allow-unauthenticated install sur5r-keyring &&
sudo apt-get update &&
sudo apt-get install -y i3 &&

# Arc gtk theme
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list" &&
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key &&
sudo apt-key add - < Release.key &&
sudo apt-get install -y arc-theme &&
rm -rf Release.key &&

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 &&
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list &&
sudo apt-get update &&
sudo apt-get install -y spotify-client &&

# Pick (color picker)
sudo add-apt-repository ppa:sil/pick &&
sudo apt-get update &&
sudo apt-get install -y pick-colour-picker &&

# Compton
sudo apt-add-repository ppa:richardgv/compton &&
sudo apt-get update &&
sudo apt-get install -y compton &&

# Font rendering
# sudo add-apt-repository ppa:no1wantdthisname/ppa &&
# sudo apt-get update &&
# sudo apt-get install -y fontconfig-infinality &&

# Bumblebee status
# git clone git://github.com/tobi-wan-kenobi/bumblebee-status &&
# sudo cp -rf ./bumblebee-status ~/.i3/bumblebee-status && rm -rf ./bumblebee-status &&

# Get fonts
sudo cp -v -r ./fonts/apercu/*.ttf /usr/share/fonts &&
wget http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf &&
sudo cp -v Monaco_Linux.ttf /usr/share/fonts &&
rm Monaco_Linux.ttf &&

# oh my zsh
sudo apt-get install -y zsh &&
sudo apt-get update &&
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh &&

# Clean up
sudo apt autoremove

echo "Done, you'll need to log out and in again. Enjoy!"

exit

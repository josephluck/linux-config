#! /bin/bash

# Update core repositories
sudo apt-get update &&

# Install curl
sudo apt-get install curl &&

# Upgrade core apps
sudo apt-get upgrade &&

# Install packages
sudo apt-get install -y chromium-browser &&
sudo apt-get install -y thunar &&
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
sudo apt-get update &&
sudo apt-get install -y compton &&

# oh my zsh
sudo apt-get install -y zsh &&
sudo apt-get update &&
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh &&

# Clean up
sudo apt autoremove

echo "Done, you'll need to log out and in again. Enjoy!"

exit

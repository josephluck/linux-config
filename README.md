# Bootstrap & Linux Dotfiles

This repository does the following

* Installs common useful packages (check `./install.sh` for the list)
* Sets up i3wm configuration keybindings. See `./config` for more info
* Sets up custom keybindings for scripts such as a lock screen with `cmd+shift+l` and screenshots with `cmd+shift+p`
* Contains configuration files for other programs (i.e. `ranger`, `compton` etc)
* Daemon for auto mounting external drives (`thunar`)
* Daemon for managing hardware keys including brightness and volume controls (`xfce`)
* Instructions for setting up things like `git` and `ohmyzsh`
* Barebones documentation for general day-to-day running of the machine

### Install git

```bash
sudo apt-get install -y git-core git
```

### Generate SSH key for git

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
git config --global user.email "your email" && git config --global user.name "your name"
cat ~/.ssh/id_rsa.pub
```

Copy terminal output to github ssh settings

### Clone this package

```bash
cd the-directory-you-want-your-code-to-live
git clone git@github.com:josephluck/linux-config.git
cd linux-config
```

### Install i3wm

If the below doesn't work, RTFM.

```bash
sudo -i
echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
logout
```

### Install packages

Take a look at `./install.sh` and install all the things! You can try running the command, but it's probably worth just copy and pasting in the bits you want.

### Apply oh my zsh

```bash
chsh -s `which zsh`
```

### Copy configurations

* `config` is the i3 config... `cp config ~/.config/i3/config`
* `i3status.conf` should go `cp i3status.conf ~/.config/i3/i3status.conf`
* `compton` is the compton compositor config, `cp compton ~/.config/compton/config`
* `rc.conf` is the ranger config, copy it to `cp rc.conf ~/.config/ranger/rc.conf` if you install ranger
* `screen.sh` is a tool for positioning a connected monitor to above the laptop. `cmd+shift+u` to move a workspace up, `cmd+shift+d` to move a workspace down

### Adjust theming / DPI

* Run `xfce4-appearance-settings`
* Adjust the DPI according to your needs. 96 is good for MBP, resolution-wise, 1920x1200 seems to work well.

### Reboot

```bash
reboot
```

### Included Tools

* `ranger` - CLI file explorer
* `arandr` - Screen layout editor GUI

### Useful (but not included tools)

Note that there's keybindings set up for a few of these in the i3 config, but unless you install these packages, they won't work (obvs)

* `maim` - Screenshot tool. There's a keybinding already set up at `cmd+shift+p` to take a shot a'la OSX. Timestamped images are stored in `~/Pictures`
* `cronopete` - Backup manager, you will need to set this up for your drive though
* `pulseaudio` - Audio device manager
* `playerctl` - Control audio from hardware buttons i.e. play, back, forward
* [`i3lock-fancy`](https://github.com/josephluck/i3lock-fancy-multimonitor) - Fancy lock screen - `cmd+shift+l` to lock, password to unlock
* `Sqlectron` - Linux SQL gui
* [`find`](https://github.com/sharkdp/fd) - Better find tool for bash

#### Clean up dependencies

```bash
sudo apt-get autoremove
```

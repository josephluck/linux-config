# Bootstrap & Linux Dotfiles

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

Take a look at `./install.sh` and install all the things!

### Apply oh my zsh

```bash
chsh -s `which zsh`
```

### Copy configurations

- `config` is the i3 config... `cp config ~/.config/i3/config`
- `i3status.conf` should go `cp i3status.conf ~/.config/i3/i3status.conf`
- `compton` is the compton config, `cp compton ~/.config/compton/config`
- `rc.conf` is the ranger config, copy it to `cp rc.conf ~/.config/ranger/rc.conf` if you install ranger
- `screen.sh` is a tool for positioning a connected monitor to above the laptop. `cmd+shift+u` to move a workspace up, `cmd+shift+d` to move a workspace down

### Adjust theming / DPI

Run `xfce4-appearance-settings`
Adjust the DPI according to your needs. 96 is good for MBP, resolution-wise, 1920x1200 seems to work well.

### Reboot

```bash
reboot
```

### Included Tools

- `ranger` - CLI file explorer
- `arandr` - Screen layout editor GUI

### Useful (but not included tools)

- `cronopete` - Backup manager
- `pulseaudio` - Audio device manager
- `scrot` - For taking screenshots
- `playerctl` Control audio from hardware buttons (fn keys)
- `maim` - Better screenshots tool. See `shot.sh` for some helpful scripts

#### Clean up dependencies

```bash
sudo apt-get auto-remove
```


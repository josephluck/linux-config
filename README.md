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

```bash
sudo -i
echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
logout
```

### Install packages

```bash
chmod +x ./install.sh
sudo ./install.sh
```

### Apply oh my zsh
```bash
chsh -s `which zsh`
```

### Reboot

```bash
reboot
```

### Optional Extras

I'd suggest you try out your installation before proceeding with the following.

#### Fix backlight

```bash
sudo nano /etc/default/grub
```

Change the line beginning with `GRUB_CMDLINE_LINUX_DEFAULT` to 
`GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video.use_native_backlight=1 intel_idle.max_cstate=1 acpi_backlight=vendor"`

```bash
sudo update-grub
sudo mkdir /etc/share/x11
sudo mkdir /etc/share/x11/xorg.conf.d
sudo touch /etc/share/x11/xorg.conf.d/80-backlight.conf
```

Paste the following and write out:
```
Section "Device"
    Identifier  "Intel Graphics"
    Driver      "intel"
    Option      "AccelMethod"     "sna"
    Option      "Backlight"       "ideapad" 
    BusID       "PCI:0:2:0"
EndSection
```

#### Fixup suspend on lid close

```bash
# echo XHC1 > /proc/acpi/wakeup
gksudo gedit /var/lib/polkit-1/localauthority/50-local.d/hibernate.pkla
```

Paste the following and save:

```
[Enable Hibernate]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes
```

#### Better Battery 

```bash
sudo apt-get update
sudo apt-get install powertop
```

Use the battery for a while... 30 mins should do

```bash
powertop autotune
```

### Better font rendering

```bash
sudo bash /etc/fonts/infinality/infctl.sh setstyle
```

I find that OSX2 works best. You can also:

```bash
sudo nano /etc/profile.d/infinality-settings.sh
```

Find the line `USE_STYLE` and replace `DEFAULT` with `OSX`

#### Clean up dependencies

```bash
sudo apt-get auto-remove
```


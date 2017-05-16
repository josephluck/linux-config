# Bootstrap & Config Linux

### Install i3

```bash
sudo -i
echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
logout
```

### Add hardware controls
1. Copy the bright shell script to local bin
`cp ./bright /usr/local/bin/bright`

2. Add the following to your /etc/sudoers:
`<username> ALL=NOPASSWD: /usr/local/bin/bright`

### Install packages

```bash
chmod +x ./install.sh
sudo ./install.sh
```

### Generate SSH key for git

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
cat ~/.ssh/id_rsa.pub
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

Copy terminal output to github ssh settings

### Fixup backlight

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

### Fixup suspend on lid close

```bash
gksudo gedit /var/lib/polkit-1/localauthority/50-local.d/hibernate.pkla
```

Paste the following and save:

```
[Enable Hibernate]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes
```

### Reboot

```bash
reboot
```
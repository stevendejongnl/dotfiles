# dotfiles

Dotfiles/Config files that work on my machine.


## Easy compare/sync files
```bash
./compare.sh
```


## Installed packages/applications
Use expac for installed packages by time
```bash
expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 500
```

### Yay (Yet Another Yogurt - An AUR Helper)
[Repo](https://github.com/Jguer/yay)
```bash
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```


### GPU drivers
[AMD Driver](https://archlinux.org/packages/extra/x86_64/xf86-video-amdgpu/)
```bash
pacman -S xf86-video-amdgpu
```


### Laptop specific tooling/fixes
[Power manager](https://docs.xfce.org/xfce/xfce4-power-manager/start)
```bash
pacman -S xfce4-power-manager
```

[Activating numlock on boot](https://wiki.archlinux.org/title/Activating_numlock_on_bootup)
```bash
pacman -S numlockx
```


### Bluetooth
[Bluetooth](https://wiki.archlinux.org/title/bluetooth)
[Blueman](https://wiki.archlinux.org/title/Blueman)
[Bluetooth headset](https://wiki.archlinux.org/title/bluetooth_headset)
```bash
pacman -S \
	blueman \
	bluez \
	bluez-utils \
	pulseaudio-bluetooth
```


### Fonts
```bash
pacman -S \
	ttf-ubuntumono-nerd \
	noto-fonts-emoji

yay -S \
	ttf-font-awesome-5 \
	ttf-weather-icons \
	ttf-material-icons-git \
	siji-ttf
```

 
### Browsers
```bash
pacman -S firefox
yay -S google-chrome
```


### Docker
```bash
pacman -S docker docker-compose
```
[Fix docker permissions](https://docs.docker.com/engine/install/linux-postinstall/)



### Utils
[Network Manager applet](https://archlinux.org/packages/extra/x86_64/network-manager-applet/)
```bash
pacman -S network-manager-applet
```

[go DiskUsage()](https://github.com/dundee/gdu)
```bash
pacman -S gdu
```

[Clipboard history plugin](https://github.com/xfce-mirror/xfce4-clipman-plugin)
```bash
pacman -S xfce4-clipman-plugin
```

[Lazygit](https://github.com/jesseduffield/lazygit)
```bash
pacman -S lazygit
```

[Gitlab Cli](https://glab.readthedocs.io/en/latest/)
```bash
pacman -S glab
```

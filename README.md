# dotfiles-i3

My dotfiles for i3-gaps on Arch linux on laptop.

## Overview

Main display:

![overview1](https://user-images.githubusercontent.com/48638671/171595960-034ebc51-6fd4-4aa2-802c-ef6d92cffac4.png)

Sub display:

![overview2](https://user-images.githubusercontent.com/48638671/171595967-832cff9d-64ee-489c-ab50-dcb342b118ce.png)

## How to install

### Preparation

Complete the following:

[dotfiles](https://github.com/Lamtea/dotfiles)
(My dotfiles for command line interface on Arch linux)

### Installation

```bash
paru -S <dependent packages>
# Options can use other packages or be ignored(see below 'Depend on' list).
# You may have to edit with the file by changing options.
# See Arch wiki for settings.
```

```bash
sudo systemctl enable <dependent service packages>
# Set and enable the required services.
#   NetworkManager, wpa_supplicant, apparmor, avahi-daemon, bluetooth, hddtemp,
#   clamav-daemon(optional), clamav-freshclam(optional), cups(optional), cups-browserd(optional),
#   lightdm(or lightdm-plymouth), nmb(optional), smb(optional), colord(optional),
#   docker(optional), containerd(optional), snapper(optional)
# See Arch wiki for settings.
sudo systemctl --user enable <dependent user service packages>
# Enable timidity(optional)
```

```bash
cd ~
git clone https://github.com/Lamtea/dotfiles-i3.git .dotfiles-i3
```

```bash
cd .dotfiles-i3
./install.sh
```

```bash
cd ~
cp <your favorite icon> .face
vi .bin/detect_display.sh
  PRIMARY_NAME="<your primary monitor name>" # run: xrandr
vi .bin/polybar_launch.sh
  DISPLAY_MAIN="<your primary monitor name>" # run: xrandr
  DISPLAY_SUB="<your secondary monitor name>" # run: xrandr
vi .config/polybar/config
  # Customize to your hardware.
```

```bash
sudo vi /etc/default/grub
  GRUB_CMDLINE_LINUX_DEFAULT="apparmor=1 lsm=lockdown,yama,apparmor audit=1 nvidia-drm.modeset=1..."
sudo update-grub
# Add apparmor,lsm,audit to kernel parameters.
# If you have NVIDIA Optimus, add nvidia-drm.
```

```bash
sudo systemctl reboot
```

Set the tools:

- theme:
  - lxappearrance-gtk3
    - Adapta-Nokto
    - Papirus-Dark
    - Flatbed Cursors original Black
    - Noto Sans CJK JP Regular
  - kvantum
    - KvAdaptaAark
  - fcitx5
    - nord

## Depend on

- [dotfiles](https://github.com/Lamtea/dotfiles)
  _(My dotfiles for command line interface on Arch linux)_
- X
  - xorg-server
  - xorg-apps _(not include xorg-xbacklight, replaced acpilight)_
  - xf86-input-wacom
    **(optional)**
    _(If you haven't wacom tablet,
    remove '.bin/setup_wacom.sh' and the relevant part from '.xprofile')_
  - srandrd _(aur)_
  - numlockx
- Graphics
  **(optional)**
  _(If you haven't NVIDIA Optimus,
  remove 'prime-run' from '.config/i3/config',
  and remove or edit '.config/mpv/mpv.conf')_
  - GPU
    - Intel _(UHD 630)_
    - NVIDIA Optimus _(GeForce MX150)_
      - nvidia-prime
      - nvidia-settings
  - Hardware video acceleration
    - libva-intel-driver
    - intel-gpu-tools
    - libva-utils
    - libvdpau-va-gl
    - vdpauinfo
  - Vulkan
    - vulkan-icd-loader
    - vulkan-headers
    - vulkan-validation-layers
    - vulkan-tools
    - vulkan-intel
    - nvidia-utils
  - OpenCL
    - opencl-headers
    - ocl-icd
    - intel-compute-runtime
    - opencl-nvidia
  - CUDA
    - cuda
    - cuda-tools
    - ncurses5-compat-libs _(aur)_
    - opencv-cuda
    - python-cuda
    - python-pycuda
  - Machine learning
    - cudnn
    - tensorflow-opt-cuda
    - python-tensorflow-opt-cuda
- Icon
  - papirus-icon-theme
- Cursor
  - xcursor-flated
- Font
  - noto-fonts
  - noto-fonts-cjk
  - noto-fonts-emoji
  - noto-fonts-extra
  - ttf-ricty _(aur)_
  - ttf-hackgen _(aur)_
  - ttf-meslo-nerd-font-powerlevel10k _(aur)_
  - nerd-fonts-complete _(aur)_
  - fantasque-sans-mono
  - ttf-monapo
  - ttf-liberation **(optional)** _(for steam)_
  - font-manager _(font viewer)_
- Theme manager
  - Gtk
    - lxappearrance-gtk3
  - Qt
    - kvantum
- Login manager
  - lightdm _(If you are using plymouth, use ligtdm-plymouth.service)_
    - lightdm-webkit2-greeter
    - lightdm-webkit-theme-litarvan
- User manager
  - mugshot _(aur)_
- Window manager
  - i3-gaps
- Status bar
  - polybar
    - procps-ng
    - nvidia-smi
      **(optional)**
      _(If you haven't NVIDIA Optimus,
      remove '.bin/nvidiatemp.sh' and the relevant part form '.config/polybar/config')_
    - hddtemp
      - gnu-netcat
- Menu
  - dockbarx _(aur)_
  - rofi
    - rofi-calc
    - rofi-dmenu _(aur)_
  - xfce4-appfinder
- Compositor
  - picom/compton
- Background
  - nitrogen
- Display
  - Display CAL
    **(optional)**
    _(If you haven't monitor for creators,
    remove a line of 'exec --no-startup-id displaycal-apply-profiles' from '.config/i3/config')_
    - displaycal-apply-profiles
    - colord
      - colord-gtk
      - colord-sane
  - Redshift
    - redshift
- Audio
  - pulseaudio
    - pulseaudio-alsa
    - pluseaudio-bluetooth
    - pluseaudio-zeroconf
    - volumeicon
    - pavucontrol
- Geolocation
  - geoclue
- Notify daemon
  - dunst
- System monitor
  - conky-lua-nv
    **(optional)**
    _(aur, If you are not sure,
    remove lines of 'exec --no-startup-id conky-lua-nv' from '.config/i3/config')_
- Package manager
  - paru _(aur)_
  - octopi _(aur)_
  - snapd _(aur)_
- Linux security module
  - apparmor
- Policy kit
  - polkit-gnome
- Keyring
  - gnome-keyring _(from dotfiles)_
  - libgnome-keyring _(from dotfiles)_
  - seahorse
- Network manager
  - networkmanager
- mDNS
  - avahi
- Windows cooperation **(optional)**
  - samba
- Bluetooth manager
  - blueman
- Clipboard manager
  - clipit
- Power manager
  - systemd-logind
  - tlp
  - tlpui-git _(aur)_
  - thermald
- Screen locker
  - // xss-lock
  - // xautolock
  - // xscreensaver
  - light-locker
- Screen shooter
  - scrot
  - flameshot
- Terminal
  - rxvt-unicode
  - alacritty
- File manager
  - thunar
    - thunar-archive-plugin
      **(optional)**
      _(depend on Archiver)_
    - thunar-media-tags-plugin
    - thunar-volman
    - thunar-dropbox
      **(optional)**
      _(aur, require dropbox account)_
    - thunar-shares-plugin
      **(optional)**
      _(aur, depend on samba)_
    - thunar-vcs-plugin _(aur)_
    - thunar-sendto-clamtk
      **(optional)**
      _(aur, depend on clamav/clamtk)_
    - gvfs
      - gvfs-smb
      - gvfs-mtp
      - gvfs-gphoto2
      - gvfs-afc
    - tumbler
    - raw-thumbnailer _(aur)_
    - catfish
  - ranger _(from dotfiles)_
- Archiver **(optional)**
  - xarchiver
- Editor
  - neovim _(from dotfiles)_
  - mousepad **(optional)**
- Browser
  - w3m _(from dotfiles)_
  - vivaldi
    - vivaldi-ffmepg-codecs
  - brave-bin _(aur)_
  - google-chrome-stable _(aur)_
  - firefox-developer-edition
    - firefox-developer-edition-i18n-\* _(your locale)_
    - youtube-dl
- Mail
  - postfix _(from dotfiles)_
  - neomutt _(from dotfiles)_
  - thunderbird
  - birdtray _(aur)_
- Music player
  - mpd
  - ncmpcpp
  - cantata
  - spotify _(aur)_
  - timidity++ **(optional)**
- Input method
  - fcitx5-im
  - fcitx5-nord
  - fcitx5-mozc
- PDF Viewer **(optional)**
  - zathura
    - zathura-ps
    - zathura-pdf-mupdf
    - zathura-djvu
    - zathura-cb
    - mupdf
  - epdfview
- Printer & scanner **(optional)**
  - cups
    - brother DCP-J152N printer driver _(brother official)_
    - cups-pdf
    - cups-pk-helper
    - cups-filters
    - system-config-printer
    - bluez-cups
- Virus scanner **(optional)**
  - clamav
  - clamtk
- Writer **(optional)**
  - xfburn
  - etcher-bin _(aur)_
  - rpi-imager _(aur)_
- Firewall
  - ufw
  - gufw
- Cloud
  - rclone _(from dotfiles)_
    **(optional)**
    _(If you are not sure,
    remove lines of 'exec --no-startup-id ~/.bin/rclone_mount.sh' from '.config/i3/config')_
- System admin **(optional)**
  - gparted
    - parted
  - gsmartcontrol
    - smartmontools
  - snapper-gui-git _(aur, btrfs user only)_
    - snapper
    - snap-pac
    - snap-pac-grub _(aur)_
    - grub-btrfs
- Utility **(optional)**
  - qtqr
- Systemtray application
  - udiskie
  - remmina
  - osmo
  - my-weather-indicator-git _(aur)_
  - veracrypt
  - uget
    - uget-integrator _(aur)_
    - uget-integrator-firefox _(aur)_
  - xpad
  - joplin-appimage _(aur)_
  - slack-desktop _(aur)_
- Developer tool
  - visual-studio-code-bin _(aur)_
  - dbeaver
  - meld
  - wireshark-qt
  - wireshark-cli
  - filezilla **(optional)**
  - docker **(optional)**
    - docker-compose **(deplicated)**
  - containerd **(optional)**
    - nerdctl
  - virtualbox **(optional)**
    - virtualbox-guest-iso
    - virtualbox-guest-utils
    - vitrualbox-host-dkms _(for linux-zen users)_
    - virtualbox-ext-oracle _(aur)_
- Creator tool
  - krita
  - gimp
    - gimp-plugin-gmic
    - gimp-nufraw
    - gimp-help-\* _(your locale)_
  - inkscape
  - blender
- Main application
  - discord
  - twinux _(from snap)_
  - jdim-git _(aur)_
  - lutris
  - steam _(multilib)_
  - speedcrunch
  - calibre
  - mcomix _(aur)_
  - geeqie
  - xsane
    **(optional)**
    _(If you haven't scanner,
    remove a line of 'exec xsane' from '.config/i3/config')_
    - xsane-gimp
  - smplayer
    - smplayer-skins
    - smplayer-themes
    - mpv
  - peek
  - libreoffice-fresh-\* _(your locale)_

## i3-gaps settings

- Mod key
  - \<Super\>
- Workspace layout
  - Tiling
- Default border pixel
  - 1
- Default floating border
  - Normal
- Hide edge borders
  - None
- Workspace auto back and forth
  - Yes
- Gaps inner
  - 14
- Gaps outer
  - -2
- Smart gaps
  - On
- Smart borders
  - On
- Fonts
  - Noto Sans CJK JP
  - NotoSans Nerd Font

### Window and workspace navigation

| Key                 | Motion                                                  |
| ------------------- | ------------------------------------------------------- |
| Mod + Mouse         | Drag floating windows                                   |
| Mod + U             | Change border none                                      |
| Mod + Y             | Change border 1 pixel                                   |
| Mod + N             | Change border normal                                    |
| Mod + Alt + Enter   | Kill focused window                                     |
| Mod + Alt + Button3 | Kill focused window (Button3 is mouse right button)     |
| Mod + HJKL          | Change focus                                            |
| Mod + Shift + HJKL  | Move focused window                                     |
| Mod + B             | Move workspace back and forth                           |
| Mod + Shift + B     | Move container to workspace back and forth              |
| Mod + Ctrl + H      | Change split orientation to horizontal                  |
| Mod + Ctrl + V      | Change split orientation to Vertical                    |
| Mod + Q             | Toggle split orientation                                |
| Mod + F             | Toggle fullscreen mode                                  |
| Mod + S             | Change container layout to stacked                      |
| Mod + W             | Change container layout to tabbed                       |
| Mod + E             | Toggle container layout                                 |
| Mod + Shift + Space | Toggle tiling/floating of focused window                |
| Mod + Space         | Change focus between tiling/floating windows            |
| Mod + Shift + S     | Toggle sticky of focused window                         |
| Mod + A             | Focus the parent container                              |
| Mod + Shift + Minus | Move focused window to the scratchpad                   |
| Mod + Minus         | Show the next scratchpad window or hide the focused one |
| Mod + Shift + \[    | Switch to previous workspace                            |
| Mod + Shift + \]    | Switch to next workspace                                |
| Mod + 1〜8          | Switch to numbered workspace                            |
| Mod + Ctrl + 1〜8   | Move focused container to workspace                     |
| Mod + Shift + 1〜8  | Move to workspace with focused container                |

### Resize mode navigation

| Key         | Motion                |
| ----------- | --------------------- |
| Mod + R     | Enter the resize mode |
| Mod + HJKL  | Resize focused window |
| Mod + Enter | Exit the resize mode  |
| Mod + ESC   | Exit the resize mode  |

### Gaps mode navigation

| Key             | Motion                     |
| --------------- | -------------------------- |
| Mod + Shift + G | Enter the gaps mode        |
| O               | Enter the gaps outer mode  |
| I               | Enter the gaps inner mode  |
| Plus            | Gaps outer/inner +5        |
| Minus           | Gaps outer/inner -5        |
| 0               | Gaps outer/inner set 0     |
| Shift + Plus    | Gaps outer/inner all +5    |
| Shift + Minus   | Gaps outer/inner all -5    |
| Shift + 0       | Gaps outer/inner all set 0 |
| Enter           | Exit the gaps mode         |
| ESC             | Exit the gaps mode         |

### Menu shortcuts

| Key     | Motion          |
| ------- | --------------- |
| Mod + D | rofi            |
| Mod + Z | xfce4-appfinder |

### System shortcuts

| Key                    | Motion                                             |
| ---------------------- | -------------------------------------------------- |
| Mod + Shift + C        | Reload the configuration file                      |
| Mod + Shift + R        | Restart i3                                         |
| Mod + Shift + E        | Exit i3                                            |
| Mod + 0                | Set shutdown, restart and locking features         |
| Mod + 9                | Lock screen                                        |
| Mod + Ctrl + M         | Control audio volume (exec pavucontrol)            |
| Mod + Ctrl + W         | Control firewall (exec gufw)                       |
| Mod + Ctrl + X         | Kill window (exec xkill)                           |
| Mod + T                | Disable compositor (kill picom/compton)            |
| Mod + Shift + T        | Enable compositor (exec picom/compton)             |
| Mod + Shift + D        | Restart notify daemon (kill dunst & restart dunst) |
| Print                  | Print full screen (exec flameshot)                 |
| Mod + Print            | Print active window (exec scrot)                   |
| Mod + Shift + Print    | Print active screen (exec flameshot)               |
| Mod + Ctrl + Print     | Print selection (exec flameshot)                   |
| Mod + Shift + Ctrl + H | Show this repository (dotfiles-i3)                 |

### Application shortcuts

| Key               | Motion                                |
| ----------------- | ------------------------------------- |
| Mod + Enter       | urxvt                                 |
| Mod + Button3     | urxvt (Button3 is mouse right button) |
| Mod + F1          | thunar                                |
| Mod + Shift + F1  | catfish                               |
| Mod + Ctrl + F1   | ranger                                |
| Mod + F2          | vivaldi-stable                        |
| Mod + Shift+ F2   | brave(incognito, tor)                 |
| Mod + Ctrl + F2   | w3m                                   |
| Mod + F3          | thunderbird                           |
| Mod + Ctrl + F3   | neomutt                               |
| Mod + F4          | cantata                               |
| Mod + Shift + F4  | spotify                               |
| Mod + Ctrl + F4   | ncmpcpp                               |
| Mod + F5          | discord                               |
| Mod + Shift + F5  | twinux                                |
| Mod + F6          | jdim                                  |
| Mod + F7          | lutris                                |
| Mod + Shift + F7  | steam                                 |
| Mod + F8          | speedcrunch                           |
| Mod + Shift + F8  | alacritty                             |
| Mod + F9          | calibre                               |
| Mod + Shift + F9  | mcomix                                |
| Mod + F10         | geeqie                                |
| Mod + Shift + F10 | xsane                                 |
| Mod + F11         | smplayer                              |
| Mod + Shift + F11 | peek                                  |
| Mod + F12         | libreoffice-calc                      |
| Mod + Shift + F12 | libreoffice-writer                    |
| Mod + Alt + C     | google-chrome-stable                  |
| Mod + Alt + F     | firefox-developer-edition             |
| Mod + Alt + Z     | firefox-developer-edition(debugger)   |
| Mod + Alt + V     | visual-studio-code                    |
| Mod + Alt + D     | dbeaver                               |
| Mod + Alt + M     | meld                                  |
| Mod + Alt + W     | wireshark                             |
| Mod + Alt + K     | krita                                 |
| Mod + Alt + G     | gimp                                  |
| Mod + Alt + I     | inkscape                              |
| Mod + Alt + B     | blender                               |

## Shell scripts

| Name                  | Description                   |
| --------------------- | ----------------------------- |
| arch_updates.sh       | check package updates.        |
| detect_display.sh     | set xrandr.                   |
| hddtemp.sh            | get hddtemp.                  |
| nvidiatemp.sh         | get nvidia card temperature.  |
| polybar_launch.sh     | start polybar.                |
| rofi_launch.sh        | start rofi.                   |
| rofi_powermenu.sh     | start rofi power menu.        |
| setup_touchpad.sh     | disable touch pad.            |
| setup_wacom.sh        | enable wacom pen tablet.      |
| open_with_linux.py    | script for firefox extension. |
| get-windowclass-i3.sh | get window class name for i3. |

## Development

- bash
- bashdb
- python
- lua
- git
- nodejs
  - bash-language-server
- vscode
- neovim

# dotfiles-i3

My dotfiles for i3 on Arch linux on laptop.

## Overview

Main display:

![overview1](https://user-images.githubusercontent.com/48638671/171595960-034ebc51-6fd4-4aa2-802c-ef6d92cffac4.png)

Sub display:

![overview2](https://user-images.githubusercontent.com/48638671/171595967-832cff9d-64ee-489c-ab50-dcb342b118ce.png)

## My Base Configurations

Only settings related to the 'Depend on' list are excerpted.

| Category    | Configuration                                                   |
| ----------- | --------------------------------------------------------------- |
| Boot Loader | GRUB 2                                                          |
| Kernel      | Linux Zen, Linux, Linux LTS                                     |
| File System | Btrfs on LVM on LUKS2 (SSD, HDD)                                |
| Graphic     | Intel UHD 630, NVIDIA GeForce MX150 (NVIDIA Optimus)            |
| Network     | Realtek RTL8169 (LAN), Intel Wireless-AC 9560 (WiFi, Bluetooth) |
| Monitor     | Laptop Built-in(eDP-1 connected), LG24UD58(HDMI-2 connected)    |
| Tablet      | Wacom Intuos 4                                                  |
| Printer     | Brother DCP-J152N                                               |
| Scanner     | Brother DCP-J152N                                               |

## How to Install

### Preparation

Please complete the following tasks:

[dotfiles](https://github.com/Lamtea/dotfiles)
(My dotfiles for command-line interface on Arch linux)

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
#   libvirtd(optional), snapper(optional)
# See Arch wiki for settings.
sudo systemctl --user enable <dependent user service packages>
# Enable mpd
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
  # For Localization, see below `Localization'.
```

```bash
sudo vi /etc/default/grub
  GRUB_CMDLINE_LINUX_DEFAULT="lsm=landlock,lockdown,yama,integrity,apparmor,bpf ..."
sudo update-grub
# Add lsm to kernel parameters.
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
  - fcitx5 **(optional)**
    - nord

## Depend on

- [dotfiles](https://github.com/Lamtea/dotfiles)
  _(My dotfiles for command-line interface on Arch linux)_
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
  - noto-fonts-\* **(optional)** _(your locale, cjk is default)_
  - noto-fonts-emoji
  - noto-fonts-extra
  - ttf-ricty **(optional)** _(aur, Japanese font, urxvt use it)_
  - ttf-hackgen **(optional)** _(aur, Japanese font, alacritty use it)_
  - ttf-meslo-nerd-font-powerlevel10k _(aur)_
  - nerd-fonts-complete _(aur)_
  - fantasque-sans-mono
  - ttf-monapo **(optional)** \_(aur, Japanese font, jdim use it)
  - ttf-liberation **(optional)** _(for steam)_
  - font-manager _(font viewer)_
- Theme manager
  - Gtk
    - lxappearrance-gtk3
  - Qt
    - kvantum
- Login manager
  - lightdm _(If you are using plymouth, use ligtdm-plymouth.service)_
    - lightdm-gtk-greeter
    - lightdm-gtk-greeter-settings
- User manager
  - mugshot _(aur)_
- Window manager
  - i3-wm
- Status bar
  - polybar
    - procps-ng
    - nvidia-smi
      **(optional)**
      _(If you haven't NVIDIA Optimus,
      remove '.bin/nvidiatemp.sh' and the relevant part form '.config/polybar/config')_
    - hddtemp
      - openbsd-netcat
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
  - pipewire
    - lib32-pipewire
    - wireplumber
    - helvum
    - pipewire-alsa
    - pipewire-pulse
    - pipewire-jack
    - lib32-pipewire-jack
    - volumeicon
    - pavucontrol
    - gst-plugin-pipewire
- Geolocation
  - geoclue
- Notify daemon
  - dunst
- System monitor
  - conky-lua-nv
    **(optional)**
    _(aur, If you are not sure,
    remove lines of 'exec --no-startup-id conky' from '.config/i3/config')_
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
  - rxvt-unicode-truecolor-wide-glyphs _(aur)_
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
- Input method
  **(optional)**
  _(If you don't use it,
  remove a line of 'exec --no-startup-id fcitx5' from '.config/i3/config')_
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
  - android-studio _(aur)_
  - dbeaver
  - meld
  - wireshark-qt
  - wireshark-cli
  - filezilla **(optional)**
- Virtual machine **(optional)**
  - virt-manager
    - qemu-desktop
    - libvirt
    - edk2-ovmf
    - dnsmasq
    - iptables-nft
  - virtualbox
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
  - jdim
    **(optional)**
    _(snap, If you don't use it, remove a line of 'exec jd.sh' from '.config/i3/config')_
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

## Localization

- Edit font settings.
  - `Noto * CJK JP`, `ricty`, `HackGenNerd` # change your locale.
- Edit `.config/conky/archer-conky-left.conf`.
  - `### Datetime` section.
    - `${time %Y年%m月%d日}$` # change your locale.

## i3

See: [Wiki](https://github.com/Lamtea/dotfiles-i3/wiki/i3)

## Shell Scripts

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
- python
- lua
- git
- neovim

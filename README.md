# dotfiles-i3

My dotfiles for i3-gaps on Arch linux on laptop.

## How to install

### Preparation

Complete the following:

[dotfiles](https://github.com/Lamtea/dotfiles)
(My dotfiles for command line interface on Arch linux)

### Installation

```bash
> cd ~
> git clone https://github.com/Lamtea/dotfiles-i3.git .dotfiles-i3
```

```bash
> cd .dotfiles-i3
> ./install.sh
```

```bash
> paru -S <dependent packages>
> # Options should use other packages or be ignored.
> # You may have to edit with the file by changing options.
> # See Arch wiki for settings.
```

```bash
> sudo systemctl enable <dependent service packages>
> # Set and enable the required services.
> #   NetworkManager, wpa_supplicant, apparmor, avahi-daemon(optional), bluetooth,
> #   clamav-daemon(optional), clamav-freshclam(optional), cups(optional), cups-browserd(optional),
> #   hddtemp, lightdm(or lightdm-plymouth), nmb(optional), smb(optional), colord(optional),
> #   docker(optional), containerd(optional), snapper(optional)
> # See Arch wiki for settings.
> sudo systemctl --user enable <dependent user service packages>
> # Enable mpd, timimidity(optional)
```

```bash
> cd ~
> cp <your favorite icon> .face
> vi .bin/detect_display.sh
>   PRIMARY_NAME="<your primary monitor name>" # run: xrandr
> vi .bin/polybar_launch.sh
>   DISPLAY_MAIN="<your primary monitor name>" # run: xrandr
>   DISPLAY_SUB="<your secondary monitor name>" # run: xrandr
> vi .config/polybar/config
>   # Customize to your hardware.
```

```bash
> sudo vi /etc/default/grub
>   GRUB_CMDLINE_LINUX_DEFAULT="apparmor=1 lsm=lockdown,yama,apparmor audit=1 nvidia-drm.modeset=1..."
> sudo update-grub
> # Add apparmor,lsm,audit to kernel parameters.
> # If you have NVIDIA Optimus, add nvidia-drm.
```

```bash
> sudo systemctl reboot
```

Set the tools:

- themes:
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
  (My dotfiles for command line interface on Arch linux)
- X
  - xorg-server
  - xorg-apps(not include xorg-xbacklight, replaced acpilight)
  - xf86-input-wacom
    (optional)
    (If you haven't wacom tablet,
    remove '.bin/setup_wacom.sh' and the relevant part from '.xprofile')
  - srandrd
  - numlockx
- Graphics
  (optional)
  (If you haven't NVIDIA Optimus,
  remove 'prime-run' and 'LIBVA_DRIVER_NAME="nvidia"' from '.config/i3/config')
  - GPU
    - Intel(UHD 630)
    - NVIDIA Optimus(GeForce MX150)
      - nvidia-prime
      - nvidia-settings
  - Hardware video acceleration
    - intel-media-driver
    - intel-gpu-tools
    - libva-utils
    - libvdpau-va-gl
    - vdpauinfo
    - libva-nvidia-driver(for firefox-developer-edition)
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
    - ncurses5-compat-libs
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
  - ricty
  - hackgen
  - meslo-nerd-font-powerlevel10k
  - nerd-fonts-complete(noto, hack, fantasque)
  - fantasque-sans-mono
  - monapo
  - liberation(optional)(for steam)
  - font-manager(font viewer)
- Theme manager
  - Gtk
    - lxappearrance-gtk3
  - Qt
    - kvantum
- Login manager
  - lightdm(use: lightdm-plymouth)
    - lightdm-webkit2-greeter
    - lightdm-webkit-theme-litarvan
- User manager
  - mugshot
- Window manager
  - i3-gaps
- Status bar
  - polybar
    - procps-ng
    - nvidia-smi
      (optional)
      (If you haven't NVIDIA Optimus,
      remove '.bin/nvidiatemp.sh' and the relevant part form '.config/polybar/config')
    - hddtemp
      - gnu-netcat
- Menu
  - dockx
  - rofi
  - xfce4-appfinder
- Compositor
  - picom/compton
- Background
  - nitrogen
- Display
  - Display CAL
    (optional)
    (If you haven't monitor for creators,
    remove a line of 'exec --no-startup-id displaycal-apply-profiles' from '.config/i3/config')
    - displaycal-apply-profiles
    - colord
  - Redshift
    - redshift-gtk
- Audio
  - Pulse audio
    - volumeicon
    - pavucontrol
- Geolocation
  - GeoClue
    - geoclue-2.0
- Notify daemon
  - dunst
- System monitor
  - conky-lua-nv
    (optional)
    (If you are not sure,
    remove lines of 'exec --no-startup-id conky-lua-nv' from '.config/i3/config')
- Package manager
  - paru
  - octopi
  - snap
- Linux security module
  - App Armor
    - aa-notify
- Policy kit
  - Polkit gnome
    - polkit-gnome-authentication-agent-1
- Keyring
  - gnome-keyring (from dotfiles)
  - libgnome-keyring (from dotfiles)
  - seahorse(optional)
- Network manager
  - nm-applet
- mDNS(optional)
  - avahi
- Windows cooperation(optional)
  - samba
- Bluetooth manager
  - Blueman
    - blueman-applet
- Clipboard manager
  - clipit
- Power manager
  - systemd-logind
  - tlp
  - tlp-ui
  - thermald
- Screen locker
  - // xss-lock
  - // xautolock
  - // xscreensaver
  - // light-locker
- Screen shooter
  - scrot
  - flameshot
- Terminal
  - rxvt-unicode
  - alacritty
- File manager
  - Thunar
    - thunar
    - thunar-archive-plugin
      (optional)
      (depend on Archiver)
    - thunar-media-tags-plugin
    - thunar-volman
    - thunar-dropbox
      (optional)
      (require dropbox account)
    - thunar-shares-plugin
      (optional)
      (depend on samba)
    - thunar-vcs-plugin
    - thunar-sendto-clamtk
      (optional)
      (depend on clamav/clamtk)
    - gvfs
    - tumbler
    - raw-thumbnailer
    - catfish
  - ranger(from dotfiles)
- Archiver(optional)
  - Xarchiver
- Editor
  - neovim(from dotfiles)
  - mousepad(optional)
- Browser
  - w3m(from dotfiles)
  - vivaldi-stable
  - brave-bin
  - google-chrome-stable
  - firefox-developer-edition
- Mail
  - postfix(from dotfiles)
  - neomutt(from dotfiles)
  - thunderbird
  - birdtray
- Music player
  - mpd
  - ncmpcpp
  - cantata
  - spotify
  - timidity++(optional)
- Input method
  - fcitx5-im
  - fcitx5-nord
  - fcitx5-mozc
- PDF Viewer(optional)
  - zathura
    - mupdf
  - epdfview
- Printer & scanner(optional)
  - CUPS
    - brother DCP-J152N printer driver (brother official)
    - cups-pdf
  - brscan4
  - brscan-skey
- Virus scanner(optional)
  - clamav
  - clamtk
- Writer(optional)
  - xfburn
  - etcher-bin
- Firewall
  - ufw
  - gufw
- Cloud
  - rclone(from dotfiles)
    (optional)
    (If you are not sure,
    remove lines of 'exec --no-startup-id ~/.bin/rclone_mount.sh' from '.config/i3/config')
- Utility(optional)
  - qtqr
- System admin(optional)
  - gparted
  - gsmartcontrol
  - snapper-gui-git(btrfs user only)
    - snapper
    - snap-pac
    - grub-btrfs
- Systemtray application
  - udiskie
  - remmina
  - osmo
  - my-weather-indicator
  - veracrypt
  - uget
  - xpad
  - joplin(appimage)
  - slack
- Developer tool
  - visual-studio-code-bin
  - dbeaver
  - meld
  - wireshark
  - filezilla(optional)
  - docker(optional)
    - docker-compose(deplicated)
  - containerd(optional)
    - nerdctl
  - virtualbox(optional)
- Creator tool
  - krita
  - gimp
  - inkscape
  - blender
- Main application
  - discord
  - twinux(from snap)
  - jd
  - lutris
  - steam
  - speedcrunch
  - calibre
  - mcomix
  - geeqie
  - xsane
    (optional)
    (If you haven't scanner,
    remove a line of 'exec xsane' from '.config/i3/config')
  - smplayer
  - peek
  - libreoffice

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

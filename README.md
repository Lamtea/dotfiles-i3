# dotfiles-i3

My dotfiles for i3-gaps on Arch linux.

## How to install

Run this command: `install.sh`

## On depends

- dotfiles
  - My dotfiles for command line interface on Arch linux
- X
  - xorg-apps
  - srandrd
  - numlockx
- Font
  - noto-fonts
  - noto-fonts-cjk
  - noto-fonts-emoji
  - noto-fonts-extra
  - ricty
  - hackgen
  - meslo-nerd-font-powerlevel10k
  - nerd-fonts-complete
    - noto
    - hack
    - fantasque
  - fantasque-sans-mono
  - monapo
  - steam-fonts
  - liberation
- Login manager
  - lightdm
    - lightdm-webkit2-greeter
    - lightdm-webkit-theme-litarvan
- Window manager
  - i3-gaps
- Status bar
  - polybar
- Menu
  - dockx
  - menutray
  - rofi
  - xfce4-appfinder
  - bemenu (from dotfiles)
- Compositor
  - picom/compton
- Background
  - nitrogen
- Display
  - Display CAL
    - displaycal-apply-profiles
  - Red shift
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
  - seahorse
- Network manager
  - Network manager
    - nm-applet
- Bluetooth manager
  - Blueman
    - blueman-applet
- Clipboard manager
  - clipit
- Power manager
  - systemd-logind
  - tlp
  - tlp-ui
- Screen locker
  - xss-lock
  - xautolock
  - xscreensaver
  - light-locker
- Screen shooter
  - scrot
  - flameshot
- Terminal
  - urxvt
  - alacritty
- File manager
  - Thunar
    - thunar
    - thunar-archive-plugin
    - thunar-media-tags-plugin
    - thunar-volman
    - thunar-dropbox
    - thunar-shares-plugin
    - thunar-vcs-plugin
    - thunar-sendto-clamtk
    - gtkhash-thunar
    - gvfs
    - tumbler
    - raw-thumbnailer
    - catfish
  - ranger
- Editor
  - Neovim (from dotfiles)
    - nvim
  - mousepad
- Browser
  - w3m (from dotfiles)
  - firefox-developer-edition
  - google-chrome-stable
- Mail
  - postfix
  - neomutt (from dotfiles)
  - thunderbird
  - birdtray
- Music player
  - mpd
  - ncmpcpp
  - cantata
  - spotify
- Input method
  - fcitx5
  - mozc
- Printer & scanner
  - CUPS
    - brother DCP-J152N printer driver (brother official)
    - cups-pdf
  - brscan4
  - brscan-skey
- Virus scanner
  - clamav
  - clamtk
- Firewall
  - ufw
  - gufw
- Cloud
  - rclone (from dotfiles)
- Systemtray application
  - udiskie
  - remmina
  - osmo
  - my-weather-indicator
  - veracrypt
  - uget
  - xpad
  - joplin
  - slack
- Developer tool
  - visual-studio-code-bin
  - android-studio
  - dbeaver
  - meld
  - wireshark
- Creator tool
  - krita
  - gimp
  - inkscape
  - blender
- Main application
  - discord
  - twinux
  - jd
  - lutris
  - steam
  - speedcrunch
  - transmission-gtk
  - calibre
  - mcomix
  - geeqie
  - xsane
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

| Key                 | Motion                                                                |
| ------------------- | --------------------------------------------------------------------- |
| Mod + Mouse         | Drag floating windows                                                 |
| Mod + U             | Change border none                                                    |
| Mod + Y             | Change border 1 pixel                                                 |
| Mod + N             | Change border normal                                                  |
| Mod + Alt + Enter   | Kill focused window                                                   |
| Mod + Alt + Button3 | Kill focused window (Button3 is mouse right button)                   |
| Mod + HJKL          | Change focus                                                          |
| Mod + Shift + HJKL  | Move focused window                                                   |
| Mod + B             | Move workspace back and forth                                         |
| Mod + Shift + B     | Move container to workspace back and forth                            |
| Mod + Ctrl + H      | Change split orientation to horizontal                                |
| Mod + Ctrl + V      | Change split orientation to Vertical                                  |
| Mod + Q             | Toggle split orientation                                              |
| Mod + F             | Toggle fullscreen mode                                                |
| Mod + S             | Change container layout to stacked                                    |
| Mod + W             | Change container layout to tabbed                                     |
| Mod + E             | Toggle container layout                                               |
| Mod + Shift + Space | Toggle tiling/floating of focused window                              |
| Mod + Space         | Change focus between tiling/floating windows                          |
| Mod + Shift + S     | Toggle sticky of focused window                                       |
| Mod + A             | Focus the parent container                                            |
| Mod + Shift + Minus | Move focused window to the scratchpad                                 |
| Mod + Minus         | Show the next scratchpad window or hide the focused scratchpad window |
| Mod + Shift + \[    | Switch to previous workspace                                          |
| Mod + Shift + \]    | Switch to next workspace                                              |
| Mod + 1〜8          | Switch to numbered workspace                                          |
| Mod + Ctrl + 1〜8   | Move focused container to workspace                                   |
| Mod + Shift + 1〜8  | Move to workspace with focused container                              |

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

| Key            | Motion          |
| -------------- | --------------- |
| Mod + D        | rofi            |
| Mod + Z        | xfce4-appfinder |
| Mod + Ctrl + B | bemenu          |

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
| Mod + F2          | firefox-developer-edition             |
| Mod + Shift + F2  | google-chrome-stable                  |
| Mod + Ctrl + F2   | w3m                                   |
| Mod + F3          | thunderbird                           |
| Mod + Ctrl + F3   | neomutt                               |
| Mod + F4          | cantata                               |
| Mod + Shift + F4  | spotify                               |
| Mod + Ctrl + F4   | ncmpcpp                               |
| Mod + F5          | discord                               |
| Mod + Shift + F5  | twinux                                |
| Mod + F6          | jdim                                  |
| Mod + Ctrl + F6   | transmission                          |
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
| Mod + Alt + V     | visual-studio-code                    |
| Mod + Alt + A     | android-studio                        |
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
| get_windowclass_i3.sh | get window class name for i3. |

## Development

- bash
- bashdb
- python
- git
- nodejs
  - bash-language-server
- vscode

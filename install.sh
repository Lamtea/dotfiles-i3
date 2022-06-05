#!/bin/bash

# nounset, errexit
set -ue

create_dotfile_links() {
	local dotfiles_or_dirs=("${@}")

	local srcdir
	srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

	local dotbackupdir="${HOME}/.dotbackup-i3"
	if [[ ! -d "${dotbackupdir}" ]]; then
		mkdir "${dotbackupdir}"
	fi

	for dotfile_or_dir in "${dotfiles_or_dirs[@]}"; do
		local srcfile_or_dir="${srcdir}/${dotfile_or_dir}"
		local dstfile_or_dir="${HOME}/${dotfile_or_dir}"
		local backupfile_or_dir="${dotbackupdir}/${dotfile_or_dir}"

		local dstdir
		local backupdir
		dstdir="$(dirname "${dstfile_or_dir}")"
		backupdir="$(dirname "${backupfile_or_dir}")"

		if [[ -e "${dstfile_or_dir}" && ! -L "${dstfile_or_dir}" ]]; then
			if [[ ! -e "${backupdir}" ]]; then
				mkdir -p "${backupdir}"
			fi
			mv "${dstfile_or_dir}" "${backupdir}"
		fi

		if [[ ! -e "${dstdir}" ]]; then
			mkdir -p "${dstdir}"
		fi
		ln -snf "${srcfile_or_dir}" "${dstfile_or_dir}"
	done
}

dotfiles_or_dirs=(
	.xprofile
	.Xresources
	.xscreensaver
	.face
	.config/compton.conf
	.config/alacritty
	.config/conky
	.config/dunst
	.config/fontconfig
	.config/i3
	.config/mpd/mpd.conf
	.config/mpv
	.config/polybar
	.config/rofi
	.config/systemd/user/timidity.service
	.bin/arch_updates.sh
	.bin/polybar_launch.sh
	.bin/rofi_launch.sh
	.bin/rofi_powermenu.sh
	.bin/hddtemp.sh
	.bin/nvidiatemp.sh
	.bin/detect_display.sh
	.bin/setup_touchpad.sh
	.bin/setup_wacom.sh
	.bin/open_with_linux.py
	bin/get-windowclass-i3.sh
)

create_dotfile_links "${dotfiles_or_dirs[@]}"

## icon
ln -snf ~/.face ~/.icon
ln -snf ~/.face ~/.face.icon

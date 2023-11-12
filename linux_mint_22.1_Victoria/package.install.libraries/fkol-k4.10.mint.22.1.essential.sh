#!/bin/bash

#   file: fkol-k4.10.mint.22.1.essential
#   type: Bash script
#   Purpose: Installs essential packages on Linux Mint 22.1 Victoria

#   Copyright (C) 2023  fkol k4, "fkolyvas at gmail dot com"

#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.

#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

#   You should have received a copy of the GNU General Public License along
#   with this program; if not, write to the Free Software Foundation, Inc.,
#   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

#	Global variables & aliases
BOLD_LETTERS=$(tput bold)
NORMAL_LETTERS=$(tput sgr0)

function headers_n_modules() {
    # Install kernel (headers modules & dependencies)
    msg="$BOLD_LETTERS
    Installing kernel modules...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    array=(
		linux-generic
		linux-image-generic
		linux-headers-generic
		build-essential
    )
    sudo apt-get --yes --quiet install --no-install-recommends ${array[@]}
    sync; sleep 1; sync
}

function dev_utilities() {
    # Development useful utilities
    msg="$BOLD_LETTERS
    Installing Development tools ...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    array=(
		build-essential
		cpulimit
		debootstrap
		dialog
		dkms
		fakeroot
		genisoimage
		kernel-wedge
		libncurses5
		libncurses5-dev
		libncurses6
		locate
		makedumpfile
		pastebinit
		preload
		progress
		squashfs-tools
		syslinux
		tree
		zenity
		zram-tools
		zram-config
    )
    sudo apt-get --yes --quiet install --no-install-recommends ${array[@]}
    sync; sleep 1; sync
}

function deb_management_tools() {
    # .deb management tools
    msg="$BOLD_LETTERS
    Installing .deb package management tools ...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    array=(
		app-install-data
		apt-build
		apt-file
		apt-utils
		deborphan
		gdebi
		synaptic
    )
    sudo apt-get --yes --quiet install --no-install-recommends ${array[@]}
    sync; sleep 1; sync
}

function download_managers() {
    # Download & sync managers
    msg="$BOLD_LETTERS
    Installing download managers ...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    array=(
		axel
		rsync
		zsync
		curl
		git
	)
    sudo apt-get --yes --quiet install --no-install-recommends ${array[@]}
    sync; sleep 1; sync
}

function codecs_n_compression() {
    # Codecs & compression algorithms
    msg="$BOLD_LETTERS
    Installing Codecs & compression algorithms ...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
        array=(
		default-jre
		default-mysql-client
		lz4
		lzd
		lziprecover
		lzma-alone
		lzop
		lz4json
		lzip
		lzma
		liblz1
		liblzo2-2
		liblz4-1
		liblz4-tool
		liblzf1
		liblzma5
    )
    sudo apt-get --yes --quiet install --no-install-recommends ${array[@]}
    sync; sleep 1; sync
}

function code_n_text() {
    # Installing code editors
    msg="$BOLD_LETTERS
    Installing Code & Text editors ...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    array=(
		nano
		vim
		vim-python-jedi
		mousepad
		bluefish
		bluefish-plugins
		geany
		geany-plugins
		idle
		idle3
		meld
    )
    sudo apt-get --yes --quiet install --no-install-recommends ${array[@]}
    sync; sleep 1; sync
}

function translation_tools() {
    # Installing code editors
    msg="$BOLD_LETTERS
    Installing Translation Toola ...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    array=(
		poedit
		potool
		translate-toolkit
    )
    sudo apt-get --yes --quiet install --no-install-recommends ${array[@]}
    sync; sleep 1; sync
}

function info_n_recovery() {
    # Sys_info, recovery etc.
    msg="$BOLD_LETTERS
    Installing System_info, recovery tools etc...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 3
    array=(
		fancontrol
		lm-sensors
		foremost
		gddrescue
		gparted
		testdisk
		gsmartcontrol
		hddtemp
		htop
		iotop
		lshw
		lshw-gtk
		lsof
		lsscsi
		mc
    )
    sudo apt-get --yes --quiet install --no-install-recommends ${array[@]}
    sync; sleep 1; sync
    # Enable sensors
    sudo sensors-detect --auto # new way
    #yes | sudo sensors-detect # old way
    sync; sleep 1; sync
}

function main(){
    headers_n_modules
    dev_utilities
    deb_management_tools
    download_managers
    codecs_n_compression
    code_n_text
    translation_tools
    info_n_recovery
    sync; sleep 1; sync
}

main"$@"

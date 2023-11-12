#!/bin/bash

#   file: fkol-k4.20.mint.22.1.common
#   type: Bash script
#   Purpose: Installs common packages on Linux Mint 22.1 Victoria

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

function install_admin_tools() {
    # Install administration tools
    msg="$BOLD_LETTERS
    Installing KeepassX password manager...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    array=(
		keepassx
		rpi-imager
		)
	sudo apt-get --yes --quiet install ${array[@]}
	sync; sleep 1; sync
}

function install_web_related() {
    # Web related
    message="$BOLD_LETTERS
    Installing Web Packages...
    $NORMAL_LETTERS"
    clear; echo -e "$message"; sleep 2
    array=(
    firefox
    thunderbird
    links2
    lynx
    irssi
    pidgin
    pidgin-plugin-pack
    pidgin-themes
    wireshark
    deluge
    )
    sudo apt-get --yes --quiet install ${array[@]}
    sync; sleep 1; sync
}

function install_media_tools() {
    # Media tools
    msg="$BOLD_LETTERS
    Installing Media Tools...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    array=(
    inkscape
    gimp
    gimp-data-extras
    audacity
    mp3check
    mp3diags
    pulseaudio
    pavucontrol
    clementine
    quodlibet
    quodlibet-plugins
    rhythmbox
    rhythmbox-plugins
    mpv
    vlc
    frei0r-plugins
    mkvtoolnix
    mkvtoolnix-gui
    blender
    kdenlive
    transcode
    handbrake
    )
    sudo apt-get --yes --quiet install ${array[@]}
    sync; sleep 1; sync
}

function install_office_tools() {
    # Office
    msg="$BOLD_LETTERS
    Installing Office Tools...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    array=(
    libreoffice
    libreoffice-pdfimport
    libreoffice-templates
    seahorse
    catfish
    cups-pdf
    aspell
    aspell-el
    aspell-en
    aspell-fr
    myspell-el-gr
    fonts-dejavu
    fonts-dejavu-extra
    fonts-noto
    fonts-noto-extra
    fonts-freefont-*
    fonts-gfs-*
    fonts-liberation*
    fontforge
    fontforge-extras
    font-manager
    gucharmap
    brasero
    )
    sudo apt-get --yes --quiet install ${array[@]}
    sync; sleep 1; sync
    #   Local windows fonts
    src="$HOME/Downloads/Fonts/Windows_Fonts_Collection"
    dst="/usr/share/fonts/windows_fonts"
    if [[ -d "$src" ]] && ! [[ -d "$dst" ]]; then
        sudo cp -r "$src" "$dst"; sync
        sudo fc-cache -fv
		sync; sleep 1; sync
	fi
}

function main() {
    install_admin_tools
    install_web_related
    install_media_tools
    install_office_tools
    sync; sleep 1; sync
}

main"$@"

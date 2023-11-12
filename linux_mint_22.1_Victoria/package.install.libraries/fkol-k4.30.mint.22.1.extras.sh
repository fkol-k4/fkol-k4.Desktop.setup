#!/bin/bash

#   file: 30.mint.22.1.extras
#   type: Bash script
#   Purpose: Installs extra packages on Linux Mint 22.1 Victoria

#   Copyright (C) 2016  fkol k4, "fkolyvas at gmail dot com"

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
arraypkginstall="sudo apt-get --yes --quiet install --no-install-recommends"
arraypkginstallgdebi="sudo gdebi --non-interactive"

#   Create packages backup directory
cd "$HOME"
sudo apt-get --yes --quiet install gdebi
backupdir="$HOME/Deb_packages_backup"
mkdir -p "$backupdir"

function install_stremio() {
    # Set variables
    pkgbackupdir="Stremio_Video_Player"
    pkgversion="https://dl.strem.io/shell-linux/v4.4.164/Stremio_v4.4.164.deb"
    pkgname=`echo "$pkgversion" | awk 'BEGIN { FS = "/" } ; { print $6 }'`
    msg="$BOLD_LETTERS
    Installing Stremio media player...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    mkdir -p "$backupdir/$pkgbackupdir"
    cd "$backupdir/$pkgbackupdir/"
    wget "$pkgversion"
    sync; sleep 1; sync
    sudo gdebi --non-interactive "$pkgname"
    sync; sleep 1; sync
    cd "$HOME"
}

function install_freetube() {
	# Set variables
    pkgbackupdir="FreeTube_Video_Player"
    pkgversion="https://github.com/FreeTubeApp/FreeTube/releases/download/v0.19.1-beta/freetube_0.19.1_amd64.deb"
    msg="$BOLD_LETTERS
    Installing FreeTube media player...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    mkdir -p "$backupdir/$pkgbackupdir"
    cd "$backupdir/$pkgbackupdir/"
    wget "$pkgversion"
    sync; sleep 1; sync
    sudo gdebi --non-interactive "$pkgname"
    sync; sleep 1; sync
    cd "$HOME"
}

function install_oracle_virtualbox() {
	# Set variables
    pkgbackupdir="Oracle_VirtualBox"
    pkgversion="https://download.virtualbox.org/virtualbox/7.0.12/virtualbox-7.0_7.0.12-159484~Ubuntu~jammy_amd64.deb"
    pkgname=`echo "$pkgversion" | awk 'BEGIN { FS = "/" } ; { print $6 }'`
    extpackversion="https://download.virtualbox.org/virtualbox/6.1.48/Oracle_VM_VirtualBox_Extension_Pack-6.1.48.vbox-extpack"
    extpackname=`echo $extpackversion | awk 'BEGIN { FS = "/" } ; { print $6 }'`
	msg="$BOLD_LETTERS
    Installing Oracle Virtualbox...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    mkdir -p "$backupdir/$pkgbackupdir"
    cd "$backupdir/$pkgbackupdir/"
    wget "$pkgversion"
    wget "$extpackversion"
    sync; sleep 1; sync
    sudo gdebi --non-interactive "$pkgname"
    sync; sleep 1; sync
    sudo gpasswd -a "$USER" vboxusers	# adds $USER to group
    virtualbox "$extpackname"			# Install virtualbox extension pack
	sync; sleep 1; sync
    cd "$HOME"
}

function install_VariCAD() {
    # Set variables
    pkgbackupdir="VariCAD_for_Linux"
    pkg1version="https://www.varicad.com/userdata/files/release/en/varicad2023-en_2.08_amd64.deb"
    pkg2version="https://www.varicad.com/userdata/files/release/en/varicad2023-view-en_2.08_amd64.deb"
    pkg1name=`echo "$pkg1version" | awk 'BEGIN { FS = "/" } ; { print $8 }'`
    pkg2name=`echo "$pkg2version" | awk 'BEGIN { FS = "/" } ; { print $8 }'`
	msg="$BOLD_LETTERS
    Installing VariCAD for Linux...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    # Install packages
    mkdir -p "$backupdir/$pkgbackupdir"
    cd "$backupdir/$pkgbackupdir/"
    wget "$pkg1version"
    wget "$pkg2version"
    sync; sleep 1; sync
    sudo gdebi --non-interactive "$pkg1name"
    sync; sleep 1; sync
    sudo gdebi --non-interactive "$pkg2name"
    sync; sleep 1; sync
    cd "$HOME"
}

function install_remarkable_editor() {
    # Set variables
    pkgbackupdir="Remarkable_markdown_editor"
    pkgversion="https://remarkableapp.github.io/files/remarkable_1.87_all.deb"
    pkgname=`echo "$pkgversion" | awk 'BEGIN { FS = "/" } ; { print $5 }'`
    msg="$BOLD_LETTERS
    Installing Remarkable markdown editor...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    mkdir -p "$backupdir/$pkgbackupdir"
    cd "$backupdir/$pkgbackupdir/"
    wget "$pkgversion"
    sync; sleep 1; sync
    sudo gdebi --non-interactive "$pkgname"
    sync; sleep 1; sync
    cd "$HOME"
}

function install_haroopad_editor() {
    # Set variables
    pkgbackupdir="Haroopad_markdown_editor"
    pkgversion="https://bitbucket.org/rhiokim/haroopad-download/downloads/haroopad-v0.13.1-x64.deb"
    pkgname=`echo "$pkgversion" | awk 'BEGIN { FS = "/" } ; { print $7 }'`
    msg="$BOLD_LETTERS
    Installing HarooPad markdown editor...
    $NORMAL_LETTERS"
    clear; echo -e "$msg"; sleep 2
    mkdir -p "$backupdir/$pkgbackupdir"
    cd "$backupdir/$pkgbackupdir/"
    wget "$pkgversion"
    sync; sleep 1; sync
    sudo gdebi --non-interactive "$pkgname"
    sync; sleep 1; sync
    cd "$HOME"
}

function choose_package() {
    # Choose extra packages
    echo "$BOLD_LETTERS You can choose the package you want to install from the list below $NORMAL_LETTERS"
    echo "$BOLD_LETTERS by entering the number next to it, or type anything else to exit. $NORMAL_LETTERS"
    echo
    echo "$BOLD_LETTERS 1. Stremio Media Player $NORMAL_LETTERS"
    echo "$BOLD_LETTERS 2. Freetube Media Player $NORMAL_LETTERS"
    echo "$BOLD_LETTERS 3. Oracle Virtualbox $NORMAL_LETTERS"
    echo "$BOLD_LETTERS 4. VariCAD for Linux $NORMAL_LETTERS"
    echo "$BOLD_LETTERS 5. Remarkable Markdown Editor $NORMAL_LETTERS"
    echo "$BOLD_LETTERS 6. Haroopad Markdown Editor $NORMAL_LETTERS"
    echo "$BOLD_LETTERS 0. Exit (default) $NORMAL_LETTERS"
    
    echo
    read -p "$BOLD_LETTERS Enter your choice:  $NORMAL_LETTERS" extra_package
    # Execute action
    if [[ "$extra_package" == "1" ]]; then
        install_stremio
    elif [[ "$extra_package" == "2" ]]; then
        install_freetube
    elif [[ "$extra_package" == "3" ]]; then
        install_oracle_virtualbox
    elif [[ "$extra_package" == "4" ]]; then
        install_VariCAD
    elif [[ "$extra_package" == "5" ]]; then
        install_remarkable_editor
    elif [[ "$extra_package" == "6" ]]; then
        install_haroopad_editor
    else
        echo "$BOLD_LETTERS 
        Ok, exiting...
         $NORMAL_LETTERS"; sleep 2
        return # exits function
        # this is for exiting the entire script
        # kill -INT $$
    fi
    choose_again
}

function choose_again() {
    # Choose again after 
    clear
    msg="$BOLD_LETTERS Do you want to install anything else? (Y/n):  $NORMAL_LETTERS"
    echo
    read -p "$msg" answer
    if [[ "$answer" == "Y" ]] || [[ "$answer" == "y" ]]; then
        echo "$BOLD_LETTERS Ok, continuing... $NORMAL_LETTERS"; sleep 2
        clear
        choose_package
    else
        echo; echo "$BOLD_LETTERS Ok, exiting... $NORMAL_LETTERS"; echo; sleep 2
    fi
}

function main() {
    clear
    echo "$BOLD_LETTERS
    We can install some extra packages...
    $NORMAL_LETTERS"; echo
    choose_package
}

main "$@"

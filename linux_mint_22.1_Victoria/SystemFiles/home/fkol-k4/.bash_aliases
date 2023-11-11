# ~/.bash_aliases: executed by ~/.bashrc for non-login shells.
# Created by fkol-k4

#   GPG Key
GPG_KEY=""
#   Github Authentication Token
MY_GITHUB_TOKEN=""
#   Cloning example: 
#   git clone https://$MY_GITHUB_TOKEN@github.com/fkol-k4/HP_Probook_450_G8-setup.git

#   Aliases
alias fkol_date="date +%Y-%m-%d"
alias fkol_date-with-time="date +%Y-%m-%d-%T"
alias fkol_getkey="sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "

#   Functions
function fkol_updates() {
    # system updates && cleanup
    sudo apt update
    sudo apt --yes full-upgrade

    sudo apt-get --yes clean
    sudo apt-get --yes autoclean
    sudo apt-get --yes --purge autoremove

    sudo apt-get --yes --fix-missing install
    sudo apt-get --yes --fix-broken install

    sudo dpkg --configure -a

    sync
}

function fkol_DE_reset() {
    # reset DE to defaults
    rm -rf $HOME/.cache
    rm -rf $HOME/.config/dconf
    rm -rf $HOME/.gconf
    rm -rf $HOME/.kde
    rm -rf $HOME/.xfce
    rm -rf $HOME/.cinnamon
}

function fkol_show_startups(){
    # Show startup applications
    fkol_unhide-applications="sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /usr/share/applications/*.desktop "
    fkol_unhide-gnome-startups="sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /usr/share/gnome/autostart/*.desktop "
    fkol_unhide-startups="sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop "
}

function fkol_network_restart() {
    # resatrt network systems
    sudo ip addr flush wlp1s0
    sudo systemctl restart networking.service
}


function fkol_disable_NetworkManager_wait_online_service() {
    # disable service
    sudo systemctl disable NetworkManager-wait-online.service
}

function fkol_disable_SnapPackages() {
    # Disable service
    sudo systemctl disable snapd.service
}

function fkol_disable_TouchPad() {
    # Disable Touchpad
    synclient TouchpadOff=1
}

function fkol_enable_TouchPad() {
    # Enable Touchpad
    synclient TouchpadOff=0
}

function fkol_github_setup() {
    # Setting up Github on git:
    git config --global user.name
    git config --global user.email
    git config --global credential.helper cache
}

function fkol_github_upload(){
    # Reminding how to upload Github repo changes
	git add -A
	git commit -a
	git push
}



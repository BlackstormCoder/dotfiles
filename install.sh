#!/bin/bash

# Colors
RESET="\033[0;33m"
RED="\033[38;2;210;15;57m"
CYAN="\033[38;2;4;165;229m"
GREEN="\033[38;2;64;160;43m"
clear

banner(){
    echo -e "$CYAN
 ██████╗ ██╗  ██╗██╗  ██╗    ██████╗ ███████╗██████╗ ███████╗███████╗ ██████╗    ██╗
██╔═══██╗██║  ██║██║  ██║    ██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝██╔════╝    ██║
██║   ██║███████║███████║    ██║  ██║█████╗  ██║  ██║███████╗█████╗  ██║         ██║
██║   ██║██╔══██║██╔══██║    ██║  ██║██╔══╝  ██║  ██║╚════██║██╔══╝  ██║         ╚═╝
╚██████╔╝██║  ██║██║  ██║    ██████╔╝███████╗██████╔╝███████║███████╗╚██████╗    ██╗
 ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═════╝ ╚══════╝╚═════╝ ╚══════╝╚══════╝ ╚═════╝    ╚═╝
███████╗███████╗████████╗    ███╗   ███╗██╗   ██╗    ██████╗  ██████╗               
██╔════╝██╔════╝╚══██╔══╝    ████╗ ████║╚██╗ ██╔╝    ██╔══██╗██╔════╝               
███████╗█████╗     ██║       ██╔████╔██║ ╚████╔╝     ██████╔╝██║                    
╚════██║██╔══╝     ██║       ██║╚██╔╝██║  ╚██╔╝      ██╔═══╝ ██║                    
███████║███████╗   ██║       ██║ ╚═╝ ██║   ██║       ██║     ╚██████╗               
╚══════╝╚══════╝   ╚═╝       ╚═╝     ╚═╝   ╚═╝       ╚═╝      ╚═════╝               
${RESET}"
}
banner

# set some colors
CNT="\e[0m[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"
INSTLOG="install.log"


echo -e "$CNT Updating the repos.. "
apt update &>>$INSTLOG
app=(fish
    curl
    git
    tmux 
    rlwrap
    grc
    fzf
    lsd
    python3
    bpython
    gcc
    clang
    kali-win-kex
    stow
    python3.13-venv
    npm
    zoxide
    xsel
)
for apps in ${app[@]}; do 
    echo -e  "$CAT Installing $apps ..."
    # Edit below 
    apt install $apps -y &>>$INSTLOG 
done

# Installing TPM 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &>>$INSTLOG

# Installing fisher
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher '

plugins=(jorgebucaran/fisher 
    jorgebucaran/autopair.fish 
    patrickf1/fzf.fish 
    franciscolourenco/done
    jorgebucaran/replay.fish
    nickeb96/puffer-fish
)
for plugin in ${plugins[@]}; do 
    # Edit below
    echo -e "$CAT Installing fisher $plugin"
    fisher install $plugin &>>$INSTLOG 
done

install_neovim(){
    # Installing neovim 
    chown -R $USER:$USER /opt
    echo -e "$CAT Installing neovim"
    URL=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep 'browser_' | cut -d\" -f4 | grep 'linux-x86.*gz$')
    curl -L $URL --output nvim.tar.gz &>>$INSTLOG
    tar -xzvf nvim.tar.gz -C /opt/ &>>$INSTLOG
    mv /opt/nvim-linux-* /opt/nvim
    ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
    rm nvim.tar.gz
    #git clone https://github.com/BlackstormCoder/neovim_dotfiles.git &>>$INSTLOG 
}
install_neovim

# copy the config file to their destination
stow . --adopt
echo -e "$CAT - Copied config files."

# cloning nvim

# for DIR in tmux nvim fish; do 
#     DIRPATH=~/.config/$DIR
#     if [ -d "$DIRPATH" ]; then 
#         echo -e "$CAT - Config for $DIR located, backing up."
#         mv $DIRPATH $DIRPATH-back &>> $INSTLOG
#         echo -e "$COK - Backed up $DIR to $DIRPATH-back."
#     fi
# done

# cp -r tmux fish ~/.config/
# cp -r neovim_dotfiles ~/.config/nvim


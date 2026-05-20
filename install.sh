#!/bin/bash

set -e

# ==================================================
# Variables
# ==================================================
REPO_URL="https://github.com/BlackstormCoder/dotfiles.git"
BRANCH="kali_wsl"
INSTALL_DIR="$HOME/.dotfiles"

# ==================================================
# Colors
# ==================================================
RESET="\033[0m"
RED="\033[38;2;255;85;85m"
GREEN="\033[38;2;80;250;123m"
CYAN="\033[38;2;139;233;253m"
PURPLE="\033[38;2;189;147;249m"
YELLOW="\033[1;33m"

# ==================================================
# Banner
# ==================================================
clear

banner() {

echo -e "$PURPLE

███╗   ██╗███████╗██╗   ██╗██████╗  ██████╗ ███╗   ██╗
████╗  ██║██╔════╝██║   ██║██╔══██╗██╔═══██╗████╗  ██║
██╔██╗ ██║█████╗  ██║   ██║██████╔╝██║   ██║██╔██╗ ██║
██║╚██╗██║██╔══╝  ██║   ██║██╔══██╗██║   ██║██║╚██╗██║
██║ ╚████║███████╗╚██████╔╝██║  ██║╚██████╔╝██║ ╚████║
╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝

        ██████╗ ██╗      █████╗  ██████╗██╗  ██╗
        ██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝
        ██████╔╝██║     ███████║██║     █████╔╝
        ██╔══██╗██║     ██╔══██║██║     ██╔═██╗
        ██████╔╝███████╗██║  ██║╚██████╗██║  ██╗
        ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝

         [ Kali VM / WSL Developer Environment ]

${RESET}"
}

banner

# ==================================================
# Labels
# ==================================================
CNT="\e[0m[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"

INSTLOG="$HOME/install.log"

# ==================================================
# Logging
# ==================================================
exec > >(tee -a "$INSTLOG") 2>&1

trap 'echo -e "$CER Error on line $LINENO"' ERR

# ==================================================
# Root Check
# ==================================================
if [[ $EUID -eq 0 ]]; then
    echo -e "$CER Do not run this script as root."
    echo -e "$CNT Run normally:"
    echo -e "     bash <(curl -fsSL https://raw.githubusercontent.com/BlackstormCoder/dotfiles/kali_wsl/install.sh)"
    exit 1
fi

# ==================================================
# Detect User
# ==================================================
REAL_USER=$(whoami)
USER_HOME="$HOME"

echo -e "$CNT Running setup for user: $REAL_USER"

# ==================================================
# Install Sudo If Missing
# ==================================================
if ! command -v sudo &>/dev/null; then
    echo -e "$CNT Installing sudo..."
    su -c "apt update && apt install -y sudo"
fi

# ==================================================
# Clone Repo
# ==================================================
if [ ! -d "$INSTALL_DIR" ]; then

    echo -e "$CNT Cloning dotfiles repository..."

    git clone -b "$BRANCH" "$REPO_URL" "$INSTALL_DIR"

else
    echo -e "$CWR Dotfiles repo already exists. Pulling latest changes..."

    cd "$INSTALL_DIR"
    git pull origin "$BRANCH"
fi

cd "$INSTALL_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SOURCE="$SCRIPT_DIR/.config"

# ==================================================
# Update System
# ==================================================
echo -e "$CNT Updating repositories..."

sudo apt update -y

echo -e "$CNT Upgrading packages..."

sudo apt upgrade -y

# ==================================================
# Packages
# ==================================================
packages=(
    fish
    curl
    wget
    git
    tmux
    rlwrap
    grc
    fzf
    eza
    python3
    python3-pip
    python3-venv
    bpython
    gcc
    clang
    stow
    npm
    zoxide
    unzip
    zip
    ripgrep
    fd-find
    bat
    tree
    htop
    fastfetch
    jq
    yq
    xclip
    xsel
    wl-clipboard
    netcat-traditional
    tcpdump
    neovim
    nala
)

echo -e "$CNT Installing packages..."

for pkg in "${packages[@]}"; do

    if dpkg -s "$pkg" &>/dev/null; then
        echo -e "$COK $pkg already installed."
    else
        echo -e "$CAT Installing $pkg ..."
        sudo apt install -y "$pkg"
    fi

done

# ==================================================
# Install Nerd Fonts
# ==================================================
install_nerd_fonts() {

    FONT_DIR="$USER_HOME/.local/share/fonts"

    mkdir -p "$FONT_DIR"

    cd /tmp

    echo -e "$CNT Installing JetBrainsMono Nerd Font..."

    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

    unzip -o JetBrainsMono.zip -d "$FONT_DIR"

    fc-cache -fv

    rm -f JetBrainsMono.zip

    echo -e "$COK Nerd Fonts installed."
}

install_nerd_fonts

# ==================================================
# Install TPM
# ==================================================
install_tpm() {

    if [ ! -d "$USER_HOME/.tmux/plugins/tpm" ]; then

        echo -e "$CNT Installing TPM..."

        git clone https://github.com/tmux-plugins/tpm \
            "$USER_HOME/.tmux/plugins/tpm"

    else
        echo -e "$COK TPM already installed."
    fi
}

install_tpm


# ==================================================
# Install Fisher
# ==================================================
install_fisher() {

    echo -e "$CNT Installing Fisher..."

    fish -c '
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source

        fisher install jorgebucaran/fisher
    '

    plugins=(
        jorgebucaran/autopair.fish
        patrickf1/fzf.fish
        franciscolourenco/done
        jorgebucaran/replay.fish
        nickeb96/puffer-fish
    )

    for plugin in "${plugins[@]}"; do

        echo -e "$CAT Installing Fish plugin: $plugin"

        fish -c "fisher install $plugin"

    done
}

install_fisher

# ==================================================
# Backup Existing Configs
# ==================================================
backup_config() {

    local CONFIG_NAME=$1
    local TARGET="$USER_HOME/.config/$CONFIG_NAME"

    if [ -d "$TARGET" ]; then

        echo -e "$CWR Backing up existing $CONFIG_NAME config..."

        mv "$TARGET" "${TARGET}.bak.$(date +%s)"
    fi
}

mkdir -p "$USER_HOME/.config"

backup_config fish
backup_config nvim

# ==================================================
# Copy Configs
# ==================================================
echo -e "$CNT Copying configuration files..."

cp -r "$CONFIG_SOURCE/fish" "$USER_HOME/.config/"
cp -r "$CONFIG_SOURCE/nvim" "$USER_HOME/.config/"

# tmux config
if [ -f "$SCRIPT_DIR/.tmux.conf" ]; then
    cp "$SCRIPT_DIR/.tmux.conf" "$USER_HOME/"
fi




# ==================================================
# Change Shell
# ==================================================
CURRENT_SHELL=$(getent passwd "$REAL_USER" | cut -d: -f7)

if [[ "$CURRENT_SHELL" != "/usr/bin/fish" ]]; then

    echo -e "$CNT Changing default shell to Fish..."

    chsh -s /usr/bin/fish

fi

# ==================================================
# Finish
# ==================================================
echo
echo -e "$GREEN Environment setup completed.${RESET}"
echo -e "$CYAN Restart terminal or relogin.${RESET}"
echo -e "$YELLOW Log file saved at: $INSTLOG${RESET}"
echo
echo -e "$PURPLE Happy hacking.${RESET}"

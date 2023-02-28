# my_dotfiles
This is my customise Hyprland WM

## Preview
![rice1](https://raw.githubusercontent.com/BlackstormCoder/Hyprland-dedsec-dot/main/assets/rice1.png)
![rice2](https://raw.githubusercontent.com/BlackstormCoder/Hyprland-dedsec-dot/main/assets/rice2.png)

### Gorgeous SDDM Login Manger
![sddm](https://raw.githubusercontent.com/BlackstormCoder/Hyprland-dedsec-dot/main/assets/SDDM.png)

- Packages
    
    ```bash
    # Prerequisites
    yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput
    
    yay -S hyprland-nvidia-git hyprpaper-git hyprpicker-git waybar-hyprland-git polkit-kde-agent  polkit-gnome dunst  rofi-lbonn-wayland-git rofi-emoji  rofi-greenclip xdg-desktop-portal-hyprland-git waybar-hyprland-git 
    
    # themes
    yay -S polybar ffmpegthumbnailer imagemagick  swaylock-effects  qt5-wayland  qt6-wayland  lxappearance nwg-look-bin papirus-icon-theme 
    
    # Browser and fun
    yay -S firefox brave-bin cmatrix bonsai.sh-git pipes.sh
    
    # tools and bluetooth
    yay -S ripgrep  man-db btop thunar lazygit brightnessctl pfetch dunst python-pywal pywal-git networkmanager-dmenu-git blueberry blueman  bluez  bluez-utils  alacritty  kitty xclip nodejs pavucontrol
    ```
    
- SDDM Login Manager
    
    ```bash
    # SDDM Login Manager
    # sddm-git for fixing slow shutdown problem
    yay -S sddm-git sddm-sugar-dark sddm-sugar-candy-git archlinux-tweak-tool-git 
    sudo systemctl disable display-manager && sudo systemctl enable sddm
    sudo touch /etc/sddm.conf
    sudo sh -c "echo '[Theme]' >> /etc/sddm.conf"
    sudo sh -c "echo 'Current=sugar-candy' >> /etc/sddm.conf"
    sudo cp ~/.wallpapers/room.jpg /usr/share/sddm/themes/sugar-candy/
    sudo mv /usr/share/sddm/themes/sugar-candy/room.jpg /usr/share/sddm/themes/sugar-candy/wall_secondary.png
    sudo sh -c "echo '[General]' > /usr/share/sddm/themes/sugar-candy/theme.conf.user"
    sudo sh -c "echo 'background=/usr/share/sddm/themes/sugar-candy/room.jpg' >> /usr/share/sddm/themes/sugar-candy/theme.conf.user"
    sudo sh -c "echo 'type=image' >> /usr/share/sddm/themes/sugar-candy/theme.conf.user"
    ```
    
- I have a Nvidia graphic card so I have to make bash file to run `Hyprland`
    
    `wrappedhl`
    
    ```bash
    #!/bin/sh
    
    cd ~
    
    export HYPRLAND_LOG_WLR=1
    
    export _JAVA_AWT_WM_NONREPARENTING=1
    export XCURSOR_SIZE=24
    export XCURSOR_THEME=Catppuccin-Mocha-Dark-Cursors
    
    export LIBVA_DRIVER_NAME=nvidia
    export XDG_SESSION_TYPE=wayland
    #export GBM_BACKEND=nvidia-drm
    #export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export WLR_NO_HARDWARE_CURSORS=1
    
    export QT_QPA_PLATFORMTHEME=gtk2
    export QT_STYLE_OVERRIDE=gtk2
    
    #export XDG_CURRENT_DESKTOP=Hyprland
    #export XDG_SESSION_TYPE=wayland
    #export XDG_SESSION_DESKTOP=Hyprland
    
    exec Hyprland
    ```
    
    `/usr/share/wayland-sessions/wrapperedl.desktop`
    
    ```bash
    [Desktop Entry]
    Name=Hyprland
    Comment=An intelligent dynamic tiling Wayland compositor
    Exec=wrappedhl
    Type=Application
    ```

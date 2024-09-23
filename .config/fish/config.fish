set fish_greeting
set EDITOR nvim
alias tmux='tmux -u'
alias listener="sudo rlwrap nc -lvnp"
alias ls="lsd"
alias tree="lsd --tree"
alias cp="cp -rv"
alias rm="rm -rf"
alias copy="xsel -b < $1"
alias bp='bpython'
#alias mv='mv -r'
#alias cat="bat"
alias btop='btop --utf-force'
alias nmap='grc nmap'
alias ping='grc ping'
alias tail='grc tail'
alias ps='grc ps'
alias traceroute='grc traceroute'
alias netstat='grc netstat'
alias srn='systemctl restart NetworkManager'
#alias firefox-esr="firefox-bin"
# alias thm='sudo openvpn ~/Downloads/VPNs/BL4CK5T0RM.ovpn'
# alias wreath='sudo openvpn ~/Downloads/VPNs/BL4CK5T0RM-wreath.ovpn'
alias tmux='tmux -u'
alias locals="sudo python3 -m http.server 80"
#alias burp20="/home/blackstorm/Documents/burp-2020.2/jdk1.8.0_202/bin/java -noverify -Xbootclasspath/p:/home/blackstorm/Documents/burp-2020.2/jdk1.8.0_202/bin/burp-loader-keygen-2020_2.jar -jar /home/blackstorm/Documents/burp-2020.2/jdk1.8.0_202/bin/burpsuite_pro_v2020.2.jar"
#alias burp21="java -noverify -javaagent:/home/blackstorm/Documents/Burpsuite_2021/loader.jar --illegal-access=permit -jar /home/blackstorm/Documents/Burpsuite_2021/burpsuite_pro_v2021.7.2.jar"
# alias dirsearch="sudo python3 /opt/dirsearch/dirsearch.py"
alias hosts="subl /etc/hosts"
#alias blackeye="sudo bash /opt/blackeye/blackeye.sh"
# alias htb_start="sudo openvpn /home/blackstorm/Downloads/VPNs/starting_point_BLACKSTORM007.ovpn"
# alias htb_arena='sudo openvpn /home/blackstorm/Downloads/VPNs/release_arena_BLACKSTORM007.ovpn'
# alias htb_lab='sudo openvpn /home/blackstorm/Downloads/VPNs/lab_BLACKSTORM007.ovpn'
# alias htb_fort='sudo openvpn /home/blackstorm/Downloads/VPNs/fortresses_BLACKSTORM007.ovpn'
#alias wordlistctl="sudo python3 /opt/wordlistctl/wordlistctl.py"
#alias redhawk="php /opt/redhawk/rhawk.php"
#alias hiddeneye="sudo python3 /opt/hiddeneye/HiddenEye.py"
alias sostable='socat TCP-L:4444 FILE:`tty`,raw,echo=0'
if status is-interactive
    # Commands to run in interactive sessions can go here
end
zoxide init fish | source
alias cd="__zoxide_z"

# Created by `pipx` on 2024-07-01 17:38:02
set PATH $PATH /root/.local/bin

# Set binding for moving directory using ctrl+alt+->, <- 
# Used fish_key_reader to get the key pressed and then add the Commands
# commandline is used to print the updated directory
bind \e\[1\;7D 'prevd; commandline -f repaint'
bind \e\[1\;7C 'nextd; commandline -f repaint'




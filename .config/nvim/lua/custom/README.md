# nvchad_custom

## Install
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
sudo mv nvim-linux64/ /opt
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

git clone https://github.com/BlackstormCoder/nvchad_custom 
cd nvchad_custom  
cp  *  ~/.config/nvim/lua/custom

```

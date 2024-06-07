### Base NVIM Configuration I use as a boilerplate for new setups

## Requirements
Before you download this make sure your system has the following:
1. Python3
2. NodeJS
3. npm
4. [Packer.nvim](https://github.com/wbthomason/packer.nvim)
5. [Stylua](https://github.com/JohnnyMorganz/StyLua)
6. [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts)
7. [ripgrep](https://github.com/BurntSushi/ripgrep)
8. [Packer](https://github.com/wbthomason/packer.nvim)

## Getting Started
Once you have installed the above pre-requisites all you need to do is
1. Clone this repository (The below command will create the `nvim` directory inside of `~/.config`)
```
cd ~/.config
git clone https://github.com/Adonca2203/nvim.git
cd nvim
```
2. Open NVIM by typing `nvim`
- You will see a lot of errors. Just press q until you enter the text editor
3. In Normal Mode, type `:PackerSync` and hit Enter. This will download all the dependencies needed
4. Quit out of NVIM (`:q`)
5. Reopen NVIM and you should be all set

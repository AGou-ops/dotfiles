<a href="https://dotfyle.com/AGou-ops/dotfiles-neovim"><img src="https://dotfyle.com/AGou-ops/dotfiles-neovim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/AGou-ops/dotfiles-neovim"><img src="https://dotfyle.com/AGou-ops/dotfiles-neovim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/AGou-ops/dotfiles-neovim"><img src="https://dotfyle.com/AGou-ops/dotfiles-neovim/badges/plugin-manager?style=flat" /></a>

**[【😁中文文档】](README-zh.md)**

> [!tip]
> **Switch to the `nvim` branch if you only need neovim configuration!**

# Quickly start

## Dependencies

```bash
sudo apt install wget curl git python3-pip ripgrep ranger lolcat -y
pip3 install pynvim
sudo npm install -g tree-sitter-cli
# or use cargo to install tree-sitter-cli
# cargo install tree-sitter-cli
echo "export PATH=$HOME/.local/share/nvim/mason/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
# if you use zsh, pls add masonbin to your zsh config and then source it
# source ~/.zshrc
```

## Install Config

```bash
# backup your old neovim config
mv ~/.config/nvim{,.bak}
# download my config to your local machine.
git clone -b nvim https://github.com/AGou-ops/dotfiles.git ~/.config/nvim
```

If you have any problems with the installation, please [submit an issue](https://github.com/AGou-ops/dotfiles/issues).

## Let's go!

```bash
# After opening neovim, lazy.nvim will automatically install all plugins.
nvim
# if you have Neovim python error, https://github.com/gelguy/wilder.nvim/issues/16, run below command and restart neovim.
:UpdateRemotePlugins
```

🎉Done.

## Plugin list

```
.
├── barbecue.lua
├── bookmarks.lua
├── bufferline.lua
├── close-buffers.lua
├── cmp.lua
├── cursorword.lua
├── dashboard.lua
├── diffview.lua
├── flash.lua
├── format.lua
├── gitsigns.lua
├── gomove.lua
├── indent-blankline.lua
├── init.lua
├── lsp
├── lspsaga.lua
├── lualine.lua
├── luasnip.lua
├── mason.lua
├── neoscroll.lua
├── neotest.lua
├── nvim-dap.lua
├── nvim-hlslens.lua
├── nvim-spectre.lua
├── nvim-surround.lua
├── nvim-tree.lua
├── nvim-ufo.lua
├── project.lua
├── rnvimr.lua
├── scrollbar.lua
├── snacks.lua
├── specs.lua
├── telescope.lua
├── todo-comments.lua
├── toggleterm.lua
├── translate.lua
├── treesitter.lua
├── trouble.lua
├── which-key.lua
├── wilder.lua
└── zen-mode.lua

82 directories, 0 files
```

## ScreenShot

- Neovim dashboard

<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/175773276-d3e45689-44f6-4b24-ba9a-2747226eb2ab.png">


- Tmux

![image-20220408084010889](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/image-20220408084010889.png)

- Zen mode

![image](https://github.com/AGou-ops/dotfiles/assets/57939102/516d6ef7-56e8-4dea-a7e7-76043a9514c1)


- Golang

Code completion:

<img width="1534" alt="image" src="https://user-images.githubusercontent.com/57939102/203007534-4eb72a21-a77e-482a-8c95-5dd66a65ca9d.png">

dap debug:

<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/182982646-3abdb806-9f24-442d-add3-50bbedca931c.png">

Unit Test:

<img width="1534" alt="image" src="https://user-images.githubusercontent.com/57939102/208004153-bcf41ea5-c5ac-4227-aa94-cd72dfc39174.png">

preview definition:

<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/191188081-1dafc614-caec-47fd-9b67-a7779a53bf8b.png">

lspsaga finder:

<img width="1534" alt="image" src="https://user-images.githubusercontent.com/57939102/203007772-002c7ca7-b26f-44e2-a998-176a3db3870f.png">


## startupTime


### ⭐️`lazy.nvim`

`82` plugins.

<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/218255154-b3a36ed2-0844-4c56-81c4-448aafbfeb86.png">

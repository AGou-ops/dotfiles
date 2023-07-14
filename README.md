**[【😁中文文档】](README-zh.md)**

🎉 **Support Neovim 0.10.0-dev！！！**

```diff
- Tip: If you only want to use neovim's configuration, please manually switch to the `nvim` branch!!!
+ It is recommended to update all plugins to the latest first.
```

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
# Neovim python error, https://github.com/gelguy/wilder.nvim/issues/16, run below command and restart neovim.
:UpdateRemotePlugins
```

🎉Done.

## Plugin list

```
.
├── Comment.nvim
├── LeaderF
├── LuaSnip
├── asyncrun.vim
├── autoclose.nvim
├── barbecue.nvim
├── better-escape.nvim
├── bufferline.nvim
├── cmp-buffer
├── cmp-emoji
├── cmp-look
├── cmp-nvim-lsp
├── cmp-nvim-lsp-signature-help
├── cmp-path
├── cmp-tabnine
├── cmp_luasnip
├── dashboard-nvim
├── drop.nvim
├── fidget.nvim
├── flash.nvim
├── friendly-snippets
├── gitsigns.nvim
├── goimpl.nvim
├── gotests.nvim
├── goto-preview
├── gruvbox-material
├── guard.nvim
├── indent-blankline.nvim
├── lazy.nvim
├── lspsaga.nvim
├── lualine.nvim
├── markdown-preview.nvim
├── mason-lspconfig.nvim
├── mason.nvim
├── muren.nvim
├── neodev.nvim
├── neoformat
├── neogen
├── neoscroll.nvim
├── neotest
├── neotest-go
├── neovim-session-manager
├── nvim-cmp
├── nvim-colorizer.lua
├── nvim-cursorword
├── nvim-dap
├── nvim-dap-ui
├── nvim-gomove
├── nvim-hlslens
├── nvim-lspconfig
├── nvim-navic
├── nvim-picgo
├── nvim-scrollbar
├── nvim-surround
├── nvim-tree.lua
├── nvim-treehopper
├── nvim-treesitter
├── nvim-treesitter-context
├── nvim-treesitter-textobjects
├── nvim-ts-rainbow
├── nvim-ufo
├── nvim-web-devicons
├── playground
├── plenary.nvim
├── popup.nvim
├── promise-async
├── rnvimr
├── suda.vim
├── tagbar
├── telescope-dap.nvim
├── telescope-fzf-native.nvim
├── telescope.nvim
├── todo-comments.nvim
├── toggleterm.nvim
├── trouble.nvim
├── undotree
├── vim-startuptime
├── vim-translator
├── vim-visual-multi
├── which-key.nvim
└── wilder.nvim

82 directories, 0 files

```

## ScreenShot

- Neovim dashboard

<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/175773276-d3e45689-44f6-4b24-ba9a-2747226eb2ab.png">


- Tmux

![image-20220408084010889](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/image-20220408084010889.png)


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

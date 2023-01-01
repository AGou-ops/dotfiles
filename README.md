<<<<<<< HEAD
## 主流三种配置结构对比

- 纯vim-script：局限性较高，可配置项少，适合轻度玩家；
- 纯lua：使用packer来进行插件管理，可配置项多，十分灵活，但没点lua基础的人用起来有点懵，比如我，适合高端玩家；
- `vim-script + lua`：我个人推荐使用这种配置方式，使用vim-plug来进行插件管理，几乎所有的neovim插件都可以用vim-plug来安装，而且插件列表内容要比packer更加简洁客观，结合了lua，可配置项又大大提升，用起来很是方便；
- 一个文件完事的玩家：vim-script里直接使用标签来运行lua相关配置，不推荐，lua插件多的话会让你的配置文件变得复杂，不好维护。

## 文件目录结构及说明

目录结构及说明：

```bash
> tree
.
├── custom.vim								# 自定义的一些vim-script配置
├── debug-template						# vim-vimspector插件模板目录（用于debug）
│   └── go-template						# debug golang的模板
├── general.vim								# 一般设置
├── init.vim									# 初始化配置文件（主要）
├── keymaps.vim								# 键盘映射配置文件，大部分是通用的键盘映射配置，不包含插件的键盘映射
├── lua												# -- lua配置 ---
│   └── AGou									# 配置文件命名空间，在init.vim中引进
│       ├── init.lua					# 命名空间lua配置主入口文件
│       ├── lsp.lua
│       ├── nvim-autopairs.lua
│       ├── nvim-bufferline.lua
│       ├── nvim-cmp.lua
│       ├── nvim-diffview.lua
│       ├── nvim-gitsigns.lua
│       ├── nvim-lsp-installer.lua
│       ├── nvim-lspsaga.lua
│       ├── nvim-lualine.lua
│       ├── nvim-neoscroll.lua
│       ├── nvim-session-manager.lua
│       ├── nvim-signature.lua
│       ├── nvim-telescope.lua
│       ├── nvim-todo-comments.lua
│       ├── nvim-toggleterm.lua
│       ├── nvim-transparent.lua
│       ├── nvim-tree.lua
│       ├── nvim-treesitter.lua
│       └── nvim-whichkey.lua
├── push.sh
├── push2GitHub.sh					# push到github的脚本
├── sessions								# 会话管理器的数据存放目录
│   └── %usr%share%dict.vim
└── shpy-autoheader.vim			# 自动文件头部的vim-script
```

## 截图部分

只介绍几个常用的（实际不止这些）：

- 分屏，两个垂直分屏，一个水平分屏，左边`nvim-tree`，下面状态栏分别为`lualine`和tmux的menu bar

![iShot2022-01-11 14.23.21](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/iShot2022-01-11%2014.23.21.png)

- 悬浮终端，可直接在neovim中弹出终端进行使用，无需关闭或挂起neovim，或者在命令行模式运行，非常方便

![iShot2022-01-11 14.25.02](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/iShot2022-01-11%2014.25.02.png)

- 悬浮lazygit，很好用的一个终端git工具，tui可视化可进行快速提交推送拉取等等操作

![image-20220112152808455](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/image-20220112152808455.png)

- Golang lsp智能提示，可显示函数签名以及一些相关的注释信息

![iShot2022-01-11 14.27.06](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/iShot2022-01-11%2014.27.06.png)

- 快速重命名函数，改变一处函数名称，可以自动改变其相关地方的名称

![iShot2022-01-11 14.27.55](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/iShot2022-01-11%2014.27.55.png)

- 文件内快速查找，快速查找当前光标下所出现的词

![iShot2022-01-11 16.54.09](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/iShot2022-01-11%2016.54.09.png)

- 悬浮函数定义，弹出悬浮窗来显示当前光标下的函数定义，使用gd命令可以直接跳转到函数的定义文件中

![iShot2022-01-11 16.55.02](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/iShot2022-01-11%2016.55.02.png)

- lsp，自动将报错信息打印到行尾，右边为tagbar，可以显示函数和变量等目录树

![iShot2022-01-12 15.02.45](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/iShot2022-01-12%2015.02.45.png)

## 来源

该内容来源于个人博客：https://agou-ops.cn/post/neovim%E8%87%AA%E7%94%A8golang%E5%BC%80%E5%8F%91/

如果大家觉得不错的话，可以点个star:star:分享给更多人.



Done.
||||||| parent of cd8f7f3 (Update README.md)
**Neovim及其插件简单视频介绍：https://www.bilibili.com/video/BV1am4y197bR/  
保姆级安装up主同款Neovim：https://www.bilibili.com/video/BV1YF411i72t/**

## 该仓库用于备份我的dotfiles.

👀注意：`neovim with lua`是我目前在用的配置，里面包含了lua配置. `neovim`文件夹里面的配置是我之前用的（MacOS用户可以直接看里面的`MacOS`目录），纯配置，很少lua【已废弃】.

主要开发语言：`Golang`、`Lua`,脚本语言：`Bash Shell`，文本编辑：`Markdown`

## 截图

![image](https://user-images.githubusercontent.com/57939102/154175393-72f307e2-710d-46b8-930e-0e8f47036ace.png)


- Golang

![image](https://user-images.githubusercontent.com/57939102/148733814-f00d0566-b364-4f86-8bb9-b894a324f0f1.png)

![image](https://user-images.githubusercontent.com/57939102/148733939-c4b1c808-d7dc-484c-ac74-5b6ccdf2ea55.png)

![image](https://user-images.githubusercontent.com/57939102/148733986-49d660a8-6570-421e-8afe-1503c94b6fef.png)


- Lua

![image](https://user-images.githubusercontent.com/57939102/148733899-e891a7cf-e0ca-4864-b501-df436ba2f224.png)




## 仓库内容

包含但不仅限于：

* fish shell
* zsh shell
* bash shell
* neovim
* Tmux
* vim
* pycharm 2020.1
* Windows Terminal

=======
```diff
- 提示：如果只想使用Neovim的配置的话，请手动切换到`nvim`分支.
```

**Neovim及其插件简单视频介绍：https://www.bilibili.com/video/BV1am4y197bR/  
保姆级安装up主同款Neovim：https://www.bilibili.com/video/BV1YF411i72t/**

## 该仓库用于备份我的dotfiles.

👀注意：`neovim with lua`是我目前在用的配置，里面包含了lua配置. `neovim`文件夹里面的配置是我之前用的（MacOS用户可以直接看里面的`MacOS`目录），纯配置，很少lua【已废弃】.

主要开发语言：`Golang`、`Lua`,脚本语言：`Bash Shell`，文本编辑：`Markdown`

## 截图

![image](https://user-images.githubusercontent.com/57939102/154175393-72f307e2-710d-46b8-930e-0e8f47036ace.png)


- Golang

![image](https://user-images.githubusercontent.com/57939102/148733814-f00d0566-b364-4f86-8bb9-b894a324f0f1.png)

![image](https://user-images.githubusercontent.com/57939102/148733939-c4b1c808-d7dc-484c-ac74-5b6ccdf2ea55.png)

![image](https://user-images.githubusercontent.com/57939102/148733986-49d660a8-6570-421e-8afe-1503c94b6fef.png)


- Lua

![image](https://user-images.githubusercontent.com/57939102/148733899-e891a7cf-e0ca-4864-b501-df436ba2f224.png)




## 仓库内容

包含但不仅限于：

* fish shell
* zsh shell
* bash shell
* neovim
* Tmux
* vim
* pycharm 2020.1
* Windows Terminal

>>>>>>> cd8f7f3 (Update README.md)

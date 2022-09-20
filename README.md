🎉 **已升级到Neovim 0.7版本！！！**

```diff
- 提示：如果只想使用Neovim的配置的话，请手动切换到`nvim`分支！！！
+ 修改了一点点配置文件，neovim0.7版本可以直接使用~！！
+ 建议先将所有插件更新到最新.
```

## TL;DR

快速安装(需自己提前安装好`neovim`)：

```bash
git clone https://github.com/AGou-ops/dotfiles.git
cp -a dotfiles/neovim-with-lua ~/.config/nvim
# 如果没有.config/nvim，需要提前创建，mkdir -pv ~/.config/nvim
# 快速安装vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# 执行插件安装
nvim +PlugInstall       # 等待安装完毕即可.
```

**Neovim及其插件简单视频介绍：https://www.bilibili.com/video/BV1am4y197bR/  
保姆级安装up主同款Neovim：https://www.bilibili.com/video/BV1YF411i72t/**

## 该仓库用于备份我的dotfiles.

👀注意：`neovim with lua`是我目前在用的配置，里面包含了lua配置. `neovim`文件夹里面的配置是我之前用的（MacOS用户可以直接看里面的`MacOS`目录），纯配置，很少lua【已废弃】.

主要开发语言：`Golang`、`Lua`,脚本语言：`Bash Shell`，文本编辑：`Markdown`

## 截图

- Neovim dashboard

<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/175773276-d3e45689-44f6-4b24-ba9a-2747226eb2ab.png">


- Tmux

![image-20220408084010889](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/image-20220408084010889.png)


- Golang

<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/180121935-82d55af5-4488-4d2d-a927-d8b08a9459fb.png">


<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/182982646-3abdb806-9f24-442d-add3-50bbedca931c.png">


<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/191188081-1dafc614-caec-47fd-9b67-a7779a53bf8b.png">



![image](https://user-images.githubusercontent.com/57939102/148733939-c4b1c808-d7dc-484c-ac74-5b6ccdf2ea55.png)

![image](https://user-images.githubusercontent.com/57939102/148733986-49d660a8-6570-421e-8afe-1503c94b6fef.png)

## neovim 统计

共计插件`69个`。

启动速度平均`127ms`


![image](https://user-images.githubusercontent.com/57939102/184500448-0fc4a73f-f9cf-4404-8c37-a68326048a47.png)





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


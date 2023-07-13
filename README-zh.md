🎉 **已升级到Neovim 0.10.0-dev版本！！！**

```diff
- 提示：如果只想使用Neovim的配置的话，请手动切换到`nvim`分支！！！
+ 建议先将所有插件更新到最新.
```
👀 **注意：`neovim with lua`使用的是`vim-plug`插件管理器，目前由于已切换至`lazy.nvim`进行管理，所以不再更新！ `neovim`文件夹则是我目前用的配置文件！会一直持续更新.**

## TL;DR

### 快速安装(**需自己提前安装好`neovim`和`nodejs`**)：

依赖软件包等安装（以Debian系为例）：

```bash
sudo apt install wget curl git python3-pip ripgrep ranger lolcat -y
pip3 install pynvim
npm install tree-sitter-cli
# tree-sitter用npm安装不上的话，可以用cargo进行安装
# cargo install tree-sitter-cli
echo "export PATH=$HOME/.local/share/nvim/mason/bin:$PATH" >> ~/.bashrc
# 如果你用的是zsh，请自行替换为`~/.zshrc`
source ~/.bashrc
```

安装配置文件及插件：

⭐️ 新lazy.nvim安装方法：

```diff
mv ~/.config/nvim{,.bak}
git clone -b nvim https://github.com/AGou-ops/dotfiles.git ~/.config/nvim
+ 其他步骤暂无，安装完配置文件后首次会会自动安装.
```

~旧vim-plug插件管理器安装方法：~（已不在更新）

<details>
  <summary>详情</summary>
    ```diff
# 第一步先把仓库克隆下来
    git clone https://github.com/AGou-ops/dotfiles.git
# 拷贝配置文件
    cp -a dotfiles/neovim-with-lua ~/.config/nvim
# 如果没有.config/nvim，需要提前创建，mkdir -pv ~/.config/nvim
# 快速安装vim-plug
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# 执行插件安装
    nvim +PlugInstall       # 等待安装完毕即可.
    ```
</details>

🟥 特别注意：如果安装好之后发现有报错，八成是因为有的软件没有安装，比如`npm`、`node`、`TabNine`等等，你可以在nvim的命令行模式输入`:checkhealth`来进行检查，根据检查信息来手动安装缺少的东西，如果还是有问题，就提个[issue](https://github.com/AGou-ops/dotfiles/issues)吧.

---

## 该仓库用于备份我的dotfiles.

主要开发语言：`Golang`、`Lua`,脚本语言：`Bash Shell`，文本编辑：`Markdown`

## 截图

- Neovim dashboard

<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/175773276-d3e45689-44f6-4b24-ba9a-2747226eb2ab.png">


- Tmux

![image-20220408084010889](https://agou-images.oss-cn-qingdao.aliyuncs.com/others/image-20220408084010889.png)


- Golang

代码补全、代码提示、函数签名、诊断报错信息：

<img width="1534" alt="image" src="https://user-images.githubusercontent.com/57939102/203007534-4eb72a21-a77e-482a-8c95-5dd66a65ca9d.png">

单文件/项目debug（参考``keymap.vim`）：

<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/182982646-3abdb806-9f24-442d-add3-50bbedca931c.png">

代码单元/性能测试（\<leader\>gt,\<leader\>tp）：

<img width="1534" alt="image" src="https://user-images.githubusercontent.com/57939102/208004153-bcf41ea5-c5ac-4227-aa94-cd72dfc39174.png">

源代码小窗查看（gd）：

<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/191188081-1dafc614-caec-47fd-9b67-a7779a53bf8b.png">

代码引用（gf）：

<img width="1534" alt="image" src="https://user-images.githubusercontent.com/57939102/203007772-002c7ca7-b26f-44e2-a998-176a3db3870f.png">


## neovim 统计

### `vim-plug` 管理

<details>
  <summary>展开</summary>

共计插件`70`个。

启动速度平均`109ms`


<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/194984913-9c101911-fbe8-4cbd-ab01-53e41e1bbbb6.png">
</details>

### ⭐️`lazy.nvim`管理

共计插件`82`个。

启动速度平均`20.4ms`（大部分已做`VeryLazy`处理）

<img width="1548" alt="image" src="https://user-images.githubusercontent.com/57939102/218255154-b3a36ed2-0844-4c56-81c4-448aafbfeb86.png">




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

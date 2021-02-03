# oh my zsh 插件

```bash
# 自动补全历史命令
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 实时显示命令正确性
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# sudo plugin
git clone https://github.com/hcgraf/zsh-sudo.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/sudo
# autojump 插件，自动跳转目录
git clone git://github.com/wting/autojump.git
cd autojump
./install.py or ./uninstall.py
# git open 插件
antigen bundle paulirish/git-open
```

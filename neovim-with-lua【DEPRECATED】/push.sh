#!/bin/bash
#
#**************************************************
# Author:         AGou-ops                        *
# E-mail:         agou-ops@foxmail.com            *
# Date:           2022-01-07                      *
# Description:                              *
# Copyright 2022 by AGou-ops.All Rights Reserved  *
#**************************************************

cd ~/myWeb/dotfiles && git checkout master && rsync -avzP --progress --exclude '%Users*'  ~/.config/nvim/  ~/myWeb/dotfiles/neovim-with-lua/


cd ~/myWeb/dotfiles/

find . -name ".DS_Store" -exec rm -f {} \;

echo -e "\n"
read -r -p "同步文件夹完成，是否继续？ [Y/n] " response
response=${response,,} # tolower
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
    cd ~/myWeb/dotfiles/

    export http_proxy=127.0.0.1:9870
    export https_proxy=127.0.0.1:9870

    lazygit

else
    exit -1
fi

git checkout nvim

rsync -avzP --progress --exclude '%Users*' --exclude '.git/' --exclude 'zsh/'  ~/.config/nvim/  ~/myWeb/dotfiles/

find . -name ".DS_Store" -exec rm -f {} \;

lazygit

git checkout master

cd -

#!/bin/bash
#
#**************************************************
# Author:         AGou-ops                        *
# E-mail:         agou-ops@foxmail.com            *
# Date:           2022-01-07                      *
# Description:                              *
# Copyright 2022 by AGou-ops.All Rights Reserved  *
#**************************************************

( cd ~/myWeb/dotfiles && git checkout master && rsync -avzP --progress --delete  --exclude '%Users*'  ~/.config/nvim/  ~/myWeb/dotfiles/neovim-with-lua/ )


cd ~/myWeb/dotfiles/

echo -e "\n"
read -r -p "同步文件夹完成，是否继续？ [Y/n] " response
response=${response,,} # tolower
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
    cd ~/myWeb/dotfiles/

    export http_proxy=127.0.0.1:9870
    export https_proxy=127.0.0.1:9870

    lazygit

    cd -
else
    exit -1
fi

git checkout nvim

rsync -avzP --progress --exclude '%Users*' --exclude 'neovim-with-lua/'  ~/.config/nvim/  ~/myWeb/dotfiles/

lazygit

git checkout master

cd - 


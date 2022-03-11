#!/bin/bash
#
#**************************************************
# Author:         AGou-ops                        *
# E-mail:         agou-ops@foxmail.com            *
# Date:           2022-01-07                      *
# Description:                              *
# Copyright 2022 by AGou-ops.All Rights Reserved  *
#**************************************************

rsync -av --progress ~/.config/nvim/*  ~/myWeb/dotfiles/neovim-with-lua --exclude ~/.config/nvim/sessions/*

echo -e "\n\n"

read -r -p "同步文件夹完成，是否继续？ [Y/n]" response
response=${response,,} # tolower
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
    cd ~/myWeb/dotfiles/neovim-with-lua

    export http_proxy=127.0.0.1:9870
    export https_proxy=127.0.0.1:9870

    lazygit

    cd -
else
    exit -1
fi

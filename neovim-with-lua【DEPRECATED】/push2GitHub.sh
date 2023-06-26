#!/bin/bash
#
#**************************************************
# Author:         AGou-ops                        *
# E-mail:         agou-ops@foxmail.com            *
# Date:           2021-12-30                      *
# Description:                              *
# Copyright 2021 by AGou-ops.All Rights Reserved  *
#**************************************************

cp -aR ~/.config/nvim/* ~/myWeb/dotfiles/neovim-with-lua

cd ~/myWeb/dotfiles/neovim-with-lua

git add -A

echo "============================================"
git status
echo "============================================"

echo -e "\n"

read -p "Enter commit message here: " commitMsg

echo -e "\n"

git commit -m "${commitMsg}"

export http_proxy=127.0.0.1:9870
export https_proxy=127.0.0.1:9870

git push

cd -

trap "echo 'Ctrl-c exit...'; exit 2" SIGINT

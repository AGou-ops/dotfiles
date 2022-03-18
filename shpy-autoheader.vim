" Add header comment for bash shell and python file automatically.
autocmd BufNewFile *.sh,*.py exec ":call SetTitle()"
func SetTitle()
if expand("%:e") == 'sh'
 call setline(1,"#!/bin/bash")
 call setline(2,"#")
 call setline(3,"#**************************************************")
 call setline(4,"# Author:         AGou-ops                        *")
 call setline(5,"# E-mail:         agou-ops@foxmail.com            *")
 call setline(6,"# Date:           ".strftime("%Y-%m-%d"). "                      *")
 call setline(7,"# Description:                              *")
 call setline(8,"# Copyright ".strftime("%Y"). " by AGou-ops.All Rights Reserved  *")
 call setline(9,"#**************************************************")
 call setline(10,"")
 call setline(11,"")
endif
if expand("%:e") == 'py'
    " call setline(1, "\#!/usr/bin/env python")
    " call append(1, "\# encoding: utf-8")
    call setline(1, "\# -*- coding: utf-8 -*-")
    normal G
    normal o
    normal o
endif
endfunc
autocmd BufNewFile * normal G

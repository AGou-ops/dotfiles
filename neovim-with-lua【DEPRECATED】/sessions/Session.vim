let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +480 ~/.config/nvim/init.vim
badd +64 ~/.config/nvim/keymaps.vim
argglobal
%argdel
$argadd init.vim
edit ~/.config/nvim/keymaps.vim
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 32 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 103 + 119) / 239)
exe 'vert 3resize ' . ((&columns * 102 + 119) / 239)
argglobal
enew
file ~/.config/nvim/NvimTree_1
balt ~/.config/nvim/init.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
wincmd w
argglobal
balt ~/.config/nvim/init.vim
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 64 - ((40 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 64
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/init.vim", ":p")) | buffer ~/.config/nvim/init.vim | else | edit ~/.config/nvim/init.vim | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/init.vim
endif
balt ~/.config/nvim/keymaps.vim
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 480 - ((24 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 480
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 32 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 103 + 119) / 239)
exe 'vert 3resize ' . ((&columns * 102 + 119) / 239)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

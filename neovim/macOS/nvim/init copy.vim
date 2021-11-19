" AGou-ops VIMRC FILE         -- Update Date: 2021-11-16
set nocompatible              " be iMproved, required

"
" Begin Plug, Depends On https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'powerline/powerline'
Plug 'dense-analysis/ale'
" Plug 'itchyny/lightline.vim'
Plug 'plasticboy/vim-markdown'
" Dependence `npm -g install instant-markdown-d`
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'miyakogi/seiya.vim'
Plug '907th/vim-auto-save'
Plug 'preservim/tagbar'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" golang dev tools
Plug 'jiangmiao/auto-pairs'    " auto complete brackets
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
" Plug 'will133/vim-dirdiff'
Plug 'tmhedberg/simpylfold'
" Plug 'thaerkh/vim-workspace'  " autosave vim session
" lsp server

" Plug 'neovim/nvim-lspconfig'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }



call plug#end()

" ========= End Plug



"
"
"========== Plugin Settings
"
" ========= LuaLine Settings ===========
lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

EOF
" =========== END LuaLine settings ==========
"

" ========== floaterm settings ===========
autocmd User FloatermOpen        " triggered after opening a new/existed floaterm
hi FloatermNC guibg=gray


" =========================================


" ========== LSP config ========
" lua require("lsp_config")
" 
" autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
" autocmd BufWritePre *.go lua goimports(1000)

" =============================

" autocmd vimenter * NERDTree       " NERDTree automatically when vim starts up
" map <C-n> :NERDTreeToggle<CR>
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
" " auto refresh nerdtree when file changed
" autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
 
map <C-n> :call NERDTreeToggleAndRefresh()<CR>
set splitright        " nerdtree split right instead of left

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

" autoload vim-workspace plugin
" let g:workspace_autocreate = 1
" nnoremap <leader>f :ToggleWorkspace<CR>
" let g:workspace_session_name = 'Session.vim'
" let g:workspace_autosave_always = 1
" let g:workspace_session_directory = $HOME . '/.vim/sessions/'

 
" ===========

" =========  Auto Shell comment.                                                                                                        
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
" ================

colorscheme onedark
" colorscheme gruvbox
set bg=dark
set guifont=Consolas:h14:cANSI:qDRAFT
" colorscheme one
" set background=dark " for the dark version
" let g:one_allow_italics = 1 " I love italic for comments
" set background=dark
" colorscheme solarized
" let g:airline_theme='one'
" set background=dark
" colorscheme solarized

let g:auto_save = 1  " enable AutoSave on Vim startup

let g:instant_markdown_slow = 1

let g:onedark_termcolors=256
set t_Co=256

" --------- nerdcommenter plguin settings
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" ----------------------

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" ================ General Config ====================

syntax on
set number                      "Line numbers are good
" odd, cannot use coc when setting paste option
" set paste                       " set paste mode default

" --------------------------- neovim auto reload file from disk -----------------------------
set autoread                    " Auto reload file content from disk
au CursorHold * checktime  
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
" --------------------------------------------------------------------------------------------

set clipboard=unnamed           " Add clipboard support
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set novisualbell                "No sounds
set noerrorbells
set laststatus=2
set noshowmode
set cursorline                  " set cursorline, highlight current line.
" set cursorcolumn              " set cursorline, highlight current column.
set mouse=a                     " to disable, use `set mouse-=a`.
set mousehide                   " hide the mouse cursor when typing.
set hidden
set vb
set ruler
set spelllang=en_us
set fileformats=unix,dos
set report=0                                                      " always report number of lines changed
set shortmess=atI               " disable welcome page.
set t_ti= t_te=                 " after exit vim, show context on the terminal.
set showmatch
set matchtime=2
set nrformats=
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set ffs=unix,dos,mac            " Use Unix as the standard file type
set autochdir

" vim-gitgutter

set updatetime=500

"-- vim-gitgutter END

set relativenumber number       " use relative line number inside of absolute line number.
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber number    " use absolute line number.
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
" remap <C-n> to switch between relative and absolute line number.
nnoremap <A-n> :call NumberToggle()<cr>

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
  source ~/.config/nvim/vimrc.bundles
endif
au BufNewFile,BufRead *.vundle set filetype=vim

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=2
set tabstop=2
set expandtab
set completeopt=longest,menu


autocmd FileType php,ruby,yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)


" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on
filetype on
filetype plugin indent on

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:��

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
" ================ Auto Cmd =========================

" auto reload when modified vimrc file (Windows)
autocmd! bufwritepost _vimrc source %
" auto reload when modified vimrc file (Linux)
autocmd! bufwritepost .vimrc source %

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
endif

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

" Wildmenu completion {{{
set wildmenu
"set wildmode=list:longest
set wildmode=longest:full,full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
hi Search cterm=NONE ctermfg=black ctermbg=red


" ================ Custom Settings ========================
" so /.yadr/vim/settings.vim

if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif

" ================ Hotkey ReMap =====================

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" Quicker window movement
nnoremap U <C-r>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l
noremap H ^
noremap L $
nnoremap / /\v
vnoremap / /\v
vnoremap // y/<c-r>"<cr>
noremap <A-left> :bp<CR>
noremap <A-right> :bn<CR>
nnoremap ; :
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>0 :tablast<cr>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <leader>t :FloatermNew<CR>


" copy to system clipboard
" vnoremap <leader>y "+y
vnoremap <C-c> "+y
vnoremap <C-v> "+p
nnoremap <C-h> <C-w>>
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-l> <C-w><
nnoremap p ]p
nnoremap P [p
nnoremap ( %
nnoremap ) %


" netrw

nnoremap - :Explore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
autocmd FileType netrw setl bufhidden=delete

"-- netrw END

" turn off direction keyboard, force yourself use `hjkl` !!!
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
map <space> /
map <Esc>[1;3D :bn<CR>
map <Esc>[1;3C :bp<CR>


" tab quick swich
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" eggcache vim 
" :command W w
" :command WQ wq
" :command Wq wq
" :command QA qa

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" ===================== F1-F12 Hotkey Settings
" trun off F1 help page, just use `:help`.
noremap <F1> <Esc>"
" F2 show line number or not
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" F3 show print char
" nnoremap <F3> :set list! list?<CR>
" F3 transparent terminal
nnoremap <F3> :SeiyaEnable<CR>
" F4 wrap line on|off
nnoremap <F4> :set wrap! wrap?<CR>
set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
" F6 trun on|off syntax, speed up read large file
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
" disbale paste mode when leaving insert mode
" au InsertLeave * set nopaste
" F8 trun on tagbar
nmap <F8> :TagbarToggle<CR>

" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
set pastetoggle=<Esc>[201~
set paste
return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" delete Redundant Space when saving Python file
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

autocmd FileType go nmap <Leader>rr :!go run %<CR>


" =========== load coc-go plug config ===========
if filereadable($HOME . ".config/nvim/coc-go.vim")
    source ~/.config/nvim/coc-go.vim
endif

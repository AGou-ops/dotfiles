" general settings
syntax on
" language en_US
" --------------------------
" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

set termguicolors " this variable must be enabled for colors to be applied properly

set synmaxcol=200
set lazyredraw

" --------------------------
"
set number                      "Line numbers are good
" odd, cannot use coc when setting paste option
" set paste                       " set paste mode default
" --------------------------- neovim auto reload file from disk -----------------------------
set autoread                    " Auto reload file content from disk
set clipboard=unnamed           " Add clipboard support
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
" set gcr=a:blnkon0              "Disable cursor blink
" guicursor settings
" highlight Cursor gui=reverse guifg=black guibg=#AAC689
" 相匹配成对的符号高亮，比如括号，花括号等。
" hi MatchParen ctermbg=Yellow guibg=lightblue
" hi MatchParen guifg=red guibg=#f8f8f8

" default guicursor
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"       \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"       \,sm:block-blinkwait175-blinkoff150-blinkon175
set gcr=i:ver25-blinkon5,v:blinkon1


" set ttimeoutlen=10            " key delay time

" make signcolumn background color transparent
set signcolumn=yes
augroup transparent_signs
  au!
  " autocmd ColorScheme * highlight SignColumn guibg=NONE
    autocmd ColorScheme * highlight! link SignColumn LineNr
augroup END

set novisualbell                "No sounds
set noerrorbells
set laststatus=2
set noshowmode
set cursorline                  " set cursorline, highlight current line.
set guifont=Consolas:h14:cANSI:qDRAFT
" set cursorcolumn              " set cursorline, highlight current column.
set mouse=a                     " to disable, use `set mouse-=a`.
set mousehide                   " hide the mouse cursor when typing.
set hidden
set vb
set ruler
set wrap                        " wrap lines
set linebreak                   " Wrap lines at convenient points
set spelllang=en_us
set fileformats=unix,dos
set report=0                    " always report number of lines changed
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
set relativenumber number       " use relative line number inside of absolute line number.
" or:
set guifont=VictorMono_Nerd_Font:h13
" vim-gitgutter
set updatetime=500
" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=2
set tabstop=2
set expandtab
set completeopt=longest,menu
"
" au FileType c,cpp,python,vim,go set textwidth=80
" set colorcolumn=81


" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

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
set wildignorecase
set smartcase       " ...unless we type a capital
hi Search cterm=NONE ctermfg=black ctermbg=red


" ================ netrw ===========================
" let g:netrw_winsize=10
" let g:netrw_liststyle = 3
" " let g:netrw_banner = 0
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1

let g:loaded_matchparen        = 1
let g:loaded_matchit           = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_tarPlugin         = 1
" let g:loaded_man               = 1
let g:loaded_gzip              = 1
let g:loaded_zipPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_remote_plugins    = 1

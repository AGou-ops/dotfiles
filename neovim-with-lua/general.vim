" general settings
syntax on
" --------------------------
" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","
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
set gcr=a:blnkon0              "Disable cursor blink
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
set nowrap                     "Don't wrap lines
set linebreak                 "Wrap lines at convenient points
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

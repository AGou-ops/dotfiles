call plug#begin('~/.vim')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'

call plug#end()

" colorscheme
if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
" ---------------------

" options
set nu
set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

" ---------------------

"  keymaps

noremap y "*y
noremap p "*p
noremap Y "+y
noremap P "+p

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap ; :
imap jk <ESC>

nnoremap <C-n> :NERDTreeToggle<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" ---------------------


autocmd VimEnter * NERDTree | wincmd p
" ---------------------

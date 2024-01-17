" AGou's minial vim config
" Install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

Plug 'preservim/nerdtree'

call plug#end()

" ---------- autocmd
autocmd VimEnter * NERDTree | wincmd p

" ---------- highlights
highlight Visual cterm=reverse ctermbg=NONE

" ---------- keymappings
imap jk <ESC>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap q <Nop>
nnoremap H g^
nnoremap k gk
nnoremap j gj
nnoremap L g_
vnoremap H g^
vnoremap L g_

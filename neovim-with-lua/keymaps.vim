" ================ Hotkey ReMap =====================

" disable leader key in insert mode.
" iunmap <leader>t <nop>
" ex mode close.
" map q :quit<CR>
map q <Nop>

nmap y <Plug>YAMotion
xmap y <Plug>YAVisual
" nmap yy <Plug>YALine

" Quicker window movement
nnoremap U <C-r>
" notworking on terminal neovim, only affect on Gvim!!!
" nnoremap <M-j> <C-w>j
" nnoremap <M-k> <C-w>k
" nnoremap <M-h> <C-w>h
" nnoremap <M-l> <C-w>l
" =====================
" nnoremap <A-Down> <C-w>j
" nnoremap <A-Up> <C-w>k
" nnoremap <A-Left> <C-w>h
" nnoremap <A-Right> <C-w>l

" delete something without yank
" nnoremap d "_d
" nnoremap D "_D
" vnoremap d "_d
" vnoremap D "_D
noremap H ^
" noremap L g_
noremap L g$
noremap k gk
noremap j gj
nnoremap / /\v
vnoremap / /\v
vnoremap // y/<c-r>"<cr>
noremap <C-left> :bp<CR>
noremap <C-right> :bn<CR>
" noremap <C-h> :Goyo<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

" use better-escape instead
" inoremap jk <ESC>
" inoremap <C-d> <DEL>
" inoremap kj <ESC>

nnoremap <C-i> o<C-u>

inoremap <S-CR> <ESC>O
nnoremap ; :
vmap ; :
" not working on macOS
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
" ================
noremap <leader>0 :tablast<cr>
" nnoremap <leader>tt :FloatermNew<CR>
nnoremap <leader>dd :%bdelete<CR>
" add quote for current word
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>q( ciw()<Esc>P
nnoremap <Leader>q{ ciw{}<Esc>P
nnoremap <Leader>q[ ciw[]<Esc>P
nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" ========= toggleterm settings ==========
" autocmd TermEnter term://*toggleterm#*
"             \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><leader>tt <Cmd>exe v:count1 . "ToggleTerm"<CR>
" inoremap <silent><leader>tt <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><leader>gg <Cmd>lua _LAZYGIT_TOGGLE()<CR>

" ========= coc.spelling settings ========
" vmap <leader>s <Plug>(coc-codeaction-selected)
" nmap <leader>s <Plug>(coc-codeaction-selected)

" ========= build-in mksession settings ========
nnoremap <leader>ms <cmd>wa<CR>:mksession! ~/.config/nvim/sessions/
" nnoremap <leader>ls <cmd>wa<CR>:source ~/.config/nvim/sessions/

" ========= auto-sessions settings ========
nnoremap <leader>ss <cmd>SaveSession<CR>
nnoremap <leader>ls <cmd>RestoreSession<CR>
nnoremap <leader>ds <cmd>DeleteSession<CR>

" nnoremap <leader>sl <cmd>lua require('telescope').extensions.possession.list()<CR>

" ========= nvimtree settings ========
nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <C-n> :Neotree<CR>

" ========= window-auto-size plugin settings =======
nnoremap <C-w>z :WindowsMaximize<CR>

" ========= Neogen settings ========
nnoremap gG <cmd>Neogen func<CR>
nnoremap gT <cmd>Neogen type<CR>

" ========= smart-splits settings ========
" recommended mappings
" resizing splits
" nmap <A-Left> :lua require('smart-splits').resize_left()<CR>
" nmap <A-Down> :lua require('smart-splits').resize_down()<CR>
" nmap <A-Up> :lua require('smart-splits').resize_up()<CR>
" nmap <A-Right> :lua require('smart-splits').resize_right()<CR>
" nmap <A-r> :lua require('smart-splits').start_resize_mode()<CR>

" ========= Suda settings ========
" force write a file using Suda.vim (sudo)
nnoremap <leader>fw <cmd>SudaWrite<CR>

" ========= vim-asterisk settings ========
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

" ========= jabs settings ========
nnoremap <leader>ob <cmd>JABSOpen<cr>

" ========= dap/dapui settings ========
nnoremap <silent> <F4> :lua require'dapui'.toggle()<CR>

nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F6> <Cmd>lua require'dap'.terminate()<CR>
nnoremap <silent> <F9> <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader><F9> <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
" nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

" ========= telescope settings ========
" use Leaderf instead
" nnoremap <leader>fF <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false}) <CR>
" keymapping here：https://github.com/nvim-telescope/telescope-file-browser.nvim#mappings
" nnoremap <leader>fF <cmd>Telescope file_browser<CR>
nnoremap <leader>fF <cmd>RnvimrToggle<CR>

function! s:find_files()
    let git_dir = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    if git_dir != ''
        execute "Telescope live_grep cwd=" . git_dir
    else
        execute 'Telescope live_grep'
    endif
endfunction
command! ProjectFiles execute s:find_files()
" nnoremap <leader>fG <cmd>Telescope find_files cwd=s:find_git_root()<cr>
nnoremap <leader>fg <cmd>ProjectFiles<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <leader>fB <cmd>Telescope buffers<cr>
nnoremap <leader>fG <cmd>LeaderfRgInteractive<CR>
nnoremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
nnoremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>ft <cmd>TodoTelescope<cr>

" telescope-dap
nnoremap <leader>dcc <cmd>Telescope dap commands<CR>
nnoremap <leader>dcf <cmd>Telescope dap configurations<CR>
nnoremap <leader>dl <cmd>Telescope dap list_breakpoints<CR>
nnoremap <leader>dv <cmd>Telescope dap variables<CR>
nnoremap <leader>df <cmd>Telescope dap frames<CR>

" ========= Trouble plugin settings ========
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" ========= hop.nvim plugin settings ========
"
nnoremap f <cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>
nnoremap F <cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>
vnoremap f <cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>
vnoremap F <cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>
nnoremap t <cmd>HopWord<cr>
nnoremap T <cmd>HopWord<cr>

" ========= vim-translate settings ========
" more settings: https://github.com/voldikss/vim-translator
" Display translation in a window
nmap <silent> <Leader>ts <Plug>TranslateW
vmap <silent> <Leader>ts <Plug>TranslateWV

" ========= vim-sneak settings ========
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T

" ========= other settings ========
nnoremap <leader>h :UndotreeToggle <bar> :UndotreeFocus<CR>

" =========================================
" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>


" copy to system clipboard
" vnoremap <leader>y "+y
vnoremap <C-c> "+y
vnoremap y "+y
nnoremap y "+y
" vnoremap <C-v> "+p
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>q
nnoremap <C-\> <C-w><bar>

nnoremap p ]p
nnoremap P [p
nnoremap ( %
nnoremap ) %
nnoremap <TAB> %
" ???
inoremap <TAB> <TAB>

" unset highlight
" nnoremap <silent>no <cmd>noh<CR>

" use tab/shift tab to switch coc or native lsp cmp
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" cmdline quickly go to head or tail
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

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

" custom command
" 避免手残输错
command W w
command WQ wq
command Wq wq
command QA qa
" 用户自定义命令首字母必须大写
" vimspector template file, not use anymore.
" command DebugGolang execute "!cp -a ~/.config/nvim/debug-template/go-template/.vimspector.json ."
command Source execute ":source ~/.config/nvim/init.vim"

nnoremap <leader>cp :let @+=expand('%:p')<CR>

" ================ F1-F12 Hotkey Settings =====================
" trun off F1 help page, just use `:help`.
" noremap <F1> <Esc>"
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
nnoremap <F3> :TransparentToggle<CR>
" F4 wrap line on|off
nnoremap <F1> :set wrap! wrap?<CR>
" set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
" F6 turn on|off syntax, speed up read large file
" nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
" disbale paste mode when leaving insert mode
" au InsertLeave * set nopaste
" F8 turn on tagbar
" nmap <F8> :TagbarToggle<CR>

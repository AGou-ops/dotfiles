"AGou-ops VIMRC FILE         -- Update Date: 2022-11-21 09:48:39
set nocompatible              " be iMproved, required
" ============================== Plugin packages ==============================
" Begin Plug, Depends On https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

" ========= colorscheme here. ==========

" Plug 'joshdick/onedark.vim'
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'EdenEast/nightfox.nvim'
" Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
" Plug 'luisiacc/gruvbox-baby'
" Plug 'ellisonleao/gruvbox.nvim'
" Plug 'catppuccin/nvim'

" ========= appearence/performance here. ==========

Plug 'nvim-lualine/lualine.nvim'
Plug 'AGou-ops/dashboard-nvim'

" -- Easily speed up your neovim startup time!
Plug 'dstein64/vim-startuptime'
" -- Speed up Neovim.
Plug 'lewis6991/impatient.nvim'

Plug 'antoinemadec/FixCursorHold.nvim'

" ========= useful tools here. ==========

Plug 'max397574/better-escape.nvim'
" -- markdown preview tool
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" -- force write a file use root.
Plug 'lambdalisue/suda.vim'
" -- auto save file when buffer/event change.
Plug '907th/vim-auto-save'
" -- Vim plugin that displays tags in a window, ordered by scope
Plug 'preservim/tagbar'
" -- just icons, used for nvim-tree, lsp, etc...
Plug 'kyazdani42/nvim-web-devicons'
" -- a slide bar style file broswer.
Plug 'kyazdani42/nvim-tree.lua'
" -- show buffers on the top.
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'famiu/bufdelete.nvim'
" -- auto symbol pairs tool
Plug 'windwp/nvim-autopairs'
" -- beautiful indent
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-context'

" -- A better annotation generator. Supports multiple languages and annotation conventions.
Plug 'danymat/neogen'
" -- A neovim lua plugin to help easily manage multiple terminal windows
Plug 'akinsho/toggleterm.nvim'
" -- All the lua functions.
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" -- ranger file browser
Plug 'kevinhwang91/rnvimr'
" -- show curosr underline.
Plug 'nyngwang/murmur.lua'
" -- just a scrollbar, xd
Plug 'petertriho/nvim-scrollbar'
" -- smooth scroll
Plug 'karb94/neoscroll.nvim'
" -- A comment plugin that support mutilple languages
Plug 'numToStr/Comment.nvim'
" -- powerful multi visual cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" -- undo history tree
Plug 'mbbill/undotree'
" -- auto session manager
Plug 'rmagatti/auto-session'

" -- displays a popup with possible keybindings of the command you started typing.
Plug 'folke/which-key.nvim'
" -- Highlight, list and search todo comments in your projects
Plug 'folke/todo-comments.nvim'
" -- just a translator plugin
Plug 'voldikss/vim-translator'
" -- color highlighter
Plug 'norcalli/nvim-colorizer.lua'
" -- format file
Plug 'sbdchd/neoformat'
" -- Show where your cursor moves when jumping large distances
Plug 'edluffy/specs.nvim'
" -- highlight your search result
Plug 'kevinhwang91/nvim-hlslens'
" -- jump to wherever you want
Plug 'phaazon/hop.nvim'
" -- improved * motions.
Plug 'haya14busa/vim-asterisk'
" -- Another Buffer Switcher
" Plug 'matbme/JABS.nvim'
" -- An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly.
Plug 'Yggdroot/LeaderF'
" -- quickly move selected line or block.
Plug 'booperlv/nvim-gomove'
" -- highlight when using yank
Plug 'svban/YankAssassin.vim'
" -- show file name in corner
" Plug 'b0o/incline.nvim'
" Surround selections, stylishly
Plug 'kylechui/nvim-surround'
" -- fold like vscode
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'
" -- better quickfix window
Plug 'kevinhwang91/nvim-bqf'
" -- forever undo history
Plug 'kevinhwang91/nvim-fundo'

" ========= programming tools here. ==========

" -- lsp server
Plug 'neovim/nvim-lspconfig'
" -- Simple winbar/statusline plugin that shows your current code context
Plug 'SmiteshP/nvim-navic'
" -- A powerful lsp/lint/format... manager
Plug 'williamboman/mason.nvim'

" -- nvim-cmp and its plugins.
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
" -- dictionary cmp plugin
Plug 'octaltree/cmp-look'

" -- debug tools
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" Git integration for buffers
Plug 'lewis6991/gitsigns.nvim'
" powerful lsp tools
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
" -- quickly generate go test file.
Plug 'hiroyaonoe/gotests-vim'
" -- Automatically generate test files
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-go'
" -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
Plug 'sindrets/diffview.nvim'
" -- Displays all diagnostic information in one window
Plug 'folke/trouble.nvim'
" -- preview code definition in a float window
Plug 'rmagatti/goto-preview', { 'for': ['go'] }
" --  async run a command
Plug 'skywind3000/asyncrun.vim'

" ==== tmp test plugins below ===
"

call plug#end()

" ============================== END Plugin packages ==============================

" " ============================== Pre settings ==============================
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
" ============================== END Pre settings ==============================

" ============================== General settings ==============================
" 为了避免出错,我把通用配置项放在前面,一般来说你不需要更改这个文件.
if filereadable($HOME . "/.config/nvim/general.vim")
    source $HOME/.config/nvim/general.vim
endif
" ============================== END General settings ==============================

" ============================== Colorscheme settings ==============================

" ========= gruvbox_material settings =======
" https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
        " Important!!
" For dark version.
set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
" For better performance
let g:gruvbox_material_better_performance = 1

let g:gruvbox_material_diagnostic_text_highlight = 1
" let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_diagnostic_virtual_text = "colored"
let g:gruvbox_material_sign_column_background = 'none'

colorscheme gruvbox-material

" ========= custom highlight group(buildin & Treesitter) settings =======
hi Comment cterm=NONE ctermfg=245 gui=NONE guifg=#928374
hi GitSignsCurrentLineBlame ctermfg=245 gui=italic guifg=#928374

hi TSKeyword ctermfg=167 gui=italic guifg=#ea6962
hi TSKeywordFunction ctermfg=167 gui=italic guifg=#ea6962
hi TSConditional ctermfg=167 gui=italic guifg=#ea6962
hi TreesitterContext ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#3c3836
hi NormalFloat ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#1E2021
hi FloatBorder  ctermfg=142 guifg=#a9b665 guibg=#1E2021
" hi InclineNormal ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
hi lualine_c_inactive ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
" hi FocusedSymbol cterm=italic ctermfg=4 ctermbg=11 gui=bold,italic guifg=#181A1A guibg=#77814C
" hi ErrorText cterm=undercurl ctermbg=52 gui=italic guibg=#442e2d guisp=#ea6962

" ============================== END colorscheme settings ==============================
"
"
" ============================== Plugins(simple) vimL settings ==============================

" ========= autosave settings ==========
let g:auto_save = 1  " enable AutoSave on Vim startup
" let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_events = ["ExitPre", "BufLeave", "WinLeave"]
" let g:auto_save_write_all_buffers = 0  " write all open buffers as if you would use :wa

" ========= LeaderF settings ==========
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'node_modules'],
        \ 'file': []
        \}

let g:Lf_RootMarkers = ['.git', '.gitignore', 'node_modules']
" mode explain: https://github.com/Yggdroot/LeaderF/blob/master/doc/leaderf.txt#L485-L497
let g:Lf_WorkingDirectoryMode = 'A'

let g:Lf_ShortcutF = "<leader>ff"

" ========= rnvimr settings ==========
" Hide the files included in gitignore
let g:rnvimr_hide_gitignore = 0
" Change the border's color
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
" Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 70
" Draw border with both
let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']
" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" Add views for Ranger to adapt the size of floating window
let g:rnvimr_ranger_views = [
            \ {'minwidth': 90, 'ratio': []},
            \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
            \ {'maxwidth': 49, 'ratio': [1]}
            \ ]

" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.75 * &columns)),
            \ 'height': float2nr(round(0.75 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }

" ========= neoformat settings ==========
" fun! Neoformat()
"     if &ft =~ 'vim\|txt\|go'
"         return
"     endif
"     undojoin | Neoformat
" endfun
"
augroup fmt
  autocmd!
  autocmd BufWritePre *.go Neoformat goimports | Neoformat gofumpt
  autocmd BufWritePre *.sh Neoformat
augroup END
" " ignore error
let g:neoformat_only_msg_on_error = 1

" ========= vim-translator settings ==========
let g:translator_target_lang = 'zh'

" ========= copilot settings ==========
" imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true
" let g:copilot_filetypes = {  '*': v:false, }
" \ 'python': v:true,

" ========= startuptime settings ==========
let g:startuptime_tries = 3

" ========= which-key settings ==========
" which-key plugin timeout delay.
set timeoutlen=200

" ========= tagbar settings ==========
" let g:tagbar_ctags_bin='/opt/homebrew/Cellar/universal-ctags/p5.9.20220717.0/bin/ctags'
" autocmd VimEnter *.go  Tagbar
" autocmd VimEnter *.md  Tagbar
let g:tagbar_show_tag_count = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_wrap = 1
let g:tagbar_zoomwidth = 0
let g:tagbar_show_linenumbers = 0
let g:tagbar_autofocus = 0
let g:tagbar_sort = 0
let g:tagbar_map_togglesort = "r"
let g:tagbar_help_visibility = 0
let g:tagbar_show_data_type = 1
let g:tagbar_autopreview = 0

let g:tagbar_type_markdown = {
            \ 'ctagsbin'  : 'mdctags',
            \ 'ctagsargs' : '',
            \ 'kinds'     : [
            \     'a:h1:0:0',
            \     'b:h2:0:0',
            \     'c:h3:0:0',
            \     'd:h4:0:0',
            \     'e:h5:0:0',
            \     'f:h6:0:0',
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \     'a' : 'h1',
            \     'b' : 'h2',
            \     'c' : 'h3',
            \     'd' : 'h4',
            \     'e' : 'h5',
            \     'f' : 'h6',
            \ },
            \ 'scope2kind' : {
            \     'h1' : 'a',
            \     'h2' : 'b',
            \     'h3' : 'c',
            \     'h4' : 'd',
            \     'h5' : 'e',
            \     'h6' : 'f',
            \}
            \}


" ========= nvim-cmp settings ==========
set completeopt=menu,menuone,noselect

" ========= instant-markdown settings ==========
let g:mkdp_filetypes = ['markdown']

" ========= vim-visual-multi settings ==========
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<cr>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<cr>'           " replace visual C-n
let g:VM_mouse_mappings = 1
let g:VM_theme = 'iceblue'
let g:VM_highlight_matches = 'underline'

" ========= lspsaga.nvim settings ==========
highlight link LspSagaFinderSelection Search
" or
" highlight link LspSagaFinderSelection guifg='#ff0000' guibg='#00ff00' gui='bold'

" ============================== END Plugins settings ==============================

" ============================== Autocmd/Function settings ==============================

" autocmd keymap for MarkdownPreview
autocmd BufRead *.md nnoremap <leader>mp <Plug>MarkdownPreview

" don't add comment char when using o mode
autocmd FileType * set formatoptions-=c formatoptions-=o

" disable edit action in man pages.
autocmd FileType man nnoremap a <nop>
autocmd FileType man nnoremap o <nop>

" auto reload when modified vimrc file (Windows)
" autocmd! bufwritepost _vimrc source %
" auto reload when modified vimrc file (Linux)
autocmd! bufwritepost $HOME/.config/nvim/init.vim source %

" vim-visual-mutil hlslens setting
aug VMlens
    au!
    au User visual_multi_start lua require('AGou.nvim-vmlens').start()
    au User visual_multi_exit lua require('AGou.nvim-vmlens').exit()
aug END

" notification after file change
autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" augroup numberToggle
"     autocmd!
"     autocmd InsertEnter,CmdlineEnter,FocusLost * :set norelativenumber number    " use absolute line number.
"     autocmd InsertLeave,CmdLineLeave,FocusGained * :set relativenumber
"     au CmdlineEnter * :redraw!
" augroup END

" toggle number style when input mode changed.
autocmd InsertEnter * set norelativenumber number    " use absolute line number.
autocmd InsertLeave * set relativenumber

autocmd FileType zsh set nowrap

" manual indent for different filetype
autocmd FileType php,ruby,yaml set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4
autocmd FileType php set tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,html,django,xhtml,haml set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown

" filetype settings
" let g:do_filetype_lua = 1             " load filetype.lua
" let g:did_load_filetypes = 0          " don't load filetype.vim
" filetype plugin on
" filetype indent on
filetype on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE(NOT USED!!!)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! RenameFile()
"     let old_name = expand('%')
"     let new_name = input('New file name: ', expand('%'), 'file')
"     if new_name != '' && new_name != old_name
"         exec ':saveas ' . new_name
"         exec ':silent !rm ' . old_name
"         redraw!
"     endif
" endfunction
" map <leader>n :call RenameFile()<cr>

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

" use async terminal instead
autocmd FileType go nmap <Leader>rr :AsyncRun -mode=term -pos=bottom -rows=10 go run $(VIM_FILEPATH)<CR>
autocmd FileType go nmap <Leader>rR :AsyncRun -mode=term -pos=bottom -rows=85 go run $(VIM_FILEPATH)<CR>
autocmd FileType go nmap <Leader>rt :AsyncRun -mode=term -pos=toggleterm go run $(VIM_FILEPATH)<CR>
autocmd FileType go nmap <Leader>r :AsyncRun -mode=term -pos=bottom -rows=10 go run .<CR>
" autocmd FileType go nmap <Leader>gt :AsyncRun -mode=term -pos=bottom -rows=10 go test .<CR>
autocmd FileType go nmap <Leader>gb :AsyncRun -mode=term -pos=bottom -rows=10 go build .<CR>
autocmd FileType * nmap <Leader>ta :AsyncRun -mode=term -pos=bottom -rows=10 zsh<CR>
autocmd FileType html nmap <Leader>rh :AsyncRun -mode=term -pos=bottom -rows=10 npx http-server .<CR>
autocmd FileType markdown nnoremap <C-b> ciw****<left><Esc>P
autocmd FileType markdown vnoremap <C-b> c****<left><Esc>P
autocmd FileType tex nmap <Leader>rr :AsyncRun -mode=term -pos=bottom -rows=10 miktex-xelatex % && open -a "Google Chrome" resume_photo.pdf<CR>

" ============================== END Autocmd settings ==============================

" ============================== External Lua settings ==============================
lua require('AGou')
" ============================== END External Lua settings ==============================

" ============================== External settings ==============================
"
" =========  external keymap settings ==========
if filereadable($HOME . "/.config/nvim/keymaps.vim")
    source $HOME/.config/nvim/keymaps.vim
endif

" ========= Other custom external setting config(Optional) ==========
if filereadable($HOME . "/.config/nvim/shpy-autoheader.vim")
    source $HOME/.config/nvim/shpy-autoheader.vim
endif

" if filereadable($HOME . "/.config/nvim/custom.vim")
"     source $HOME/.config/nvim/custom.vim
" endif

" ============================== THE END. ==============================
" ======================================================================

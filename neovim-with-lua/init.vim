" AGou-ops VIMRC FILE         -- Update Date: 2022年05月09日21:06:28
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
" Plug 'ellisonleao/gruvbox.nvim'
" Plug 'catppuccin/nvim'

" ========= appearence here. ==========

Plug 'nvim-lualine/lualine.nvim'
" Plug 'feline-nvim/feline.nvim'
Plug 'xiyaowong/nvim-transparent'
" Plug 'junegunn/goyo.vim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
" welcome page
" Plug 'mhinz/vim-startify'
" dashboard
Plug 'goolord/alpha-nvim'
" Speed up Neovim.
Plug 'lewis6991/impatient.nvim'

" ========= useful tools here. ==========

Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" windows size auto resize

" neovim notify tool
" Plug 'rcarriga/nvim-notify'

" :w !sudo tee % > /dev/null not working in neovim, fuckkkkk.
Plug 'lambdalisue/suda.vim'
Plug 'camspiers/lens.vim'
Plug '907th/vim-auto-save'
Plug 'preservim/tagbar', { 'for': ['go', 'md'] }
" Plug 'simrat39/symbols-outline.nvim', { 'for': ['go', 'md', 'lua'] }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'famiu/bufdelete.nvim'

Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'akinsho/toggleterm.nvim'
" not longer use fzf, just use telescope
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" All the lua functions.
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-dap.nvim', { 'for': 'go' }

Plug 'itchyny/vim-cursorword'
" Vim plugin for automatically highlighting other uses of the current word under the cursor
" Plug 'rrethy/vim-illuminate'

Plug 'ryanoasis/vim-devicons'
Plug 'sebdah/vim-delve'
" scroll bar
Plug 'petertriho/nvim-scrollbar'
" smmoth scroll: :h scroll.txt  for help
" Plug 'psliwka/vim-smoothie'
Plug 'karb94/neoscroll.nvim'
" Easily speed up your neovim startup time!
Plug 'dstein64/vim-startuptime'
" Plug 'nathom/filetype.nvim'
Plug 'numToStr/Comment.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mbbill/undotree'
" session manager
" Plug 'folke/persistence.nvim'
" Plug 'rmagatti/auto-session'
" Plug 'jedrzejboczar/possession.nvim'

Plug 'folke/which-key.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'folke/zen-mode.nvim'
" works with zen-mode
Plug 'folke/twilight.nvim'

Plug 'norcalli/nvim-colorizer.lua'
Plug 'voldikss/vim-translator'
"
" Plug 'mhartington/formatter.nvim'
Plug 'sbdchd/neoformat'
" Plug 'jose-elias-alvarez/null-ls.nvim'

" conflict with goto-preview plugin, fuckkkkkk.
Plug 'beauwilliams/focus.nvim'
" not working.....
" Plug 'edluffy/specs.nvim'
Plug 'danilamihailov/beacon.nvim'
Plug 'hrsh7th/vim-searchx'

" Plug 'justinmk/vim-sneak'
" Plug 'ggandor/leap.nvim'
Plug 'mrjones2014/smart-splits.nvim'
Plug 'SmiteshP/nvim-gps'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'phaazon/hop.nvim'

Plug 'haya14busa/vim-asterisk'
Plug 'matbme/JABS.nvim'

Plug 'Yggdroot/LeaderF'

" quickly move selected line or block.
Plug 'booperlv/nvim-gomove'
Plug 'svban/YankAssassin.vim'

" 临时不用，有点bug出现，原因未明。
" Plug 'b0o/incline.nvim'

" auto indent different type of file.
" Plug 'tpope/vim-sleuth'

" ========= programming tools here. ==========

Plug 'dense-analysis/ale'
" lsp server
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind-nvim'

" hrsh7th👍：https://github.com/hrsh7th
Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'uga-rosa/cmp-dictionary'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'octaltree/cmp-look'

Plug 'lewis6991/gitsigns.nvim'

Plug 'tami5/lspsaga.nvim'
" Plug 'ray-x/lsp_signature.nvim'
" Plug 'ray-x/go.nvim'
Plug 'buoto/gotests-vim'

" debug toools
" Plug 'puremourning/vimspector', { 'for': ['go'] }
Plug 'mfussenegger/nvim-dap', { 'for': ['go'] }
Plug 'rcarriga/nvim-dap-ui', { 'for': ['go'] }
" Plug 'rcarriga/neotest'

Plug 'sindrets/diffview.nvim'

Plug 'folke/trouble.nvim', { 'for': ['go'] }
Plug 'rmagatti/goto-preview', { 'for': ['go'] }
" Plug 'github/copilot.vim', { 'for': ['go'] }


call plug#end()

" ============================== END Plugin packages ==============================


" ============================== Pre settings ==============================
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
" colorscheme gruvbox
" colorscheme onedark
" set bg=dark
" let g:onedark_termcolors=256
" ===========================
" Example config in VimScript
" let g:tokyonight_style = "night"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
"
"  Change the "hint" color to the "orange" color, and make the "error" color bright red
" let g:tokyonight_colors = {
"   \ 'hint': 'orange',
"   \ 'error': '#ff0000'
" \ }
" colorscheme tokyonight
" ============================
" colorscheme Duskfox
" ============================
" ========= gruvbox_material settings =======
" https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
        " Important!!
if has('termguicolors')
  set termguicolors
endif
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

" original colorscheme gruvbox configuration: https://github.com/morhetz/gruvbox/wiki/Configuration
" colorscheme gruvbox

" custom highlight group(buildin & Treesitter)
hi Comment cterm=NONE ctermfg=245 gui=NONE guifg=#928374
hi GitSignsCurrentLineBlame ctermfg=245 gui=italic guifg=#928374

hi TSKeywordFunction ctermfg=167 gui=italic guifg=#ea6962
hi TSConditional ctermfg=167 gui=italic guifg=#ea6962
hi TSKeywordReturn ctermfg=167 gui=italic guifg=#ea6962
hi NormalFloat ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#3c3836
" hi FocusedSymbol cterm=italic ctermfg=4 ctermbg=11 gui=bold,italic guifg=#181A1A guibg=#77814C


" ============================== END colorscheme settings ==============================
"
"
" ============================== Plugins settings ==============================

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

" ========= neoformat settings ==========
" fun! Neoformat()
"     if &ft =~ 'vim\|txt\|go'
"         return
"     endif
"     undojoin | Neoformat
" endfun
"
" augroup fmt
"   autocmd!
" "   autocmd BufWritePre * undojoin | Neoformat
"   autocmd BufWritePost * call Neoformat()
" augroup END

" autocmd BufWritePre *.go :Neoformat

" ========= indentline settings ==========
" " let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_char = '┆'
" let g:indentLine_concealcursor = 'inc'
" let g:indentLine_conceallevel = 2
"
" " disable by default
" let g:transparent_enabled = v:false
" " not working on macOS, change color for indentLine
" let g:indentLine_setColors = 0
" more simple method to achieve indentline
" set list lcs=tab:\┆\

" ========= autopairs settings ==========
" defalut options

" ========= vim-translator settings ==========
let g:translator_target_lang = 'zh'

" ========= copilot settings ==========
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
let g:copilot_filetypes = {  '*': v:false, }
" \ 'python': v:true,

" ========= beacon settings ==========
" https://github.com/DanilaMihailov/beacon.nvim
" highight Beacon guibg=white ctermbg=15l
let g:beacon_size = 80
" let g:beacon_show_jumps = 0

" ========= startuptime settings ==========
let g:startuptime_tries = 3

" which-key plugin timeout delay.
set timeoutlen=200

" ========= tagbar settings ==========
let g:tagbar_ctags_bin='/opt/homebrew/Cellar/ctags/5.8_2/bin/ctags'
" autocmd VimEnter *.go  Tagbar
" autocmd VimEnter *.md  Tagbar
let g:tagbar_show_tag_count = 1
let g:tagbar_wrap = 1
let g:tagbar_zoomwidth = 0
let g:tagbar_show_linenumbers = 0
let g:tagbar_autofocus = 0
let g:tagbar_sort = 0
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

" ========= goyo settings ==========
" let g:goyo_width = '60%'
" let g:goyo_height = '85%'
" " line number
" let g:goyo_linenr = 0

" ========= firenvim settings ==========
" if exists('g:started_by_firenvim')
"   set guifont=Fira_Code:h30
" end

" ========= auto-session settings ==========
" let g:auto_session_root_dir = '~/.vim/sessions/'
" nnoremap <leader>ss <cmd>SaveSession<CR>
" nnoremap <leader>sd <cmd>!rm -f ~/.config/nvim/sessions/*<CR>

" ========= instant-markdown settings ==========
let g:mkdp_filetypes = ['markdown.mkd']

autocmd BufRead *.md nnoremap <leader>mp <Plug>MarkdownPreview

" ========= persistence(auto session) settings ==========

" restore the session for the current directory
" nnoremap <leader>ss <cmd>lua require("persistence").load()<CR>
" " restore the last session
" nnoremap <leader>sl <cmd>lua require("persistence").load({ last = true })<CR>
" " stop Persistence => session won't be saved on exit
" nnoremap <leader>s <cmd>lua require("persistence").stop()<CR>

" ========= vim-visual-multi settings ==========
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<cr>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<cr>'           " replace visual C-n
let g:VM_mouse_mappings = 1
let g:VM_theme = 'iceblue'
let g:VM_highlight_matches = 'underline'

" ========= wilder command bar settings ==========
" Default keys
call wilder#setup({'modes': [':', '/', '?']})
" warnning: 增加以下配置会增加nvim启动时间（大概60ms）
" call wilder#set_option('pipeline', [
"       \   wilder#branch(
"       \     wilder#python_file_finder_pipeline({
"       \       'file_command': ['rg', '--files'],
"       \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
"       \       'filters': ['fuzzy_filter', 'difflib_sorter'],
"       \     }),
"       \     wilder#cmdline_pipeline(),
"       \     wilder#python_search_pipeline(),
"       \   ),
"       \ ])
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
            \ 'border': 'rounded',
            \ 'highlighter': wilder#basic_highlighter(),
            \ 'highlights': {
                \   'border': 'Normal',
                \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
                \ },
                \ 'left': [
                    \   ' ', wilder#popupmenu_devicons(),
                    \ ],
                    \ 'right': [
                        \   ' ', wilder#popupmenu_scrollbar(),
                        \ ],
                        \ })))

" ========= scrollbar settings ==========
" more settings --> :h Scrollbar.nvim
" augroup ScrollbarInit
"     autocmd!
"     autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
"     autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
"     autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
" augroup end
"
" let g:scrollbar_shape = {
"             \ 'head': '█',
"             \ 'body': '█',
"             \ 'tail': '█',
"             \ }

" ========= lspsaga.nvim settings ==========
highlight link LspSagaFinderSelection Search
" or
" highlight link LspSagaFinderSelection guifg='#ff0000' guibg='#00ff00' gui='bold'
"
" ========= coc.nvim witelist CocGroup
" augroup CocGroup
"   autocmd!
"   " disable coc.nvim
"   autocmd BufNew,BufRead,BufReadPost * execute "CocDisable"
"   " witelist below
"   autocmd BufNew,BufEnter,BufRead,BufReadPost *.go execute "CocDisable"
" augroup end
" ========= END coc.nvim witelist settings ==========


" ========= illuminate settings ==========
" Time in milliseconds (default 0)
let g:Illuminate_delay = 3000
hi illuminatedWord cterm=underline gui=underline
" hi illuminatedCurWord cterm=italic gui=italic
" augroup illuminate_augroup
"     autocmd!
"     autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
" augroup END

" ============ echodoc.vim settings =======
" set cmdheight=2

" Or, you could use neovim's floating text feature.
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'floating'
" " To use a custom highlight for the float window,
" " change Pmenu to your highlight group
" highlight link EchoDocFloat Pmenu

" ============= go.nvim settings ==========
"

" ============= vim-move settings ==========
let g:move_key_modifier = 'C'
"
" ============= vimspector(go) settings ==========
"
" let g:vimspector_enable_mappings = 'HUMAN'
" " default keymap below
" " | KEY          | FUNCTION                                                  | API                                                          |
" " | :----------- | :-------------------------------------------------------- | :----------------------------------------------------------- |
" " | `F5`         | When debugging, continue. Otherwise start debugging.      | `vimspector#Continue()`                                      |
" " | `F3`         | Stop debugging.                                           | `vimspector#Stop()`                                          |
" " | `F4`         | Restart debugging with the same configuration.            | `vimspector#Restart()`                                       |
" " | `F6`         | Pause debuggee.                                           | `vimspector#Pause()`                                         |
" " | `F9`         | Toggle line breakpoint on the current line.               | `vimspector#ToggleBreakpoint()`                              |
" " | `<leader>F9` | Toggle conditional line breakpoint on the current line.   | `vimspector#ToggleBreakpoint( { trigger expr, hit count expr } )` |
" " | `F8`         | Add a function breakpoint for the expression under cursor | `vimspector#AddFunctionBreakpoint( '<cexpr>' )`              |
" " | `<leader>F8` | Run to Cursor                                             | `vimspector#RunToCursor()`                                   |
" " | `F10`        | Step Over                                                 | `vimspector#StepOver()`                                      |
" " | `F11`        | Step Into                                                 | `vimspector#StepInto()`                                      |
" " | `F12`        | Step out of current function scope                        | `vimspector#StepOut()`                                       |
" nmap <leader>vl :call vimspector#Launch()<CR>
" nmap <leader>vr :VimspectorReset<CR>
" nmap <leader>ve :VimspectorEval
" nmap <leader>vw :VimspectorWatch
" nmap <leader>vo :VimspectorShowOutput
" nmap <leader>vi <Plug>VimspectorBalloonEval
" xmap <leader>vi <Plug>VimspectorBalloonEval
" setlocal nobuflisted
"
" " for normal mode - the word under the cursor
" nmap <Leader>di <Plug>VimspectorBalloonEval
" " for visual mode, the visually selected text
" xmap <Leader>di <Plug>VimspectorBalloonEval
"
" let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug2' ]
"
" " for normal mode - the word under the cursor
" nmap <Leader>di <Plug>VimspectorBalloonEval
" " for visual mode, the visually selected text
" xmap <Leader>di <Plug>VimspectorBalloonEval

" ========= floaterm settings[NOT USED] ==========
" autocmd User FloatermOpen        " triggered after opening a new/existed floaterm
" hi FloatermNC guibg=gray

" ========= toggleterm settings ==========
" autocmd TermEnter term://*toggleterm#*
"             \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><leader>tt <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><leader>tt <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><leader>gg <Cmd>lua _LAZYGIT_TOGGLE()<CR>

" ========= current cursor settings ==========
" " Twins of word under cursor:
" let g:vim_current_word#highlight_twins = 1
" The word under cursor:
" let g:vim_current_word#highlight_current_word = 1
" autocmd BufAdd NERD_tree_*,your_buffer_name.rb,*.js :let b:vim_current_word_disabled_in_this_buffer = 1
" " hi CurrentWord ctermbg=53
" " hi CurrentWordTwins ctermbg=237
" " let g:vim_current_word#highlight_only_in_focused_window = 1
" " hi CurrentWordTwins guifg=#XXXXXX guibg=#XXXXXX gui=underline,bold,italic ctermfg=XXX ctermbg=XXX cterm=underline,bold,italic
" hi CurrentWord guifg=0 guibg=163 gui=underline,bold,italic ctermfg=0 ctermbg=163 cterm=underline,bold,italic

" ========== vim-cursor settings ===========
" let g:cursorword_highlight = 0
let g:cursorword_delay = 0
" autocmd Colorscheme * highlight CursorWord0 cterm=underline gui=underline ctermbg=52 guibg=#303030
" autocmd Colorscheme * highlight CursorWord1 cterm=underline gui=underline ctermbg=52 guibg=#303030
" highlight CursorWord0 cterm=underline gui=underline guisp=#ebcb8b
" highlight CursorWord1 cterm=underline gui=underline guisp=#ebcb8b
" augroup cursorword
"   autocmd!
"   autocmd VimEnter,ColorScheme * call MyHighlight()
" augroup END
"
" function! MyHighlight() abort
"   highlight CursorWord0 cterm=bold,underline gui=bold,underline
"
"   redir => out
"     silent! highlight CursorLine
"   redir END
"   execute 'highlight CursorWord1 cterm=underline gui=underline'
"     \ matchstr(out, 'ctermbg=#\?\w\+')
"     \ matchstr(out, 'guibg=#\?\w\+')
" endfunction

" ========== vim-cursor settings ===========
" lua require("lsp_config")
"
" autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
" autocmd BufWritePre *.go lua goimports(1000)


" autocmd vimenter * NERDTree       " NERDTree automatically when vim starts up
" map <C-n> :NERDTreeToggle<CR>
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" " auto refresh nerdtree when file changed
" autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

" !! 弃用NerdTree 改为下面的nvim-tree.lua
" ==========
" map <C-n> :call NERDTreeToggleAndRefresh()<CR>
" set splitright        " nerdtree split right instead of left
"
" function NERDTreeToggleAndRefresh()
"   :NERDTreeToggle
"   if g:NERDTree.IsOpen()
"     :NERDTreeRefreshRoot
"   endif
" endfunction
" =========

" autoload vim-workspace plugin
" let g:workspace_autocreate = 1
" nnoremap <leader>f :ToggleWorkspace<CR>
" let g:workspace_session_name = 'Session.vim'
" let g:workspace_autosave_always = 1
" let g:workspace_session_directory = $HOME . '/.vim/sessions/'
"
set termguicolors " this variable must be enabled for colors to be applied properly


" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue

let g:auto_save = 1  " enable AutoSave on Vim startup

let g:instant_markdown_slow = 1

set t_Co=256

" ============================== END Plugins settings ==============================


" ============================== Autocmd/Function settings ==============================
"

autocmd ColorScheme * runtime lua/vim/lsp/diagnostic.lua

" don't add comment char when using o mode
autocmd FileType * setlocal formatoptions-=c formatoptions-=o

" disable edit action in man pages.
autocmd FileType man nnoremap a <nop>
autocmd FileType man nnoremap o <nop>

" highlight when yank something.

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


" some error occur
" au CursorHold * checktime
" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
" --------------------------------------------------------------------------------------------

" au FocusLost * :set norelativenumber number
" au FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber number    " use absolute line number.
autocmd InsertLeave * :set relativenumber
" function! NumberToggle()
"     if(&relativenumber == 1)
"         set norelativenumber number
"     else
"         set relativenumber
"     endif
" endfunc
" remap <C-n> to switch between relative and absolute line number.
" nnoremap <C-n> :call NumberToggle()<cr>

" ============= Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
    source ~/.config/nvim/vimrc.bundles
endif
au BufNewFile,BufRead *.vundle set filetype=vim

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

" indent for different filetype
autocmd FileType php,ruby,yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" filetype settings
let g:do_filetype_lua = 1             " load filetype.lua
let g:did_load_filetypes = 0          " don't load filetype.vim
" filetype plugin on
" filetype indent on
filetype on


if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
endif

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
autocmd FileType go nmap <Leader>r :!go run .<CR>
autocmd FileType go nmap <Leader>gt :!go test .<CR>
autocmd FileType html nmap <Leader>rh :!npx http-server .<CR>

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

"
if filereadable($HOME . "/.config/nvim/shpy-autoheader.vim")
    source $HOME/.config/nvim/shpy-autoheader.vim
endif

" =========== load coc-go plug config ===========
" if filereadable($HOME . ".config/nvim/coc-go.vim")
"     source ~/.config/nvim/coc-go.vim
" endif

" ========= Other custom external setting config(Optional) ==========
if filereadable($HOME . "/.config/nvim/custom.vim")
    source $HOME/.config/nvim/custom.vim
endif
" ============================== THE END. ==============================
" ======================================================================

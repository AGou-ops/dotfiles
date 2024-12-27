return {
    { ---- colorscheme.
        'sainnhe/gruvbox-material',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd([[
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
			let g:gruvbox_material_enable_italic = 1
			let g:gruvbox_material_inlay_hints_background = 'dimmed'

            let g:gruvbox_material_diagnostic_text_highlight = 1
            "let g:gruvbox_material_diagnostic_line_highlight = 1
            let g:gruvbox_material_diagnostic_virtual_text = "colored"
            let g:gruvbox_material_sign_column_background = 'none'

            colorscheme gruvbox-material
            ]])
        end,
    },
    { ---- A plugin show neovim startup time.
        'dstein64/vim-startuptime',
        event = 'VeryLazy',
        cmd = 'StartupTime',
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
    { ---- enhance jk.
        'max397574/better-escape.nvim',
        event = 'VeryLazy',
        config = function()
            require('better_escape').setup({
                -- mapping = { 'jk', 'jj', 'kj', 'jl' }, -- a table with mappings to use
                -- timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
                -- clear_empty_lines = false, -- clear line after escaping if there is only whitespace
                -- keys = '<Esc>', -- keys used for escaping, if it is a function will use the result every time
                -- example(recommended)
                -- keys = function()
                --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
                -- end,
            })
        end,
    },
    { ---- A markdonw online real-time preview plugin.
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npm install',
        enabled = false,
        config = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        ft = { 'markdown' },
    },
    { ---- Read or write file with sudo.
        'lambdalisue/suda.vim',
        event = 'VeryLazy',
    },
    { ---- A plugin show code outline.
        'preservim/tagbar',
        event = 'VeryLazy',
        cmd = 'Tagbar',
        -- ft = { 'markdown', 'go', 'lua' },
        config = function()
            vim.cmd([[
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
               ]])
        end,
    },
    { ---- Symbol auto pair.
        'm4xshen/autoclose.nvim',
        event = 'VeryLazy',
        config = function()
            require('autoclose').setup({
                options = {
                    disable_when_touch = true,
                    pair_spaces = true,
                },
            })
        end,
    },
    { ---- Auto generate some comments.
        'danymat/neogen',
        event = 'VeryLazy',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = true,
    },
    -- { ---- Quikly comment plugin.
    --     'numToStr/Comment.nvim',
    --     event = 'VeryLazy',
    --     config = function()
    --         require('Comment').setup()
    --     end,
    -- },
    { ---- Multiple cursors plugin for vim/neovim
        'mg979/vim-visual-multi',
        event = 'VeryLazy',
        config = function()
            vim.cmd([[
    			let g:VM_maps = {}
    			let g:VM_maps['Find Under']         = '<cr>'           " replace C-n
    			let g:VM_maps['Find Subword Under'] = '<cr>'           " replace visual C-n
    			let g:VM_mouse_mappings = 1
    			let g:VM_theme = 'iceblue'
    			let g:VM_highlight_matches = 'underline'
    			]])
        end,
    },
    { ---- Undo tree.
        'mbbill/undotree',
        event = 'VeryLazy',
    },
    { ---- Just a translate plugin.
        'voldikss/vim-translator',
        event = 'VeryLazy',
        enabled = false,
        config = function()
            vim.cmd([[
               let g:translator_target_lang = 'zh'
               ]])
        end,
    },
    { ---- Format file.
        'sbdchd/neoformat',
        event = 'VeryLazy',
        cmd = 'Neoformat',
        enabled = true,
        config = function()
            vim.cmd([[
       " augroup fmt
       " autocmd!
       " autocmd BufWritePre *.go Neoformat goimports | Neoformat gofumpt
       " autocmd BufWritePre *.sh Neoformat
       " augroup END
       " " ignore error
       let g:neoformat_only_msg_on_error = 1
    let g:neoformat_enabled_go = ['goimports', 'gofumpt' ]
    let g:neoformat_enabled_lua = ['stylua']
            ]])
        end,
    },
    { ---- > An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly for both vim and neovim.
        'Yggdroot/LeaderF',
        enabled = false,
        event = 'VeryLazy',
        config = function()
            vim.cmd([[
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

                   let g:Lf_RootMarkers = ['.git', '.gitignore', 'node_modules', 'go.mod']
                   " mode explain: https://github.com/Yggdroot/LeaderF/blob/master/doc/leaderf.txt#L485-L497
                   let g:Lf_WorkingDirectoryMode = 'A'
               ]])
        end,
    },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        ---- A code preview plugin.
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup({
                width = 120, -- Width of the floating window
                height = 15, -- Height of the floating window
                border = {
                    '↖',
                    '─',
                    '┐',
                    '│',
                    '┘',
                    '─',
                    '└',
                    '│',
                }, -- Border characters of the floating window
                default_mappings = false, -- Bind default mappings
                debug = false, -- Print debug information
                opacity = 0, -- 0-100 opacity level of the floating window where 100 is fully transparent.
                resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
                post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- references = { -- Configure the telescope UI for slowing the references cycling window.
                --   telescope = telescope.themes.get_dropdown({ hide_preview = false })
                -- };
                -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality
                focus_on_open = true, -- Focus the floating window when opening it.
                dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
                force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
                bufhidden = 'wipe', -- the bufhidden option to set on the floating window. See :h bufhidden
            })
        end,
    },
    { ---- Async run a custom command.
        'skywind3000/asyncrun.vim',
        ft = { 'go', 'python', 'lua', 'tex', 'html' },
        config = function()
            vim.cmd([[
    		let g:asynctasks_term_reuse = 1
    	]])
        end,
    },
    { ---- Show current cursor word.
        'xiyaowong/nvim-cursorword',
        event = 'VeryLazy',
        enabled = true,
        config = function()
            vim.cmd([[
    		hi default CursorWord cterm=underline gui=underline
    		let g:cursorword_disable_filetypes = []
    		let g:cursorword_min_width = 3
    		]])
        end,
    },
    { ---- > 🍁 Fun little plugin that can be used as a screensaver and on your dashboard
        'folke/drop.nvim',
        event = 'VimEnter',
        ft = { 'dashboard' },
        config = function()
            if not vim.g.neovide then
                require('drop').setup({
                    theme = 'auto', -- can be one of rhe default themes, or a custom theme
                    max = 80, -- maximum number of drops on the screen
                    interval = 100, -- every 150ms we update the drops
                    screensaver = 1000 * 60 * 15, -- show after 15 minutes. Set to false, to disable
                    filetypes = { 'dashboard', 'alpha', 'starter' }, -- will enable/disable automatically for the following filetypes
                    winblend = 100, -- winblend for the drop window
                })
            end
        end,
    },
    { ---- colorizer your neovim.
        'norcalli/nvim-colorizer.lua',
        event = 'VeryLazy',
        config = function()
            require('colorizer').setup({ '*' }, {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                names = true, -- "Name" codes like Blue
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                -- Available modes: foreground, background
                mode = 'background', -- Set the display mode.})
                --[[ #558817
    		-- Red Blue Yellow
    		--]]
            })
        end,
    },
    { ---- cool standalone UI for nvim-lsp progress
        'j-hui/fidget.nvim',
        branch = 'legacy',
        ft = { 'lua', 'go' },
        config = true,
    },
    { ---- session manager
        'Shatur/neovim-session-manager',
        enabled = false,
        event = 'VeryLazy',
        keys = {
            {
                '<leader>ss',
                '<cmd>SessionManager save_current_session<CR>',
                desc = 'save session',
            },
            {
                '<leader>sl',
                '<cmd>SessionManager load_last_session<CR>',
                desc = 'load last session',
            },
            {
                '<leader>sc',
                '<cmd>SessionManager load_session<CR>',
                desc = 'load session',
            },
            {
                '<leader>sd',
                '<cmd>SessionManager delete_session<CR>',
                desc = 'delete session',
            },
        },
        opts = function()
            return {
                autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
                autosave_last_session = false,
            }
        end,
    },
    { -- go implement tool
        'edolphin-ydf/goimpl.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        ft = 'go',
        enabled = false,
        config = function()
            vim.api.nvim_set_keymap(
                'n',
                '<leader>im',
                [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]],
                { noremap = true, silent = true }
            )
            require('telescope').load_extension('goimpl')
        end,
    },
    { -- Batch replacement tool
        'AckslD/muren.nvim',
        enabled = false,
        config = true,
        event = 'VeryLazy',
        cmd = 'MurenToggle',
        keys = {
            {
                '<leader>re',
                function()
                    vim.cmd([[MurenToggle]])
                end,
                desc = 'Toggle muren UI',
            },
        },
    },
    {
        'dgagn/diagflow.nvim',
        event = 'VeryLazy',
        enabled = false,
        ft = { 'go', 'lua' },
        config = function()
            require('diagflow').setup({
                enable = true,
                max_width = 60, -- The maximum width of the diagnostic messages
                severity_colors = { -- The highlight groups to use for each diagnostic severity level
                    error = 'DiagnosticFloatingError',
                    warning = 'DiagnosticFloatingWarning',
                    info = 'DiagnosticFloatingInfo',
                    hint = 'DiagnosticFloatingHint',
                },
                gap_size = 1,
                scope = 'line', -- 'cursor', 'line'
                padding_top = 0,
            })
        end,
    },
    { -- picgo markdown
        'askfiy/nvim-picgo',
        enabled = false,
        ft = { 'md', 'markdown' },
        config = function()
            require('nvim-picgo').setup({
                notice = 'echo',
                image_name = true,
            })
        end,
    },
    { -- go test auto generation tool
        'yanskun/gotests.nvim',
        ft = 'go',
        config = function()
            require('gotests').setup()
        end,
    },
    { -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
        'folke/neodev.nvim',
        opts = {},
    },
    { -- git tui tool
        'NeogitOrg/neogit',
        dependencies = 'nvim-lua/plenary.nvim',
        event = 'VeryLazy',
        enabled = false,
        config = function()
            require('neogit').setup({})
        end,
    },
    { -- highlight text when undo or redo
        'tzachar/highlight-undo.nvim',
        event = 'VeryLazy',
        config = function()
            require('highlight-undo').setup({})
        end,
    },
    { -- Apply highlights in different modes and operators, active and inactive windows.
        'rasulomaroff/reactive.nvim',
        event = 'VeryLazy',
        enabled = false,
        config = function()
            require('reactive').setup({
                builtin = {
                    cursorline = true,
                    cursor = true,
                    modemsg = true,
                },
            })
        end,
    },
    { -- auto close lsp server when losing focus. ( save mem )
        'hinell/lsp-timeout.nvim',
        lazy = false,
        enabled = false,
        dependencies = { 'neovim/nvim-lspconfig' },
        init = function()
            vim.g.lspTimeoutConfig = {
                stopTimeout = 1000 * 60 * 5, -- ms, timeout before stopping all LSPs
                startTimeout = 1000 * 10, -- ms, timeout before restart
                silent = false, -- true to suppress notifications
                filetypes = {
                    ignore = { -- filetypes to ignore; empty by default
                        -- lsp-timeout is disabled completely
                    }, -- for these filetypes
                },
            }
        end,
    },
    { -- Tint inactive windows in Neovim using window-local highlight namespaces.
        'levouh/tint.nvim',
        event = 'VeryLazy',
        enabled = false,
        config = function()
            require('tint').setup({
                tint = -3, -- Darken colors, use a positive value to brighten
                saturation = 0.8, -- Saturation to preserve
                transforms = require('tint').transforms.SATURATE_TINT, -- Showing default behavior, but value here can be predefined set of transforms
                tint_background_colors = true, -- Tint background portions of highlight groups
                highlight_ignore_patterns = { 'WinSeparator', 'Status.*' }, -- Highlight group patterns to ignore, see `string.find`
            })
        end,
    },
    { -- sub stitute
        'chrisgrieser/nvim-rip-substitute',
        enabled = false,
        keys = {
            {
                '<leader>fs',
                function()
                    require('rip-substitute').sub()
                end,
                mode = { 'n', 'x' },
                desc = ' rip substitute',
            },
        },
    },
    { -- show golang implements
        'maxandron/goplements.nvim',
        ft = 'go',
        opts = {
            prefix = {
                interface = 'implemented by: ',
                struct = 'implements: ',
            },
            display_package = true,
            highlight = 'Goplements',
        },
    },
    {
        'MagicDuck/grug-far.nvim',
        config = function()
            vim.g.maplocalleader = ','
            require('grug-far').setup({})
        end,
        keys = {
            {
                '<leader>wr',
                function()
                    require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })
                end,
                desc = 'Find and Replace word in current file.',
            },
            {
                '<leader>wR',
                function()
                    require('grug-far').open()
                end,
                desc = 'Find and Replace word in whole project.',
            },
        },
    },
}

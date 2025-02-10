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
    -- { ---- Quickly comment plugin.
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
    { -- highlight text when undo or redo
        'tzachar/highlight-undo.nvim',
        event = 'VeryLazy',
        config = function()
            require('highlight-undo').setup({})
        end,
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

return {
	{
		"sainnhe/gruvbox-material",
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

            let g:gruvbox_material_diagnostic_text_highlight = 1
            " let g:gruvbox_material_diagnostic_line_highlight = 1
            let g:gruvbox_material_diagnostic_virtual_text = "colored"
            let g:gruvbox_material_sign_column_background = 'none'

            colorscheme gruvbox-material
            ]])
		end
	}, {
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function() vim.g.startuptime_tries = 10 end
	}, {
		"max397574/better-escape.nvim",
		lazy = false,
		config = function()
			require("better_escape").setup {
				mapping = { "jk", "jj" }, -- a table with mappings to use
				timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>" -- keys used for escaping, if it is a function will use the result everytime
				-- example(recommended)
				-- keys = function()
				--   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
				-- end,
			}
		end
	}, {
		"907th/vim-auto-save",
		lazy = false,
		config = function()
			vim.cmd([[
				let g:auto_save = 1
				let g:auto_save_events = ["InsertLeave", "TextChanged"]
			]])
		end
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		config = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" }
	}, { "lambdalisue/suda.vim" }, {
		"preservim/tagbar",
		ft = { "markdown", "go", "lua", },
		config = function()
			vim.cmd([[

            ]])
		end,
	}, {
		"m4xshen/autoclose.nvim",
		lazy = false,
		config = function() require("autoclose").setup({}) end
	}, {
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	}, {
		"numToStr/Comment.nvim",
		lazy = false,
		config = function() require('Comment').setup() end
	}, {
		"mg979/vim-visual-multi",
		config = function()
			vim.cmd([[
            let g:VM_maps = {}
            let g:VM_maps['Find Under']         = '<cr>'           " replace C-n
            let g:VM_maps['Find Subword Under'] = '<cr>'           " replace visual C-n
            let g:VM_mouse_mappings = 1
            let g:VM_theme = 'iceblue'
            let g:VM_highlight_matches = 'underline'
            ]])
		end
	}, {
		"mbbill/undotree",
		lazy = false
	}, {
		"voldikss/vim-translator",
		config = function()
			vim.cmd([[
            let g:translator_target_lang = 'zh'
            ]])
		end
	}, {
		"norcalli/nvim-colorizer.lua",
		config = function() require('colorizer').setup() end
	}, {
		"sbdchd/neoformat",
		ft = { "go", "lua" },
		config = function()
			vim.cmd([[
        augroup fmt
        autocmd!
        autocmd BufWritePre *.go Neoformat goimports | Neoformat gofumpt
        autocmd BufWritePre *.sh Neoformat
        augroup END
        " " ignore error
        let g:neoformat_only_msg_on_error = 1
        ]])
		end
	}, {
		"phaazon/hop.nvim",
		lazy = false,
		config = function() require 'hop'.setup() end
	}, {
		"Yggdroot/LeaderF",
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

                let g:Lf_RootMarkers = ['.git', '.gitignore', 'node_modules']
                " mode explain: https://github.com/Yggdroot/LeaderF/blob/master/doc/leaderf.txt#L485-L497
                let g:Lf_WorkingDirectoryMode = 'A'

                let g:Lf_ShortcutF = "<leader>ff"
            ]])
		end
	}, {
		"SmiteshP/nvim-navic",
		ft = { "go", "lua" },
		config = function()
			vim.g.navic_silence = true
			require("nvim-navic").setup({
				separator = " ",
				highlight = true,
				depth_limit = 5
			})
		end
	}, { "williamboman/mason-lspconfig.nvim" }, {
		"rmagatti/goto-preview",
		config = function()
			require('goto-preview').setup {
				width = 120, -- Width of the floating window
				height = 15, -- Height of the floating window
				border = {
					"↖", "─", "┐", "│", "┘", "─", "└", "│"
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
				bufhidden = "wipe" -- the bufhidden option to set on the floating window. See :h bufhidden
			}
		end
	}, { "skywind3000/asyncrun.vim" },
	{
		"xiyaowong/nvim-cursorword",
		lazy = false,
		config = function()
			vim.cmd([[
			hi default CursorWord cterm=underline gui=underline
			let g:cursorword_disable_filetypes = []
			let g:cursorword_min_width = 3
			]])
		end
	}
}

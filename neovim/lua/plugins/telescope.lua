return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({
					cwd = require("lazy.core.config").options.root
				})
			end,
			desc = "Find Plugin File"
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep({
					cwd = require("lazy.core.config").options.root
				})
			end,
			desc = "Live grep file content"
		},
		{
			"<leader>ob",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Search opened buffers"
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Search help manual page"
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require "telescope.actions"
		local trouble = require("trouble.providers.telescope")

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.55,
						results_width = 0.8
					},
					vertical = { mirror = false },
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120

				},
				sorting_strategy = "ascending",
				prompt_prefix = "> ",
				selection_caret = " ",
				winblend = 0,
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,

						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,

						["<C-c>"] = actions.close,
						--
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,

						["<CR>"] = actions.select_default,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						["<Tab>"] = actions.toggle_selection +
							actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection +
							actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist +
							actions.open_qflist,
						["<C-l>"] = actions.complete_tag,
						["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
						["<c-t>"] = trouble.open_with_trouble
					},

					n = {
						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<Tab>"] = actions.toggle_selection +
							actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection +
							actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist +
							actions.open_qflist,

						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						["?"] = actions.which_key,
						["<c-t>"] = trouble.open_with_trouble
					}
				}
			}
		})
		telescope.load_extension("fzf")
	end
}

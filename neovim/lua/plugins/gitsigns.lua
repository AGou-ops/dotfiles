local M = {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    keys = {
        {
            '<leader>ga',
            '<cmd>Gitsigns toggle_linehl<CR> <BAR> <cmd>Gitsigns toggle_deleted<CR> <BAR> <cmd>Gitsigns toggle_word_diff<CR>',
            desc = 'Toggle ALL Gitsigns',
        },
        { '<leader>gl', '<cmd>Gitsigns toggle_linehl<CR>', desc = 'Toggle Gitsigns linehl' },
        { '<leader>gd', '<cmd>Gitsigns diffthis<CR>', desc = 'Toggle Gitsigns deleted' },
        { '<leader>gw', '<cmd>Gitsigns toggle_word_diff<CR>', desc = 'Toggle Gitsigns worddiff' },
    },
}

function M.config()
    require('gitsigns').setup({
        signs = {
            add = { text = '┃' },
            change = { text = '┃' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
            untracked = { text = '┆' },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = { interval = 1000, follow_files = true },
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 0,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = '      <author>, <author_time:%R> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1,
        },
    })
end

return M

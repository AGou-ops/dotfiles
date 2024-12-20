local M = {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    enabled = false,
    keys = {
        { '<leader>dv', '<cmd>DiffviewOpen<cr>', desc = 'Open DiffView for git' },
        { '<leader>dc', '<cmd>DiffviewClose<cr>', desc = 'Close DiffView for git' },
    },
}

function M.config()
    -- default config: https://github.com/sindrets/diffview.nvim#configuration
    require('diffview').setup({})
end

return M

local M = {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
}

function M.config()
    -- default config: https://github.com/sindrets/diffview.nvim#configuration
    require('diffview').setup({})
end

return M

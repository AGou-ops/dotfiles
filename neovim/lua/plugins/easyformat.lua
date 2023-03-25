local M = {
    'glepnir/easyformat.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    cmd = 'EasyFormat',
    ft = { 'lua', 'go' },
    keys = { { '<leader>ef', '<cmd>EasyFormat<cr>', desc = 'Format current file.' } },
}

function M.config()
    local configs = require('easyformat.config')

    -- configs.go = {
    -- cmd = 'gofumpt',
    -- args = { vim.api.nvim_buf_get_name(0) },
    -- stdin = true,
    -- }

    configs.use_default({
        'go',
        'lua',
    })

    require('easyformat').setup({
        fmt_on_save = true,
    })
end

return M

local M = {
    'nvimdev/guard.nvim',
    cmd = 'GuardFmt',
    enabled = true,
    ft = { 'lua', 'go' },
    keys = { { '<leader>ef', '<cmd>GuardFmt<cr>', desc = 'Format current file.' } },
}

function M.config()
    local ft = require('guard.filetype')

    -- use stylua to format lua files and no linter
    ft('lua'):fmt('stylua')

    -- use lsp to format first then use golines to format
    ft('go'):fmt('goimports'):append('gofumpt')

    -- call setup LAST
    require('guard').setup({
        -- the only option for the setup function
        fmt_on_save = true,
        goimports = {
            cmd = 'goimports',
            args = { '-' },
            stdin = true,
        },
        gofumpt = {
            cmd = 'gofumpt',
            args = { '-' },
            stdin = true,
        },
    })
end

return M

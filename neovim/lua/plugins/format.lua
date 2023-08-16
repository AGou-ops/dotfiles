local M = {
    'nvimdev/guard.nvim',
    cmd = 'GuardFmt',
    ft = { 'lua', 'go' },
    keys = { { '<leader>ef', '<cmd>GuardFmt<cr>', desc = 'Format current file.' } },
}

function M.config()
    local ft = require('guard.filetype')

    -- use stylua to format lua files and no linter
    ft('lua'):fmt('stylua')

    -- use lsp to format first then use golines to format
    ft('go'):fmt('lsp'):append('golines')

    -- call setup LAST
    require('guard').setup({
        -- the only options for the setup function
        fmt_on_save = true,
        -- Use lsp if no formatter was defined for this filetype
        lsp_as_default_formatter = true,
    })
end

return M

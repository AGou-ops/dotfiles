local M = {
    'nvimdev/guard.nvim',
    cmd = 'GuardFmt',
    ft = { 'lua', 'go' },
    keys = { { '<leader>ef', '<cmd>GuardFmt<cr>', desc = 'Format current file.' } },
}

function M.config()
    local ft = require('guard.filetype')
    ft('lua'):fmt('stylua')
    ft('go'):fmt('lsp'):append('golines')
    --note setup must be last line
    require('guard').setup()
end

return M

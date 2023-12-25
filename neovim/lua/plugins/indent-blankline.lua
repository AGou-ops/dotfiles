local M = {
    'lukas-reineke/indent-blankline.nvim',
    lazy = false,
}

function M.config()
    -- set symbols for space and newline
    vim.opt.list = true
    vim.opt.listchars:append('eol:⤸')
    vim.opt.listchars:append('space:⋅')
    vim.opt.listchars:append('tab:│ ')

    require('ibl').setup({
        indent = { char = '│' },
        scope = { enabled = false },

        exclude = {
            filetypes = {
                'startify',
                'dashboard',
                'dotooagenda',
                'log',
                'fugitive',
                'gitcommit',
                'packer',
                'vimwiki',
                'markdown',
                'json',
                'txt',
                'vista',
                'help',
                'todoist',
                'NvimTree',
                'peekaboo',
                'git',
                'TelescopePrompt',
                'undotree',
                'flutterToolsOutline',
                '', -- for all buffers without a file type
            },
        },
    })
end

return M

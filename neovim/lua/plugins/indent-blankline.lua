local M = {
    'lukas-reineke/indent-blankline.nvim',
    lazy = false,
}

function M.config()
    -- set symbols for space and newline
    vim.opt.list = true
    vim.opt.listchars:append('eol:⤸')
    vim.opt.listchars:append('space:⋅')
    vim.opt.listchars:append('tab:  ')

    local highlight = {
        'CursorColumn',
        'Whitespace',
    }

    require('ibl').setup({
        indent = { char = '│' },

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
                'yaml',
                'yml',
                '', -- for all buffers without a file type
            },
        },
        -- buftype_exclude = { 'terminal', 'nofile' },
        -- context_patterns = {
        --     'class',
        --     'function',
        --     'method',
        --     'block',
        --     'list_literal',
        --     'selector',
        --     '^if',
        --     '^table',
        --     'if_statement',
        --     'while',
        --     'for',
        -- },
    })
end

return M

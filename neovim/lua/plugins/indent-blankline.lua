local M = {
    'lukas-reineke/indent-blankline.nvim',
    lazy = false,
}

function M.config()
    local ok, indent = pcall(require, 'indent_blankline')

    if not ok then
        return
    end

    -- set symbols for space and newline
    vim.opt.list = true
    vim.opt.listchars:append('eol:⤸')
    vim.opt.listchars:append('space:⋅')
    vim.opt.listchars:append('tab:  ')

    indent.setup({
        char = '│',
        space_char_blankline = ' ',
        show_first_indent_level = true,
        show_end_of_lien = true,
        show_trailing_blankline_indent = false,
        show_current_context = true,
        show_current_context_start = false,
        filetype_exclude = {
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
        buftype_exclude = { 'terminal', 'nofile' },
        context_patterns = {
            'class',
            'function',
            'method',
            'block',
            'list_literal',
            'selector',
            '^if',
            '^table',
            'if_statement',
            'while',
            'for',
        },
    })
end

return M

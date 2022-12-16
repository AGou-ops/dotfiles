FOO = 'cursorword_grp'
vim.api.nvim_create_augroup(FOO, { clear = true })
require('murmur').setup {
    -- cursor_rgb = 'purple', -- default to '#393939'
    max_len = 80, -- maximum word-length to highlight
    disable_on_lines = 2000, -- to prevent lagging on large files. Default to 2000 lines.
    exclude_filetypes = { "NvimTree", "sagacodeaction", "undotree", "mason", "dashboard" },
    callbacks = {
        -- to trigger the close_events of vim.diagnostic.open_float.
        function ()
            -- Close floating diag. and make it triggerable again.
            -- vim.cmd('doautocmd InsertEnter')
            vim.w.diag_shown = false
        end,
    }
}
vim.api.nvim_create_autocmd('CursorHold', {
    group = FOO,
    pattern = '*',
    callback = function ()
        -- skip when a float-win already exists.
        if vim.w.diag_shown then return end

        -- open float-win when hovering on a cursor-word.
        -- if vim.w.cursor_word ~= '' then
        --     vim.diagnostic.open_float(nil, {
        --         focusable = true,
        --         close_events = { 'InsertEnter' },
        --         border = 'rounded',
        --         source = 'always',
        --         prefix = ' ',
        --         scope = 'cursor',
        --     })
        --     vim.w.diag_shown = true
        -- end
    end
})

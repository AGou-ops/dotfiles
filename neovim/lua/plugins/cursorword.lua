local M = {
    'nyngwang/murmur.lua',
    -- event = "VeryLazy",
    lazy = false,
    enabled = false,
}

function M.config()
    local FOO = 'cursorword'
    vim.api.nvim_create_augroup(FOO, { clear = true })

    require('murmur').setup({
        -- cursor_rgb = {
        -- 	guibg = '#393939',
        -- },
        -- cursor_rgb_always_use_config = false, -- if set to `true`, then always use `cursor_rgb`.
        max_len = 80,
        min_len = 3, -- this is recommended since I prefer no cursorword highlighting on `if`.
        exclude_filetypes = {},
        callbacks = {
            -- to trigger the close_events of vim.diagnostic.open_float.
            function()
                -- Close floating diag. and make it triggerable again.
                vim.cmd('doautocmd InsertEnter')
                vim.w.diag_shown = false
            end,
        },
    })

    -- To create IDE-like no blinking diagnostic message with `cursor` scope. (should be paired with the callback above)
    vim.api.nvim_create_autocmd({ 'CursorHold' }, {
        group = FOO,
        pattern = '*',
        callback = function()
            -- skip when a float-win already exists.
            if vim.w.diag_shown then
                return
            end

            -- open float-win when hovering on a cursor-word.
            if vim.w.cursor_word ~= '' then
                vim.diagnostic.open_float()
                vim.w.diag_shown = true
            end
        end,
    })

    -- To create special cursorword coloring for the colortheme `typewriter-night`.
    -- remember to change it to the name of yours.
    vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
        group = FOO,
        pattern = '*',
        callback = function()
            vim.cmd([[
				  hi murmur_cursor_rgb guifg=#0a100d guibg=#ffee32
			]])
        end,
    })
end

return M

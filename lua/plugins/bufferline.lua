local M = {
    'akinsho/bufferline.nvim',
    -- version = 'v3.*',
    -- event = "VeryLazy",
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        -- 'famiu/bufdelete.nvim',
    },
}

function M.config()
    if vim.g.started_by_firenvim then
        return
    end

    local status_ok, bufferline = pcall(require, 'bufferline')
    if not status_ok then
        return
    end

    bufferline.setup({
        options = {
            mode = 'buffers', -- set to "tabs" to only show tabpages instead
            numbers = 'ordinal', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
            -- close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
            -- close_command = function(bufnum)
            --     require('bufdelete').bufdelete(bufnum, true)
            -- end,
            -- right_mouse_command = nil, -- can be a string | function, see "Mouse actions"
            -- left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
            -- left_mouse_command = nil,
            --
            -- hover not working
            hover = {
                enabled = false,
                delay = 200,
                reveal = { 'close' },
            },
            middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
            -- NOTE: this plugin is designed with this icon in mind,
            -- and so changing this is NOT recommended, this is intended
            -- as an escape hatch for people who cannot bear it for whatever reason
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'icon', -- 'icon' | 'underline' | 'none',
            },
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            --- name_formatter can be used to change the buffer's label in the bufferline.
            --- Please note some names can/will break the
            --- bufferline so use this at your discretion knowing that it has
            --- some limitations that will *NOT* be fixed.
            name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
                -- remove extension from markdown files for example
                if buf.name:match('%.md') then
                    return vim.fn.fnamemodify(buf.name, ':t:r')
                end
            end,
            max_name_length = 18,
            max_prefix_length = 18, -- prefix used when a buffer is de-duplicated
            tab_size = 17,
            truncate_names = true, -- whether or not tab names should be truncated
            diagnostics = 'nvim_lsp', -- | false | "nvim_lsp" | "coc",
            diagnostics_update_in_insert = false,
            diagnostics_indicator = function(count, level)
                local icon = level:match('error') and ' ' or ' '
                return ' ' .. icon .. count
            end,
            offsets = { { filetype = 'NvimTree', text = 'File Explorer', padding = 1 } },
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style = 'slant', -- | "thick" | "thin" | { 'any', 'any' },
            enforce_regular_tabs = true,
            always_show_bufferline = true,
            -- add custom logic
            custom_areas = {
                right = function()
                    local result = {}
                    local seve = vim.diagnostic.severity
                    local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
                    local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
                    local info = #vim.diagnostic.get(0, { severity = seve.INFO })
                    local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

                    if error ~= 0 then
                        table.insert(result, { text = '  ' .. error, fg = '#EC5241' })
                    end

                    if warning ~= 0 then
                        table.insert(result, { text = '  ' .. warning, fg = '#EFB839' })
                    end

                    if hint ~= 0 then
                        table.insert(result, { text = '  ' .. hint, fg = '#A3BA5E' })
                    end

                    if info ~= 0 then
                        table.insert(result, { text = '  ' .. info, fg = '#7EA9A7' })
                    end
                    return result
                end,
            },
        },
    })
end

return M

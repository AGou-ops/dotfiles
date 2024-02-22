require('bufferline').setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        -- close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        close_command = function(bufnum)
            require('bufdelete').bufdelete(bufnum, true)
        end,
        right_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        -- left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        left_mouse_command = nil,
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        -- NOTE: this plugin is designed with this icon in mind,
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon' -- 'icon' | 'underline' | 'none',
        },
        buffer_close_icon = '',
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
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        truncate_names = true, -- whether or not tab names should be truncated
        diagnostics = "nvim_lsp", -- | false | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        -- custom_filter = function(buf_number, buf_numbers)
        --   -- filter out filetypes you don't want to see
        --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        --     return true
        --   end
        --   -- filter out by buffer name
        --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        --     return true
        --   end
        --   -- filter out based on arbitrary rules
        --   -- e.g. filter out vim wiki buffer from tabline in your work repo
        --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        --     return true
        --   end
        --   -- filter out by it's index number in list (don't show first buffer)
        --   if buf_numbers[1] ~= buf_number then
        --     return true
        --   end
        -- end,
        offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        -- add custom logic
    }
}

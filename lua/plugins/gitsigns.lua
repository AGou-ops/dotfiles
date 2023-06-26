local M = {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
}

function M.config()
    require('gitsigns').setup({
        signs = {
            add = {
                hl = 'GitSignsAdd',
                text = '│',
                numhl = 'GitSignsAddNr',
                linehl = 'GitSignsAddLn',
            },
            change = {
                hl = 'GitSignsChange',
                text = '│',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn',
            },
            delete = {
                hl = 'GitSignsDelete',
                text = '_',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn',
            },
            topdelete = {
                hl = 'GitSignsDelete',
                text = '‾',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn',
            },
            changedelete = {
                hl = 'GitSignsChange',
                text = '~',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn',
            },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = { interval = 1000, follow_files = true },
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 0,
            ignore_whitespace = false,
        },
        current_line_blame_formatter_opts = { relative_time = true },
        current_line_blame_formatter = '      <author>, <author_time:%R> - <summary>',
        -- current_line_blame_formatter = function(name, blame_info,opts)
        --        if blame_info.author == name then blame_info.author = 'You' end
        --        local text
        --        if blame_info.author == 'Not Committed Yet' then
        --            text = blame_info.author
        --        else
        --            local date_time
        --            if opts.relative_time then
        --              date_time = require('gitsigns.util').get_relative_time(tonumber(blame_info['author_time']))
        --            else
        --              date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))
        --            end
        --            text = string.format('%s%s, %s - %s', blame_info.author,blame_info.author_mail,date_time,
        --                                -- os.date(
        --                                --      '%Y-%m-%d',
        --                                --      tonumber(blame_info['author_time'])),
        --                                 blame_info.summary)
        --        end
        --        return {{'       ' .. text, 'GitSignsCurrentLineBlame'}}
        --    end,
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1,
        },
        yadm = { enable = false },
    })
end

return M

local M = {
    'glepnir/lspsaga.nvim',
    ft = { 'go', 'python', 'lua', 'sh' },
    -- commit = '06a131f',
    keys = {
        { 'K', '<cmd>Lspsaga hover_doc<CR>', desc = 'Toggle Lspsaga hover_doc' },
        { 'gf', '<cmd>Lspsaga finder<CR>', desc = 'Toggle Lspsaga finder' },
        { '<leader>gf', '<cmd>Lspsaga finder imp<CR>', desc = 'Toggle Lspsaga finder imp' },
        { 'gx', '<cmd>Lspsaga code_action<CR>', desc = 'Toggle Lspsaga code_action' },
        { 'gr', '<cmd>Lspsaga rename<CR>', desc = 'Toggle Lspsaga rename' },
        -- { 'gd', '<cmd>Lspsaga goto_definition<CR>', desc = 'Toggle Lspsaga goto_definition' },
        { 'gP', '<cmd>Lspsaga peek_definition<CR>', desc = 'Toggle Lspsaga peek_definition' },
        {
            'gk',
            '<cmd>Lspsaga diagnostic_jump_prev<CR>',
            desc = 'Toggle Lspsaga diagnostic_jump_prev',
        },
        {
            'gj',
            '<cmd>Lspsaga diagnostic_jump_next<CR>',
            desc = 'Toggle Lspsaga diagnostic_jump_next',
        },
        {
            'gK',
            function()
                require('lspsaga.diagnostic').goto_prev({
                    severity = vim.diagnostic.severity.ERROR,
                })
            end,
            desc = 'Toggle Lspsaga diagnostic_prev ERROR',
        },
        {
            'gJ',
            function()
                require('lspsaga.diagnostic').goto_next({
                    severity = vim.diagnostic.severity.ERROR,
                })
            end,
            desc = 'Toggle Lspsaga diagnostic_next ERROR',
        },
        { '<leader>ol', '<cmd>Lspsaga outline<cr>', desc = 'Toggle Lspsaga outline' },
        {
            '<leader>sl',
            '<cmd>Lspsaga show_line_diagnostics<CR>',
            desc = 'Toggle Lspsaga show_line_diagnostics',
        },
        {
            '<leader>sc',
            '<cmd>Lspsaga show_cursor_diagnostics<CR>',
            desc = 'Toggle Lspsaga show_cursor_diagnostics',
        },
        {
            '<leader>sb',
            '<cmd>Lspsaga show_buf_diagnostics<CR>',
            desc = 'Toggle Lspsaga show_buf_diagnostics',
        },
        { '<leader>ca', '<cmd>Lspsaga code_action<CR>', desc = 'Toggle Lspsaga code_action' },
        { '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>', desc = 'Toggle Lspsaga outgoing_calls' },
        { '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>', desc = 'Toggle Lspsaga incoming_calls' },
    },
}

function M.config()
    require('lspsaga').setup({
        ui = {
            border = 'rounded',
            title = true,
            winblend = 0,
            expand = '',
            collapse = '',
            code_action = '󰛨',
            diagnostic = '',
            incoming = ' ',
            outgoing = ' ',
            hover = ' ',
            kind = {},
        },
        hover = {
            max_width = 0.5,
            max_height = 0.8,
            open_link = 'gx',
            open_cmd = '!chrome',
        },
        diagnostic = {
            show_code_action = true,
            show_source = true,
            jump_num_shortcut = true,
            max_width = 0.7,
            custom_fix = nil,
            custom_msg = nil,
            text_hl_follow = false,
            keys = { exec_action = 'o', quit = 'q', go_action = 'g' },
        },
        code_action = { num_shortcut = true, keys = { quit = 'q', exec = '<CR>' } },
        lightbulb = {
            enable = true,
            enable_in_insert = true,
            -- cache_code_action = true,
            sign = true,
            sign_priority = 40,
            virtual_text = false,
        },
        preview = { lines_above = 0, lines_below = 10 },
        scroll_preview = { scroll_down = '<C-f>', scroll_up = '<C-b>' },
        request_timeout = 2000,
        finder = {
            keys = {
                shuttle = '[w',
                toggle_or_open = { 'o', '<CR>' },
                vsplit = 'v',
                split = 's',
                tabe = 't',
                quit = { 'q', '<ESC>' },
            },
        },
        definition = {
            keys = {
                edit = 'o',
                vsplit = '<C-v>',
                split = '<C-s>',
                tabe = '<C-c>t',
                quit = 'q',
                close = '<Esc>',
            },
        },
        rename = {
            keys = {
                quit = '<C-c>',
                exec = '<CR>',
                mark = 'x',
                confirm = '<CR>',
                in_select = true,
            },
        },
        implement = {
            enable = true,
            sign = true,
            virtual_text = true,
        },
        symbol_in_winbar = {
            enable = false,
            separator = ' ',
            hide_keyword = true,
            show_file = true,
            folder_level = 2,
            respect_root = false,
            color_mode = true,
        },
        outline = {},
        callhierarchy = {
            show_detail = false,
            keys = {
                edit = 'e',
                vsplit = 's',
                split = 'i',
                tabe = 't',
                jump = 'o',
                quit = 'q',
                expand_collapse = 'u',
            },
        },
        beacon = { enable = true, frequency = 7 },
        server_filetype_map = {},
    })
end

return M

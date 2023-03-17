local M = {
    'JuanZoran/Trans.nvim',
    branch = 'experimental',
    lazy = false,
    keys = {
        -- 可以换成其他你想映射的键
        { 'mm', mode = { 'n', 'x' }, '<Cmd>Translate<CR>', desc = ' Translate' },
        { 'mk', mode = { 'n', 'x' }, '<Cmd>TransPlay<CR>', desc = ' 自动发音' },

        -- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
        { 'mi', '<Cmd>TranslateInput<CR>', desc = ' Translate From Input' },
    },
    dependencies = { 'kkharji/sqlite.lua', lazy = true },
}

function M.config()
    require('Trans').setup({
        view = {
            i = 'float',
            n = 'hover',
            v = 'hover',
        },
        hover = {
            width = 37,
            height = 27,
            border = 'rounded',
            -- title = title,
            keymap = {
                pageup = '[[',
                pagedown = ']]',
                pin = '<leader>[',
                close = '<leader>]',
                toggle_entry = '<leader>;',
                play = '_',
            },
            animation = {
                open = 'fold',
                close = 'fold',
                -- open = "slid",
                -- close = "slid",
                interval = 5,
            },
            auto_close_events = {
                'InsertEnter',
                'CursorMoved',
                'BufLeave',
            },
            auto_play = false,
            timeout = 3000,
            spinner = 'dots', -- 查看所有样式: /lua/Trans/util/spinner
            -- spinner = 'moon'
        },
        float = {
            width = 0.8,
            height = 0.8,
            border = 'rounded',
            title = 'Translate',
            keymap = {
                quit = 'q',
            },
            animation = {
                open = 'fold',
                close = 'fold',
                interval = 10,
            },
            tag = {
                wait = '#519aba',
                fail = '#e46876',
                success = '#10b981',
            },
            engine = {
                '本地',
            },
        },
        order = { -- only work on hover mode
            'title',
            'tag',
            'pos',
            'exchange',
            'translation',
            'definition',
        },
        icon = {
            star = '',
            notfound = ' ',
            yes = '✔',
            no = '',
            -- --- char: ■ | □ | ▇ | ▏ ▎ ▍ ▌ ▋ ▊ ▉ █
            -- --- ◖■■■■■■■◗▫◻ ▆ ▆ ▇⃞ ▉⃞
            cell = '■',
            -- star = '⭐',
            -- notfound = '❔',
            -- yes = '✔️',
            -- no = '❌'
        },
        theme = 'default',
        -- theme = 'dracula',
        -- theme = 'tokyonight',

        db_path = '$HOME/.vim/dict/ultimate.db',

        engine = {
            -- baidu = {
            --     appid = '',
            --     appPasswd = '',
            -- },
            -- -- youdao = {
            --     appkey = '',
            --     appPasswd = '',
            -- },
        },

        -- TODO :
        -- register word
        -- history = {
        --     -- TOOD
        -- }

        -- TODO :add online translate engine
    })
end

return M

local M = {
    'gelguy/wilder.nvim',
    build = ':UpdateRemotePlugins',
    event = 'VeryLazy',
}

function M.config()
    local wilder = require('wilder')
    wilder.setup({ modes = { ':', '/\v', '?' } })

    wilder.set_option('pipeline', {
        wilder.branch(
            wilder.cmdline_pipeline({
                fuzzy = 1,
                set_pcre2_pattern = 1,
            }),
            wilder.python_search_pipeline({
                pattern = 'fuzzy',
            })
        ),
    })

    local highlighters = {
        wilder.pcre2_highlighter(),
        wilder.basic_highlighter(),
    }

    local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
        border = 'rounded',
        pumblend = 0,
        empty_message = wilder.popupmenu_empty_message_with_spinner(),
        highlighter = highlighters,
        highlights = {
            accent = wilder.make_hl(
                'WilderAccent',
                'Pmenu',
                { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }
            ),
        },
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
    }))

    local wildmenu_renderer = wilder.wildmenu_renderer({
        highlighter = highlighters,
        -- separator = ' · ',
        -- left = { ' ', wilder.wildmenu_spinner(), ' ' },
        -- right = { ' ', wilder.wildmenu_index() },
    })

    wilder.set_option(
        'renderer',
        wilder.renderer_mux({
            [':'] = popupmenu_renderer,
            ['/'] = wildmenu_renderer,
        })
    )
end

return M

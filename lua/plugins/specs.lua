local M = {
    'edluffy/specs.nvim',
    event = 'VeryLazy',
    enabled = false,
}

function M.config()
    require('specs').setup({
        show_jumps = true,
        min_jump = 30,
        popup = {
            delay_ms = 0, -- delay before popup displays
            inc_ms = 5, -- time increments used for fade/resize effects
            blend = 0, -- starting blend, between 0-100 (fully transparent), see :h winblend
            width = 70,
            winhl = 'PMenu',
            -- Faders:
            -- linear_fader ▁▂▂▃▃▄▄▅▅▆▆▇▇██
            -- exp_fader ▁▁▁▁▂▂▂▃▃▃▄▄▅▆▇
            -- pulse_fader ▁▂▃▄▅▆▇█▇▆▅▄▃▂▁
            -- empty_fader ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
            fader = require('specs').exp_fader,
            -- Resizers:
            -- shrink_resizer ░░▒▒▓█████▓▒▒░░
            -- slide_resizer ████▓▓▓▒▒▒▒░░░░
            -- empty_resizer ███████████████
            resizer = require('specs').shrink_resizer,
        },
        ignore_filetypes = { 'NvimTree' },
        ignore_buftypes = {
            nofile = true,
            'NvimTree',
            'go',
        },
    })
end

return M

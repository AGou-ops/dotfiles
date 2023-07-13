local M = {
    'booperlv/nvim-gomove',
    event = 'VeryLazy',
}

function M.config()
    local map = vim.api.nvim_set_keymap

    map('v', '<S-h>', '<Plug>GoNSMLeft', {})
    map('v', '<S-j>', '<Plug>GoNSMDown', {})
    map('v', '<S-k>', '<Plug>GoNSMUp', {})
    map('v', '<S-l>', '<Plug>GoNSMRight', {})

    map('x', '<S-h>', '<Plug>GoVSMLeft', {})
    map('x', '<S-j>', '<Plug>GoVSMDown', {})
    map('x', '<S-k>', '<Plug>GoVSMUp', {})
    map('x', '<S-l>', '<Plug>GoVSMRight', {})

    map('x', '<C-h>', '<Plug>GoVSDLeft', {})
    map('x', '<C-j>', '<Plug>GoVSDDown', {})
    map('x', '<C-k>', '<Plug>GoVSDUp', {})
    map('x', '<C-l>', '<Plug>GoVSDRight', {})

    require('gomove').setup({
        -- whether or not to map default key bindings, (true/false)
        map_defaults = true,
        -- whether or not to reindent lines moved vertically (true/false)
        reindent = true,
        -- whether or not to undojoin same direction moves (true/false)
        undojoin = true,
        -- whether to not to move past end column when moving blocks horizontally, (true/false)
        move_past_end_col = false,
    })

    --[[ -- 测试数据
    aaa bbb ccc ddd
    eee fff ggg hhh
    iii jjj kkk lll
    aaa bbb ccc ddd
    aaa bbb ccc ddd
    aaa bbb ccc ddd
    ]]
end

return M

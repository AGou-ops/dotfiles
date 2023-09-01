local M = {
    'potamides/pantran.nvim',
    event = 'VeryLazy',
    enabled = false,
}

function M.config()
    local pantran = require('pantran')
    -- local actions = require('pantran.ui.actions')
    -- local engines = require('pantran.engines')
    -- local async = require('pantran.async')
    local opts = { noremap = true, silent = true, expr = true }
    vim.keymap.set('n', '<leader>tr', pantran.motion_translate, opts)
    vim.keymap.set('n', '<leader>trr', function()
        return pantran.motion_translate() .. '_'
    end, opts)
    vim.keymap.set('x', '<leader>tr', pantran.motion_translate, opts)

    require('pantran').setup({
        -- Default engine to use for translation. To list valid engine names run
        -- `:lua =vim.tbl_keys(require("pantran.engines"))`.
        default_engine = 'google',
        engines = {
            yandex = {
                default_source = 'auto',
                default_target = 'zh',
            },
            google = {
                default_source = 'auto',
                default_target = 'zh-cn',
            },
        },
        controls = {
            mappings = {
                edit = {
                    n = {
                        -- Use this table to add additional mappings for the normal mode in
                        -- the translation window. Either strings or function references are
                        -- supported.
                        ['j'] = 'gj',
                        ['k'] = 'gk',
                    },
                    i = {
                        -- Similar table but for insert mode. Using 'false' disables
                        -- existing keybindings.
                        ['<C-y>'] = false,
                        ['<C-a>'] = require('pantran.ui.actions').yank_close_translation,
                    },
                },
                -- Keybindings here are used in the selection window.
                select = {
                    n = {
                        -- ...
                    },
                },
            },
        },
    })
end

return M

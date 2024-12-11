local M = {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    -- enabled = false,
}

function M.config()
    -- local home = os.getenv("HOME")
    local db = require('dashboard')
    db.setup({
        -- theme: hyper, doom
        theme = 'hyper',
        config = {
            week_header = { enable = true },
            packages = { enable = true }, -- show how many plugins neovim loaded
            -- limit how many projects list, action when you press key or enter it will run this action.
            project = {
                limit = 8,
                -- label = '',
                action = 'Telescope find_files cwd=',
            },
            -- footer = { "\n\n岂能尽如人意，但求无愧我心。"}, -- footer
            shortcut = {
                {
                    desc = '󰚰 Update',
                    group = '@property',
                    action = 'Lazy update',
                    key = 'u',
                },
                {
                    desc = ' Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                {
                    desc = ' Apps',
                    group = 'Special',
                    action = 'Telescope app',
                    key = 'a',
                },
                {
                    desc = ' dotfiles',
                    group = 'Number',
                    action = 'Telescope find_files cwd=~/.config/nvim',
                    key = 'd',
                },
            },
        },
    })
end

return M

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
    defaults = {
        lazy = true,
    },
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { 'gruvbox-material' },
    },
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.8, height = 0.8 },
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        -- none | single | double | rounded | solid | shadow | ["╔", "═" ,"╗", "║", "╝", "═", "╚", "║"]
        border = 'rounded',
        icons = {
            loaded = '●',
            not_loaded = '○',
            cmd = ' ',
            config = '',
            event = '',
            ft = ' ',
            init = ' ',
            keys = ' ',
            plugin = ' ',
            runtime = ' ',
            source = ' ',
            start = '',
            task = '✔ ',
            lazy = '󰒲 ',
            list = { '●', '➜', '★', '‒' },
        },
        -- leave nil, to automatically select a browser depending on your OS.
        -- If you want to use a specific browser, you can define it here
        browser = nil, ---@type string?
        throttle = 20, -- how frequently should the ui process render events
        custom_keys = {
            -- you can define custom key maps here.
            -- To disable one of the defaults, set it to false
        },
    },
    checker = {
        -- automatically check for plugin updates
        enabled = true,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = false, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})

vim.keymap.set('n', '<leader>lz', '<cmd>:Lazy<cr>')
vim.keymap.set('n', '<leader>lu', '<cmd>:Lazy update<cr>')

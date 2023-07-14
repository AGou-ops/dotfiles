local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- leader KEY
vim.g.mapleader = ','

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
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = true, -- get a notification when changes are found
    },
    checker = {
        -- automatically check for plugin updates
        enabled = false,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = true, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
    performance = {
        cache = {
            enabled = true,
            path = vim.fn.stdpath('cache') .. '/lazy/cache',
            -- Once one of the following events triggers, caching will be disabled.
            -- To cache all modules, set this to `{}`, but that is not recommended.
            -- The default is to disable on:
            --  * VimEnter: not useful to cache anything else beyond startup
            --  * BufReadPre: this will be triggered early when opening a file from the command line directly
            disable_events = { 'VimEnter', 'BufReadPre' },
            ttl = 3600 * 24 * 5, -- keep unused modules for up to 5 days
        },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
            ---@type string[]
            paths = {}, -- add any custom paths here that you want to indluce in the rtp
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                -- "rplugin"
                -- "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                -- "tarPlugin",
                -- "tohtml",
                -- "tutor",
                -- "zipPlugin",
            },
        },
    },
})

vim.keymap.set('n', '<leader>lz', '<cmd>:Lazy<cr>')
vim.keymap.set('n', '<leader>lu', '<cmd>:Lazy update<cr>')

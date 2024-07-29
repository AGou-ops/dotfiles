return {
    'tomasky/bookmarks.nvim',
    enabled = false,
    dependencies = 'telescope.nvim',
    event = 'VeryLazy',
    keys = {
        {
            '<leader>bk',
            function()
                vim.cmd('Telescope bookmarks list')
            end,
            desc = 'Toggle Telescope bookmarks list',
        },
        {
            'mm',
            function()
                require('bookmarks').bookmark_toggle()
            end,
            desc = 'Toggle bookmarks',
        },
        {
            'mi',
            function()
                require('bookmarks').bookmark_ann()
            end,
            desc = 'Toggle bookmarks annotation',
        },
        {
            'mc',
            function()
                require('bookmarks').bookmark_clean()
            end,
            desc = 'Toggle bookmarks clean',
        },
        {
            'mn',
            function()
                require('bookmarks').bookmark_next()
            end,
            desc = 'Toggle bookmarks next',
        },
        {
            'mp',
            function()
                require('bookmarks').bookmark_prev()
            end,
            desc = 'Toggle bookmarks prev',
        },
    },
    config = function()
        require('bookmarks').setup({
            -- sign_priority = 8,  --set bookmark sign priority to cover other sign
            save_file = vim.fn.expand('$HOME/.bookmarks'), -- bookmarks save file path
            keywords = {
                ['@t'] = '☑️ ', -- mark annotation startswith @t ,signs this icon as `Todo`
                ['@w'] = '⚠️ ', -- mark annotation startswith @w ,signs this icon as `Warn`
                ['@f'] = '⛏ ', -- mark annotation startswith @f ,signs this icon as `Fix`
                ['@n'] = ' ', -- mark annotation startswith @n ,signs this icon as `Note`
            },
        })
    end,
}

require('impatient')
require('AGou.lsp')
require('AGou.nvim-lualine')
require('AGou.nvim-bufferline')
-- 好像没什么卵用啊.
-- require'lspconfig'.bashls.setup{} -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
require('AGou.nvim-tree')
-- ----------------------------------------------------------------------
-- full hotkeys usage: https://github.com/numToStr/Comment.nvim#-usage
-- gcc: 当前行行注释
-- gcb: 当前行块注释
-- [count]gcc/gcb: 多行块或行注释
-- `gco` - Insert comment to the next line and enters INSERT mode
-- `gcO` - Insert comment to the previous line and enters INSERT mode
-- `gcA` - Insert comment to end of the current line and enters INSERT mode
require('Comment').setup{
        mappings = {
        extended = true,
    },
}
-- --------------------------------------
require 'colorizer'.setup {
  '*'; -- Highlight all files, but customize some others.
  '!vim'; -- Exclude vim from highlighting.
  -- Exclusion Only makes sense if '*' is specified!
}
-- --------------------------------------
require("persistence").setup {
    dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"), -- directory where session files are saved
    options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
}
-- --------------------------------------
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
    max_lines = 1000;
    max_num_results = 20;
    sort = true;
    run_on_every_keystroke = true;
    snippet_placeholder = '..';
    ignored_file_types = { -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
    };
})
-- --------------------------------------
require('distant').setup {
    -- Applies Chip's personal settings to every machine you connect to
    --
    -- 1. Ensures that distant servers terminate with no connections
    -- 2. Provides navigation bindings for remote directories
    -- 3. Provides keybinding to jump into a remote file's parent directory
    ['*'] = require('distant.settings').chip_default()
}
-- --------------------------------------
-- require("cmp_dictionary").setup({
--     dic = {
--         ["*"] = "~/.vim/dict/american_english",
--         -- ["markdown"] = { "~/.vim/dict/american_english", "~/.vim/dict/american-english" },
--         -- ["javascript,typescript"] = { "path/to/jsdict" },
--     },
--     -- The following are default values, so you don't need to write them if you don't want to change them
--     exact = 1,
--     async = false,
--     capacity = 3,
--     debug = false,
-- })
-- ----------------------------------------------------------------------
-- lua, default settings
-- require("better_escape").setup {
--     mapping = {"jk", "jj"}, -- a table with mappings to use
--     timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
--     clear_empty_lines = false, -- clear line after escaping if there is only whitespace
--     keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
--     -- example
--     -- keys = function()
--     --   return vim.fn.col '.' - 2 >= 1 and '<esc>l' or '<esc>'
--     -- end,
-- }
-- ----------------------------------------------------------------------
require('AGou.nvim-transparent')
require('AGou.nvim-cmp')
require('AGou.nvim-lsp-installer')
require('AGou.nvim-treesitter')
require('AGou.nvim-gitsigns')
require('AGou.nvim-autopairs')
require('AGou.nvim-lspsaga')
require("AGou.nvim-signature")
require('AGou.nvim-telescope')
require('AGou.nvim-toggleterm')
require('AGou.nvim-neoscroll')
-- require('AGou.nvim-session-manager')
require('AGou.nvim-whichkey')
require('AGou.nvim-todo-comments')
require('AGou.nvim-diffview')
require('AGou.nvim-dashboard')
require('AGou.nvim-zen-mode')
require('AGou.nvim-indent_blankline')

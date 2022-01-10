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
-- idnent-line  更多配置参考: https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/doc/indent_blankline.txt
vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
-- --------------------------------------
--{
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

require("cmp_dictionary").setup({
    dic = {
        ["*"] = "/Users/agou-ops/.vim/dict/american_english",
        -- ["markdown"] = { "~/.vim/dict/american_english", "~/.vim/dict/american-english" },
        -- ["javascript,typescript"] = { "path/to/jsdict" },
    },
    -- The following are default values, so you don't need to write them if you don't want to change them
    exact = 2,
    async = false,
    capacity = 5,
    debug = true,
})
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

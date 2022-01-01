require('AGou.lsp')
require('AGou.lualine')
require("bufferline").setup{}
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
-- ----------------------------------------------------------------------
require('AGou.nvim-transparent')
require('AGou.nvim-cmp')
require('AGou.nvim-lsp-installer')
require('AGou.nvim-treesitter')
require('AGou.gitsigns')
require('AGou.distant')

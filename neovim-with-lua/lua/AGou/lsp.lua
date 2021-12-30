local nvim_lsp = require('lspconfig')

-- 想切换到内置的lsp,奈何coc有的自动补全插件太好用了,没找到类似可以替代的;
nvim_lsp.gopls.setup{}
--
-- nvim_lsp.pyright.setup{}
nvim_lsp.bashls.setup{}
nvim_lsp.pylsp.setup{

}


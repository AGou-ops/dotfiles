-- vim.lsp.protocol.CompletionItemKind = {
--     '', -- Text          = 1;
--     '', -- Method        = 2;
--     'ƒ', -- Function      = 3;
--     '', -- Constructor   = 4;
--     '⌘', -- Field         = 5;
--     '', -- Variable      = 6;
--     '', -- Class         = 7;
--     'ﰮ', -- Interface     = 8;
--     '', -- Module        = 9;
--     '', -- Property      = 10;
--     '', -- Unit          = 11;
--     '', -- Value         = 12;
--     '了', -- Enum          = 13;
--     '', -- Keyword       = 14;
--     '﬌', -- Snippet       = 15;
--     '', -- Color         = 16;
--     '', -- File          = 17;
--     '', -- Reference     = 18;
--     '', -- Folder        = 19;
--     '', -- EnumMember    = 20;
--     '', -- Constant      = 21;
--     '', -- Struct        = 22;
--     '', -- Event         = 23;
--     '', -- Operator      = 24;
--     '', -- TypeParameter = 25;
-- }
-- 如果不想用lspkind,那么可以用手动进行图标设置
-- for index, value in ipairs(vim.lsp.protocol.CompletionItemKind) do
--     -- cmp.lsp.CompletionItemKind[index] = value
--     cmp.lsp.CompletionItemKind[index] = value .. ' ' ..  cmp.lsp.CompletionItemKind[index]
-- end
-- -----------------------------------------------------
-- Setup nvim-cmp.
vim.o.completeopt = 'menuone,noselect'

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require'cmp'
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line-1, line, true)[1]:sub(col, col):match('%s') == nil
end

-- Add lspkind
local lspkind = require('lspkind')

local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
}


cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == 'cmp_tabnine' then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end
                vim_item.kind = ''
            end
            vim_item.menu = menu
            return vim_item
        end
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ 
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
      }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = function(fallback)  -- see GH-231, GH-286
      if cmp.visible() then cmp.select_next_item()
      elseif has_words_before() then cmp.complete()
      else fallback() end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then cmp.select_prev_item()
      else fallback() end
    end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'path' },
      { name = 'cmp_tabnine' },
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' , keyword_pattern = [[\k]] },
    })
})

-- 这个地方视频上讲的有些错误,下面这些东西只需在lsp.lua中设置即可,无需重复设置.
-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local servers = {
-- "bashls",
-- -- "pyright",
-- "pylsp",
-- -- "gopls",
-- }
--
-- for _, name in pairs(servers) do
--   require('lspconfig')[name].setup {
--   capabilities = capabilities
-- }
-- end

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
-- -- 如果不想用lspkind,那么可以用手动进行图标设置
-- for index, value in ipairs(vim.lsp.protocol.CompletionItemKind) do
--     -- cmp.lsp.CompletionItemKind[index] = value
--     cmp.lsp.CompletionItemKind[index] = value .. ' ' ..  cmp.lsp.CompletionItemKind[index]
-- end
-- -----------------------------------------------------
-- Setup nvim-cmp.
vim.o.completeopt = "menuone,noselect"
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require'cmp'
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
-- Add lspkind
local lspkind = require("lspkind")
local compare = require('cmp.config.compare')

local source_mapping = {
  -- buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  cmp_tabnine = "[TN]",
  path = "[Path]",
  emoji = "[Emoji]",
  -- look = "[Dict]",
  calc = "[Calc]",
  -- vsnip = "[vsnip]",
  luasnip = "[luasnip]",
}

cmp.setup({
  enabled = function()
    if
      require("cmp.config.context").in_treesitter_capture("comment") == true
      or require("cmp.config.context").in_syntax_group("Comment")
    then
      return false
    else
      return true
    end
  end,
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  --   formatting = {
  -- format = require'lspkind'.cmp_format({
  --   mode = 'symbol_text',
  --   maxwidth = 50,
  -- })
  -- },
  formatting = {
      fields = {
          cmp.ItemField.Abbr,
          cmp.ItemField.Kind,
          cmp.ItemField.Menu,
      },
      format = lspkind.cmp_format({
          mode = "symbol_text", -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function(entry, vim_item)
              vim_item.kind = lspkind.presets.default[vim_item.kind]
              local menu = source_mapping[entry.source.name]
              if entry.source.name == "cmp_tabnine" then
                  if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                      menu = entry.completion_item.data.detail .. " " .. menu
                  end
                  vim_item.kind = ""
              end
              vim_item.menu = menu
              return vim_item
          end,
      }),
  },
  mapping = {
    -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-b>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-f>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
   ['<CR>'] = cmp.mapping.confirm {
        select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    },
  sources = {
    { name = "nvim_lsp", priority = 100 }, -- Keep LSP results on top.
    { name = "nvim_lua" },
    -- { name = 'vsnip' },
    { name = "luasnip" },
    -- {
    --     name = 'buffer',
    --     -- Correct:
    --     option = {
    --         keyword_pattern = [[\k\+]],
    --     }
    -- },
    { name = "cmp_tabnine", priority = 15 },
    { name = "path" },
    { name = "emoji", insert = true },
    {
      name = "look",
      priority = 101,
      keyword_length = 5,
      max_item_count = 5,
      option = {
        convert_case = true,
        loud = true,
        --dict = '/usr/share/dict/words'
      },
    },
    { name = "calc" },
    { name = "nvim_lsp_signature_help" },
  },
  sorting = {
      priority_weight = 2,
      comparators = {
          require('cmp_tabnine.compare'),
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
      }
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  preselect = cmp.PreselectMode.Item,
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- ghost_text 用了之后preview box 就无法正常使用了.
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
})

cmp.setup.filetype({ 'TelescopePrompt', 'neo-tree'},{
    sources = {}
})

cmp.setup.filetype({ 'yaml' }, {
    sources = {
        { name = "nvim_lsp", priority = 100 }, -- Keep LSP results on top.
        { name = "path" },
        {
            name = "look",
            priority = 101,
            keyword_length = 5,
            option = {
                convert_case = true,
                loud = true,
                --dict = '/usr/share/dict/words'
            },
        },

    }
})

require'cmp'.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})

require'cmp'.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

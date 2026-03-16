return {
  {
    "saghen/blink.cmp",
    enabled = false,
    optional = true,
  },

  -- Setup nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "octaltree/cmp-look",
    },
    -- Not all LSP servers add brackets when completing a function.
    -- To better deal with this, LazyVim adds a custom option to cmp,
    -- that you can configure. For example:
    --
    -- ```lua
    -- opts = {
    --   auto_brackets = { "python" }
    -- }
    -- ```
    opts = function()
      -- Register nvim-cmp lsp capabilities
      vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })

      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        if col == 0 then
          return false
        end
        local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1] or ""
        return text:sub(col, col):match("%s") == nil
      end
      local ok_luasnip, luasnip = pcall(require, "luasnip")
      local defaults = require("cmp.config.default")()
      local auto_select = true
      return {
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
          ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
          ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif ok_luasnip and luasnip.expand_or_jumpable() then
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
            elseif ok_luasnip and luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "lazydev" },
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
           { name = 'nvim_lsp_signature_help', priority = 50 },
            {
                name = 'look',
                keyword_length = 5,
                max_item_count = 5,
                option = {
                    convert_case = true,
                    loud = true,
                    --dict = '/usr/share/dict/words'
                },
            },
        }),
        window = {
            completion = cmp.config.window.bordered({ border = 'rounded' }),
            documentation = cmp.config.window.bordered({ border = 'rounded' }),
        },
formatting = {
            fields = { 'kind', 'abbr', 'menu' },
            format = function(entry, vim_item)
                local lspkind_icons = {
                    Text = '',
                    Method = '',
                    Function = '󰊕',
                    Constructor = '󰡱',
                    Field = '',
                    Variable = '',
                    Class = '',
                    Interface = '',
                    Module = '',
                    Property = '',
                    Unit = '',
                    Value = '',
                    Enum = '',
                    Keyword = '',
                    Snippet = '',
                    Color = '',
                    File = '',
                    Reference = '',
                    Folder = '',
                    EnumMember = '',
                    Constant = '',
                    Struct = '',
                    Event = '',
                    Operator = '',
                    TypeParameter = ' ',
                    Robot = '󱚤',
                    Roboti = '󱨚',
                    Smiley = ' ',
                    Note = ' ',
                }
                local meta_type = vim_item.kind
                -- load lspkind icons
                vim_item.kind = lspkind_icons[vim_item.kind]
                if entry.source.name == 'cmp_tabnine' then
                    vim_item.kind = lspkind_icons['Robot']
                    -- vim_item.kind_hl_group = "CmpItemKindTabnine"
                end

                -- if entry.source.name == 'emoji' then
                --     vim_item.kind = lspkind_icons['Smiley']
                --     vim_item.kind_hl_group = 'CmpItemKindEmoji'
                -- end

                if entry.source.name == 'look' then
                    vim_item.kind = lspkind_icons['Note']
                    -- vim_item.kind_hl_group = "CmpItemKindEmoji"
                end
                -- if entry.source.name == 'codeium' then
                --     vim_item.kind = lspkind_icons['Roboti']
                --     -- vim_item.kind_hl_group = "CmpItemKindEmoji"
                -- end
                vim_item.menu = ({
                    buffer = '[Buffer]',
                    nvim_lsp = meta_type,
                    path = '[Path]',
                    luasnip = '[LuaSnip]',
                    cmp_tabnine = '[TN]',
                    -- emoji = '[Emoji]',
                    look = '[Dict]',
                    -- codeium = '[Code]',
                })[entry.source.name]

                return vim_item
            end,
        },
        experimental = {
          -- only show ghost text when we show ai completions
          ghost_text = vim.g.ai_cmp and {
            hl_group = "CmpGhostText",
          } or false,
        },
        sorting = defaults.sorting,
      }
    end,
    config = function(_, opts)
      require("util.cmp").setup(opts)
      local cmp = require("cmp")

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },

  -- snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "garymjr/nvim-snippets",
        opts = {
          friendly_snippets = true,
        },
        dependencies = { "rafamadriz/friendly-snippets" },
      },
    },
    opts = function(_, opts)
      opts.snippet = {
        expand = function(item)
          return LazyVim.cmp.expand(item.body)
        end,
      }
      if LazyVim.has("nvim-snippets") then
        table.insert(opts.sources, { name = "snippets" })
      end
    end,
  },
}

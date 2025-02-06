---@diagnostic disable: missing-fields
local M = {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        -- 'hrsh7th/cmp-emoji',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'saadparwaiz1/cmp_luasnip',
        'octaltree/cmp-look',
        'tzachar/cmp-tabnine',
    },
}

function M.config()
    local cmp_status_ok, cmp = pcall(require, 'cmp')
    if not cmp_status_ok then
        return
    end

    local luasnip = require('luasnip')

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
                == nil
    end

    cmp.setup({
        enabled = function()
            if
                require('cmp.config.context').in_treesitter_capture('comment') == true
                or require('cmp.config.context').in_syntax_group('Comment')
            then
                return false
            else
                return true
            end
        end,

        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        experimental = {
            ghost_text = false,
            git = {
                async = true,
            },
        },
        preselect = cmp.PreselectMode.Item,
        completion = {
            completeopt = 'menu,menuone,noinsert', -- remove default noselect
        },
        performance = {
            debounce = 0, -- default is 60ms
            throttle = 0, -- default is 30ms
        },
        matching = {
            disallow_fuzzy_matching = true,
            disallow_fullfuzzy_matching = true,
            disallow_partial_fuzzy_matching = false,
            disallow_partial_matching = false,
            disallow_prefix_unmatching = true,
        },
        sorting = {
            priority_weight = 1.0,
            comparators = {
                -- compare.score_offset, -- not good at all
                cmp.config.compare.locality,
                cmp.config.compare.recently_used,
                cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
                cmp.config.compare.offset,
                cmp.config.compare.order,
                -- compare.scopes, -- what?
                -- compare.sort_text,
                -- compare.exact,
                -- compare.kind,
                -- compare.length, -- useless
            },
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
        mapping = cmp.mapping.preset.insert({
            -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ['<C-b>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            -- ["<C-f>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            -- ["<C-d>"] = cmp.mapping(function()
            --     cmp.close()
            -- end, { "i", "s" }),
            ['<C-d>'] = cmp.mapping(function(fallback)
                -- cmp.close()
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                    -- if luasnip.jumpable(1) then
                    --   luasnip.jump(1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<C-f>'] = cmp.mapping(function(fallback)
                -- cmp.close()
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<CR>'] = cmp.mapping.confirm({
                -- ConfirmBehavior: Insert & Replace
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
                -- cmp.close()
            }),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { 'i', 's' }),

            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        -- You can set mappings if you want
        -- mapping = insert_map,
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        sources = {
            -- {
            --     name = 'codeium',
            --     group_index = 1,
            --     priority = 100,
            -- },
            { name = 'codecompanion' },
            { name = 'nvim_lsp', priority = 50 },
            { name = 'cmp_tabnine', priority = 90 },
            { name = 'luasnip', priority = 100 },
            { name = 'path', priority = 99 },
            { name = 'buffer', priority = 50, max_item_count = 5 },
            -- { name = 'emoji', priority = 50 },
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
        },
    })

    cmp.setup.filetype({ 'TelescopePrompt' }, {
        sources = {},
    })
    cmp.setup.filetype({ 'vim', 'markdown' }, {
        sources = {
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
        },
    })
end

return M

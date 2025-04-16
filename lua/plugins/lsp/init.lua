local M = {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
    },
}

function M.config()
    require('neodev').setup({})
    local nvim_lsp = require('lspconfig')
    -- local configs = require 'lspconfig/configs'
    -- ------------------

    local on_attach = function(_, bufnr)
        -- require("lsp-format").on_attach(client)
        -- require("nvim-navic").attach(client, bufnr)

        -- enable inlay hint
        -- vim.lsp.buf.inlay_hint(0, true)

        -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        local opts = { noremap = true, silent = true }
        local map = vim.api.nvim_buf_set_keymap
        -- goto preview keymappings
        map(
            bufnr,
            'n',
            'gp',
            "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
            opts
        )
        map(
            bufnr,
            'n',
            'gpi',
            "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
            opts
        )
        map(
            bufnr,
            'n',
            'gpt',
            "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
            opts
        )
        map(bufnr, 'n', 'gq', "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
        map(
            bufnr,
            'n',
            'gF',
            "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
            opts
        )
    end
    -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
    }

    -- -------------------- general settings -- --------------------
    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.INFO] = ' 𝓲',
                [vim.diagnostic.severity.WARN] = ' ❢',
                [vim.diagnostic.severity.HINT] = ' ',
                [vim.diagnostic.severity.ERROR] = ' ✗',
            },
            linehl = {
                [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
                [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
                [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
                [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            },
            numhl = {
                [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
                [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
                [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
                [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            },
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        virtual_text = false,
        virtual_lines = true,
    })

    -- -------------------------- common lsp server ----------------------
    local servers = {
        'bashls',
        'sqlls',
        -- 'clangd',
        -- 'texlab',
        'dockerls',
        'marksman',
        -- 'bufls',
        'ansiblels',
        'denols',
        -- 'pyright',
    }

    for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = function()
                return vim.fn.getcwd()
            end,
        })
    end

    -- -------------------- python3 lsp settings -- --------------------
    nvim_lsp.pylsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            pylsp = {
                plugins = {
                    -- flake8 = {
                    --     enabled = true,
                    -- },
                    rope_autoimport = {
                        enabled = true,
                    },
                    -- rope_completion = {
                    --     enabled = true,
                    -- },
                },
            },
        },
    })
    -- -------------------- go lsp settings -- --------------------
    nvim_lsp.gopls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = nvim_lsp.util.root_pattern('go.mod'),
        settings = {
            gopls = {
                gofumpt = true,
                usePlaceholders = true,
                completeUnimported = true,
                experimentalPostfixCompletions = true,
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                },
                staticcheck = true,
            },
        },
    })
    -- -------------------- yaml lsp settings -- --------------------
    -- install yaml-language-server first!!! --  yarn global add yaml-language-server
    nvim_lsp.yamlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { 'yaml' },
        root_dir = function()
            return vim.fn.getcwd()
        end,
        settings = {
            yaml = {
                -- schemas = {
                --     ['file:///Users/agou-ops/.k8s/master-local/all.json'] = '/*.yaml',
                -- },
                -- 以下参考自：https://github.com/Allaman/nvim/blob/main/lua/core/plugins/lsp/settings/yaml.lua
                schemaStore = {
                    enable = true,
                    url = 'https://www.schemastore.org/api/json/catalog.json',
                },
                schemas = {
                    kubernetes = '*.yaml',
                    ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*',
                    ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
                    ['https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json'] = 'azure-pipelines.yml',
                    ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
                    ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
                    ['http://json.schemastore.org/kustomization'] = 'kustomization.{yml,yaml}',
                    ['http://json.schemastore.org/ansible-playbook'] = '*play*.{yml,yaml}',
                    ['http://json.schemastore.org/chart'] = 'Chart.{yml,yaml}',
                    ['https://json.schemastore.org/dependabot-v2'] = '.github/dependabot.{yml,yaml}',
                    ['https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json'] = '*gitlab-ci*.{yml,yaml}',
                    ['https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json'] = '*api*.{yml,yaml}',
                    ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = '*docker-compose*.{yml,yaml}',
                    ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '*flow*.{yml,yaml}',
                },
                format = { enabled = false },
                validate = false,
                completion = true,
                hover = true,
            },
        },
        single_file_support = true,
    })

    -- -------------------- lua lsp settings -- --------------------
    local settings = {
        Lua = {
            hint = { enable = true },
            runtime = { version = 'LuaJIT' },
            completion = {
                callSnippet = 'Replace',
            },
            diagnostics = {
                globals = {
                    'vim',
                    'use',
                    'describe',
                    'it',
                    'assert',
                    'before_each',
                    'after_each',
                },
            },
            disable = {
                'lowercase-global',
                'undefined-global',
                'unused-local',
                'unused-function',
                'unused-vararg',
                'trailing-space',
            },
        },
    }

    nvim_lsp.lua_ls.setup({
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = false
            client.server_capabilities.document_range_formatting = false
            on_attach(client, bufnr)
        end,
        settings = settings,
        flags = { debounce_text_changes = 150 },
        capabilities = capabilities,
    })
    -- -------------------- nginx lsp settings -- --------------------
    local configs = require('lspconfig.configs')

    local root_files = {
        'default.conf',
        'nginx.conf',
    }

    -- Check if the config is already defined (useful when reloading this file)
    if not configs.nginx_ls then
        configs.nginx_ls = {
            default_config = {
                cmd = { os.getenv('HOME') .. '/.local/share/nvim/mason/bin/nginx-language-server' },
                filetypes = { 'nginx' },
                root_dir = function(fname)
                    return nvim_lsp.util.root_pattern(unpack(root_files))(fname)
                end,
                settings = {},
            },
        }
    end
    nvim_lsp.nginx_ls.setup({})

    -- -------------------- sql lsp settings -- --------------------
    -- nvim_lsp.sqls.setup{
    --   settings = {
    --     sqls = {
    --       connections = {
    --         {
    --           driver = 'mysql',
    --           dataSourceName = 'root:root@tcp(127.0.0.1:13306)/world',
    --         },
    --         {
    --           driver = 'postgresql',
    --           dataSourceName = 'host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable',
    --         },
    --       },
    --     },
    --   },
    -- }
    -- -------------------- html lsp settings -- --------------------
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    nvim_lsp.html.setup({
        capabilities = capabilities,
    })
    -- -- --------------------------------------------------------------
end

return M

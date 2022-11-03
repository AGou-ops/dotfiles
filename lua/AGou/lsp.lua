local nvim_lsp = require("lspconfig")
-- local configs = require 'lspconfig/configs'
-- ------------------
local navic_ok, navic = pcall(require, 'nvim-navic')

local on_attach = function(client, bufnr)
    -- require("lsp-format").on_attach(client)

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_buf_set_keymap
    map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- map(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    map(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    map(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    map(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    map(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    map(bufnr, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    map(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    map(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    map(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    map(bufnr, "n", "<leader>so", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

    -- lspsaga keymappings
    map(bufnr, "n", "gr", "<cmd>Lspsaga rename<cr>", opts)
    map(bufnr, "n", "gx", "<cmd>Lspsaga code_action<cr>", opts)
    map(bufnr, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", opts)
    -- map(bufnr, "n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)

    map(bufnr, "n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    map(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
    map(bufnr, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
    -- use goto preview instead as below.
    -- map(bufnr, "n", "gp", "<cmd>Lspsaga preview_definition<cr>", opts)
    -- map(bufnr, "n", "gs", "<cmd>Lspsaga signature_help<cr>", opts)
    map(bufnr, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    map(bufnr, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    -- map(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", opts)
    -- map(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", opts)
    -- goto preview keymappings
    map(bufnr, "n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
    map(bufnr, "n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)
    map(bufnr, "n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
    map(bufnr, "n", "gF", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)

    -- Enable vim-navic
    if navic_ok and client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

end
-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- -------------------- general settings -- --------------------
vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = " ✗", numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = " ❢", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = " ", numhl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = " 𝓲", numhl = "DiagnosticSignInfo" })

vim.diagnostic.config({
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    virtual_text = true,
})


-- -------------------------- common lsp server ----------------------
local servers = { "bashls", "sqls", "dockerls" }
---------------------------------------------------------------
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

-- -------------------- go lsp settings -- --------------------
nvim_lsp.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod'),
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
    },
    settings = {
        gopls = {
            gofumpt = true
        }
    }
})
-- -------------------- yaml lsp settings -- --------------------
-- install yaml-language-server first!!! --  yarn global add yaml-language-server
nvim_lsp.yamlls.setup {
    settings = {
        yaml = {
            schemas = {
                ["file:///Users/agou-ops/.k8s/master-local/all.json"] = "/*.yaml",
            },
        },
    },
    single_file_support = true,
}

-- -------------------- lua lsp settings -- --------------------
local settings = {
    Lua = {
        runtime = {
            version = "LuaJIT",
        },
        diagnostics = {
            globals = {
                "vim",
                "use",
                "describe",
                "it",
                "assert",
                "before_each",
                "after_each",
            },
        },
        disable = {
            "lowercase-global",
            "undefined-global",
            "unused-local",
            "unused-function",
            "unused-vararg",
            "trailing-space",
        },
    },
}

nvim_lsp.sumneko_lua.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        on_attach(client, bufnr)
    end,
    settings = settings,
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = capabilities,
})

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
-- -- --------------------------------------------------------------

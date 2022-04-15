local nvim_lsp = require('lspconfig')

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_buf_set_keymap
    map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- map(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    map(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    map(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    map(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    map(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    map(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    map(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    map(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    map(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    map(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

    -- lspsaga keymappings
    map(bufnr, "n", "gr", "<cmd>Lspsaga rename<cr>", opts)
    map(bufnr, "n", "gx", "<cmd>Lspsaga code_action<cr>", opts)
    map(bufnr, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", opts)

    map(bufnr, "n", "gF", "<cmd>lua require'lspsaga.provider'.lsp_finder()<cr>", opts)
    map(bufnr, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", opts)
    map(bufnr, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
    -- use goto preview instead as below.
    -- map(bufnr, "n", "gp", "<cmd>Lspsaga preview_definition<cr>", opts)
    map(bufnr, "n", "gs", "<cmd>Lspsaga signature_help<cr>", opts)
    map(bufnr, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    map(bufnr, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    -- map(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", opts)
    -- map(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", opts)
    -- goto preview keymappigs
    map(bufnr, "n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
    map(bufnr, "n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",opts)
    map(bufnr, "n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
    map(bufnr, "n", "gf", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)
end
-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- -------------------------- lsp server ----------------------
local servers = { 'gopls', 'bashls', 'sqls'}
---------------------------------------------------------------
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end


-- -------------------- lua lsp settings -- --------------------
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')


nvim_lsp.sumneko_lua.setup {
    cmd = { vim.fn.getenv 'HOME' .. '/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
              },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}


-- --------------------------------------------------------------

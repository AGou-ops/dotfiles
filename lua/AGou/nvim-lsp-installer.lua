local lsp_installer = require "nvim-lsp-installer"

-- local function on_attach(client, bufnr)
--   -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
-- end

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local default_opts = {
    on_attach = on_attach,
  }

  -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
  -- local server_opts = {
  --   -- Provide settings that should only apply to the "eslintls" server
  --   ["eslintls"] = function()
  --     default_opts.settings = {
  --       format = {
  --         enable = true,
  --       },
  --     }
  --   end,
  -- }
  --
  -- -- Use the server's custom settings, if they exist, otherwise default to the default options
  -- local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  -- server:setup(server_options)
  server:setup(default_opts)
end)

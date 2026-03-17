-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local go_imports_group = vim.api.nvim_create_augroup("go_organize_imports", { clear = true })

local function go_organize_imports(bufnr)
  local params = vim.lsp.util.make_range_params(0, "utf-8")
  params.context = { only = { "source.organizeImports" }, diagnostics = {} }

  local results = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)
  if not results then
    return
  end

  for client_id, res in pairs(results) do
    for _, action in ipairs(res.result or {}) do
      if action.edit then
        local client = vim.lsp.get_client_by_id(client_id)
        vim.lsp.util.apply_workspace_edit(action.edit, (client and client.offset_encoding) or "utf-16")
      end
      if action.command then
        vim.lsp.buf.execute_command(action.command)
      end
    end
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  group = go_imports_group,
  pattern = "*.go",
  callback = function(event)
    go_organize_imports(event.buf)
  end,
})

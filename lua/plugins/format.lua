local M = {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    ft = { 'lua', 'go', 'yaml' },
    -- keys = { { '<leader>ef', '<cmd>GuardFmt<cr>', desc = 'Format current file.' } },
}

function M.config()
    require('conform').setup({
        -- format_on_save = {
        --     lsp_fallback = true,
        --     timeout_ms = 500,
        -- },
        format_after_save = {
            lsp_fallback = true,
        },
        log_level = vim.log.levels.ERROR,
        notify_on_error = true,

        formatters_by_ft = {
            lua = { 'stylua' },
            -- Conform will run multiple formatters sequentially
            go = { 'goimports', 'gofumpt' },
            -- Use a sub-list to run only the first available formatter
            javascript = { 'prettierd', 'prettier' },
            -- You can use a function here to determine the formatters dynamically
            python = function(bufnr)
                if require('conform').get_formatter_info('ruff_format', bufnr).available then
                    return { 'ruff_format' }
                else
                    return { 'isort', 'black' }
                end
            end,
            json = { 'jq' },
            -- Use the "*" filetype to run formatters on all filetypes.
            ['*'] = { 'codespell' },
            -- Use the "_" filetype to run formatters on filetypes that don't
            -- have other formatters configured.
            ['_'] = { 'trim_whitespace' },
        },
    })
end

return M

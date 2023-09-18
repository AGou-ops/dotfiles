local M = {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    ft = { 'lua', 'go' },
    -- keys = { { '<leader>ef', '<cmd>GuardFmt<cr>', desc = 'Format current file.' } },
}

function M.config()
    require('conform').setup({
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 500,
        },
        format_after_save = {
            lsp_fallback = true,
        },
        log_level = vim.log.levels.ERROR,
        notify_on_error = true,
        formatters_by_ft = {
            lua = { 'stylua' },
            -- Conform will use the first available formatter in the list
            javascript = { 'prettier_d', 'prettier' },
            -- Formatters can also be specified with additional options
            python = {
                formatters = { 'isort', 'black' },
                -- Run formatters one after another instead of stopping at the first success
                run_all_formatters = true,
            },
            go = {
                formatters = { 'gofumpt', 'goimports' },
                run_all_formatters = true,
            },
            json = {
                formatters = { 'jq' },
            },
            ['*'] = { 'trim_whitespace' },
        },
    })
end

return M

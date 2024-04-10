local M = {
    'kazhala/close-buffers.nvim',
    event = 'VeryLazy',
    keys = {
        { '<leader>do', '<cmd>:BWipeout other<CR>', desc = 'Delete other buffers.' },
    },
}

function M.config()
    require('close_buffers').setup({
        filetype_ignore = { 'NvimTree', 'tagbar' }, -- Filetype to ignore when running deletions
        file_glob_ignore = {}, -- File name glob pattern to ignore when running deletions (e.g. '*.md')
        file_regex_ignore = {}, -- File name regex pattern to ignore when running deletions (e.g. '.*[.]md')
        preserve_window_layout = { 'this' },
        next_buffer_cmd = function(windows)
            require('bufferline').cycle(1)
            local bufnr = vim.api.nvim_get_current_buf()

            for _, window in ipairs(windows) do
                vim.api.nvim_win_set_buf(window, bufnr)
            end
        end,
    })
end

return M

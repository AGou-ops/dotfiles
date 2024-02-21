local M = {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
}

function M.config()
    local status_ok, toggleterm = pcall(require, 'toggleterm')
    if not status_ok then
        return
    end

    toggleterm.setup({
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'float',
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = 'double', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
            winblend = 0,
            highlights = {
                border = 'Normal',
                background = 'Normal',
            },
        },
        winbar = {
            enabled = true,
            name_formatter = function(term) --  term: Terminal
                return term.name
            end,
        },
    })

    local Terminal = require('toggleterm.terminal').Terminal

    function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        -- vim.keymap.set('t', '<C-e>', [[<C-\><C-n><C-w>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    local lazygit = Terminal:new({
        cmd = 'LANG=zh_CN.UTF-8 lazygit',
        dir = 'git_dir',
        direction = 'float',
        float_opts = {
            border = 'double',
        },
        -- function to run on opening the terminal
        on_open = function(term)
            vim.cmd('startinsert!')
            vim.api.nvim_buf_set_keymap(
                term.bufnr,
                'n',
                'q',
                '<cmd>close<CR>',
                { noremap = true, silent = true }
            )
        end,
        -- function to run on closing the terminal
        on_close = function()
            vim.cmd('startinsert!')
        end,
    })

    function _Lazygit_toggle()
        lazygit:toggle()
    end
end

return M

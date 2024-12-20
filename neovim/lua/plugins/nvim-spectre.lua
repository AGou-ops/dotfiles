return {
    'nvim-pack/nvim-spectre',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'VeryLazy',
    enabled = false,
    keys = {
        {
            '<leader>S',
            '<cmd>lua require("spectre").toggle()<cr>',
            desc = 'Toggle Spectre',
        },
        {
            '<leader>sw',
            '<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
            desc = 'Search current word',
        },
        {
            '<leader>sp',
            '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
            desc = 'Search on current file',
        },
    },
    config = function()
        require('spectre').setup({
            live_update = false, -- auto execute search again when you write to any file in vim
        })
    end,
}

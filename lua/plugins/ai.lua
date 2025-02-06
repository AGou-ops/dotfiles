return {
    'olimorris/codecompanion.nvim',
    event = 'LspAttach',
    enabled = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
        require('codecompanion').setup({
            strategies = {
                chat = {
                    adapter = 'gemini',
                },
                inline = {
                    adapter = 'gemini',
                },
            },
            gemini = function()
                return require('codecompanion.adapters').extend('gemini', {
                    url = 'https://generativelanguage.googleapis.com/v1beta/models/${model}:streamGenerateContent?alt=sse&key=${api_key}',
                    env = {
                        api_key = 'cmd:op read op://personal/Gemini_API/credential --no-newline',
                        model = 'schema.model.default',
                    },
                })
            end,
        })
    end,
}

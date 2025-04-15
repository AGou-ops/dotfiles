return {
    'azorng/goose.nvim',
    branch = 'main',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                anti_conceal = { enabled = false },
            },
        },
    },
    config = function()
        require('goose').setup({
            keymap = {
                global = {
                    open_input = '<leader>ai', -- Opens and focuses on input window. Loads current buffer context
                    open_input_new_session = '<leader>aI', -- Opens and focuses on input window. Loads current buffer context. Creates a new session
                    open_output = '<leader>ao', -- Opens and focuses on output window. Loads current buffer context
                    close = '<leader>aq', -- Close UI windows
                    toggle_fullscreen = '<leader>af', -- Toggle between normal and fullscreen mode
                    select_session = '<leader>as', -- Select and load a goose session
                },
                window = {
                    submit = '<cr>', -- Submit prompt
                    close = '<esc>', -- Close UI windows
                    stop = '<C-c>', -- Stop a running job
                    next_message = ']]', -- Navigate to next message in the conversation
                    prev_message = '[[', -- Navigate to previous message in the conversation
                    mention_file = '@', -- Pick a file and add to context. See File Mentions section
                    toggle_pane = '<C-n>', -- Toggle between input and output panes
                },
            },
            ui = {
                window_width = 0.35, -- Width as percentage of editor width
                input_height = 0.15, -- Input height as percentage of window height
                fullscreen = false, -- Start in fullscreen mode (default: false)
            },
        })
    end,
}

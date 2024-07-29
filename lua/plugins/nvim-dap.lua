local M = {
    'rcarriga/nvim-dap-ui',
    ft = { 'go' },
    enabled = false,
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
    },
}

function M.config()
    -- nvim-dap settings.
    local dap = require('dap')

    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'red', linehl = '', numhl = '' })

    dap.adapters.go = {
        type = 'server',
        port = '${port}',
        executable = {
            command = 'dlv',
            args = { 'dap', '-l', '127.0.0.1:${port}' },
        },
    }
    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
        {
            type = 'go',
            name = 'Debug Single File',
            request = 'launch',
            program = '${file}',
        },
        {
            type = 'go',
            name = 'Debug Cureent Project',
            request = 'launch',
            program = './${relativeFileDirname}',
        },
        {
            type = 'go',
            name = 'Debug test', -- configuration for debugging test files
            request = 'launch',
            mode = 'test',
            program = '${file}',
        },
        -- works with go.mod packages and sub packages
        {
            type = 'go',
            name = 'Debug test (go.mod)',
            request = 'launch',
            mode = 'test',
            program = './${relativeFileDirname}',
        },
    }

    -- nvim-dap-ui settings.

    require('dapui').setup({
        icons = { expanded = '▾', collapsed = '▸', current_frame = '▸' },
        mappings = {
            -- Use a table to apply multiple mappings
            expand = { '<CR>', '<2-LeftMouse>' },
            open = 'o',
            remove = 'd',
            edit = 'e',
            repl = 'r',
            toggle = 't',
        },
        -- Layouts define sections of the screen to place windows.
        -- The position can be "left", "right", "top" or "bottom".
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
            {
                elements = {
                    -- Elements can be strings or table with id and size keys.
                    { id = 'scopes', size = 0.25 },
                    'breakpoints',
                    'stacks',
                    'watches',
                },
                size = 40, -- 40 columns
                position = 'left',
            },
            {
                elements = {
                    'repl',
                    'console',
                },
                size = 0.25, -- 25% of total lines
                position = 'bottom',
            },
        },
        controls = {
            enabled = true,
            -- Display controls in this element
            element = 'repl',
            icons = {
                pause = '󰏤',
                play = '',
                step_into = '',
                step_over = '',
                step_out = '',
                step_back = '',
                run_last = '↻',
                terminate = '󰓛',
            },
        },
        floating = {
            max_height = nil, -- These can be integers or a float between 0 and 1.
            max_width = nil, -- Floats will be treated as percentage of your screen.
            border = 'single', -- Border style. Can be "single", "double" or "rounded"
            mappings = {
                close = { 'q', '<Esc>' },
            },
        },
        windows = { indent = 1 },
        render = {
            max_type_length = nil, -- Can be integer or nil.
        },
    })
end

return M

-- tami5 lspsaga
-- local lspsaga = require 'lspsaga'
-- lspsaga.setup { -- defaults ...
--     debug = false,
--     use_saga_diagnostic_sign = true,
--     -- diagnostic sign
--     error_sign = "",
--     warn_sign = "",
--     hint_sign = "",
--     infor_sign = "",
--     diagnostic_header_icon = "   ",
--     -- code action title icon
--     code_action_icon = " ",
--     code_action_prompt = {
--         enable = true,
--         sign = false,
--         sign_priority = 40,
--         virtual_text = true,
--     },
--     finder_definition_icon = "  ",
--     finder_reference_icon = "  ",
--     max_preview_lines = 10,
--     finder_action_keys = {
--         open = "o",
--         vsplit = "v",
--         split = "s",
--         quit = "q",
--         scroll_down = "<C-d>",
--         scroll_up = "<C-u>",
--     },
--     code_action_keys = {
--         quit = "q",
--         exec = "<CR>",
--     },
--     rename_action_keys = {
--         quit = "<C-c>",
--         exec = "<CR>",
--     },
--     definition_preview_icon = "  ",
--     border_style = "round",
--     rename_prompt_prefix = "➤",
--     rename_output_qflist = {
--         enable = false,
--         auto_open_qflist = false,
--     },
--     server_filetype_map = {},
--     diagnostic_prefix_format = "%d. ",
--     diagnostic_message_format = "%m %c",
--     highlight_prefix = true,
-- }



-- new

local saga = require 'lspsaga'

-- change the lsp symbol kind
-- local kind = require('lspsaga.lspkind')

saga.init_lsp_saga({
    -- Options with default value
    -- "single" | "double" | "rounded" | "bold" | "plus"
    border_style = "rounded",
    -- when cursor in saga window you config these to move
    move_in_saga = { prev = '<C-p>',next = '<C-n>'},
    -- Error, Warn, Info, Hint
    -- use emoji like
    -- { "🙀", "😿", "😾", "😺" }
    -- or
    -- { "😡", "😥", "😤", "😐" }
    -- and diagnostic_header can be a function type
    -- must return a string and when diagnostic_header
    -- is function type it will have a param `entry`
    -- entry is a table type has these filed
    -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
    diagnostic_header = { " ", " ", " ", "ﴞ " },
    -- show diagnostic source
    show_diagnostic_source = true,
    -- add bracket or something with diagnostic source, just have 2 elements
    diagnostic_source_bracket = {},
    -- use emoji lightbulb in default
    code_action_icon = "💡",
    -- if true can press number to execute the codeaction in codeaction window
    code_action_num_shortcut = true,
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = false,
    },
    -- finder icons
    finder_icons = {
        def = '  ',
        ref = '諭 ',
        link = '  ',
    },
    -- preview lines of lsp_finder and definition preview
    max_preview_lines = 10,
    finder_action_keys = {
        open = "o",
        vsplit = "v",
        split = "s",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-d>",
        scroll_up = "<C-u>", -- quit can be a table
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_quit = "<C-c>",
    definition_preview_icon = "  ",
    -- show symbols in winbar must nightly
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = ' ',
        show_file = true,
        click_support = false,
    },
    -- show outline
    show_outline = {
        win_position = 'left',
        -- set the special filetype in there which in left like nvimtree neotree defx
        left_with = '',
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = '┃',
        jump_key = 'o',
    },
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {},
})

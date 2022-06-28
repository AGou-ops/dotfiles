local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
    debug = false,
    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    diagnostic_header_icon = "   ",
    -- code action title icon
    code_action_icon = " ",
    code_action_prompt = {
        enable = true,
        sign = false,
        sign_priority = 40,
        virtual_text = true,
    },
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    max_preview_lines = 10,
    finder_action_keys = {
        open = "o",
        vsplit = "v",
        split = "s",
        quit = "q",
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_keys = {
        quit = "<C-c>",
        exec = "<CR>",
    },
    definition_preview_icon = "  ",
    border_style = "round",
    rename_prompt_prefix = "➤",
    rename_output_qflist = {
        enable = false,
        auto_open_qflist = false,
    },
    server_filetype_map = {},
    diagnostic_prefix_format = "%d. ",
    diagnostic_message_format = "%m %c",
    highlight_prefix = true,
}



-- local saga = require 'lspsaga'
--
-- saga.init_lsp_saga{
--     -- Error,Warn,Info,Hint
--     diagnostic_header_icon = {' ',' ',' ','ﴞ '},
--     -- use emoji lightbulb in default
--     code_action_icon = '💡',
--     -- if true can press number to execute the codeaction in codeaction window
--     code_action_num_shortcut = true,
--     -- same as nvim-lightbulb but async
--     code_action_lightbulb = {
--         enable = true,
--         sign = true,
--         sign_priority = 20,
--         virtual_text = true,
--     },
--     finder_definition_icon = '  ',
--     finder_reference_icon = '  ',
--     max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
--     finder_action_keys = {
--         open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
--     },
--     code_action_keys = {
--         quit = 'q',exec = '<CR>'
--     },
--     -- rename_action_keys = {
--     --     quit = 'q',exec = '<CR>'  -- quit can be a table
--     -- },
--     definition_preview_icon = '  ',
--     border_style = "single", -- "single" "double" "round" "plus"
--     rename_prompt_prefix = '➤',
-- }

-- local status_ok, configs = pcall(require, "nvim-treesitter.configs")
-- if not status_ok then
--     return
-- end

-- configs.setup({
--     -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--     sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
--     ignore_install = { "" }, -- List of parsers to ignore installing
--     highlight = {
--         -- use_languagetree = true,
--         enable = true, -- false will disable the whole extension
--         -- disable = { "css", "html" }, -- list of language that will be disabled
--         disable = { "css" }, -- list of language that will be disabled
--         additional_vim_regex_highlighting = false,
--     },
--     autopairs = {
--         enable = true,
--     },
--     indent = { enable = false, disable= { "yaml", "python", "css" } },
--     context_commentstring = {
--         enable = true,
--         enable_autocmd = false,
--     },
--     autotag = {
--         enable = true,
--         disable = { "xml" },
--     },
--     rainbow = {
--         enable = true,
--         colors = {
--             "Gold",
--             "Orchid",
--             "DodgerBlue",
--             -- "Cornsilk",
--             -- "Salmon",
--             -- "LawnGreen",
--         },
--         disable = { "html" },
--     },
--     playground = {
--         enable = true,
--     },
-- })
--
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust","go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

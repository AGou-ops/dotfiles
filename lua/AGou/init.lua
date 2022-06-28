require('impatient')
require('Agou.autocmd')
require('AGou.themes')
require('AGou.lsp')
require('AGou.nvim-lualine')
require('AGou.nvim-bufferline')
require('AGou.nvim-tree')
require('AGou.nvim-transparent')
require('AGou.nvim-cmp')
require('AGou.nvim-lsp-installer')
require('AGou.nvim-treesitter')
require('AGou.nvim-gitsigns')
require('AGou.nvim-autopairs')
require('AGou.nvim-lspsaga')
require('AGou.nvim-telescope')
require('AGou.nvim-toggleterm')
require('AGou.nvim-cinnamon')
require('AGou.nvim-whichkey')
require('AGou.nvim-todo-comments')
require('AGou.nvim-diffview')
require('AGou.nvim-dashboard')
require('AGou.nvim-zen-mode')
require('AGou.nvim-indent-blankline')
require('AGou.nvim-trouble')
require('AGou.nvim-goto-preview')
require('AGou.nvim-smart-splits')
require('AGou.nvim-scrollbar')
require('AGou.nvim-jabs')
require('AGou.nvim-dap')
require('AGou.nvim-gomove')
-- --------------------------------------

-- -------------------------- 其他简单lua插件配置项 --------------------------------------------
--
require'hop'.setup{}
-- --------------------------------------
-- full hotkeys usage: https://github.com/numToStr/Comment.nvim#-usage
-- gcc: 当前行行注释
-- gcb: 当前行块注释
-- [count]gcc/gcb: 多行块或行注释
-- `gco` - Insert comment to the next line and enters INSERT mode
-- `gcO` - Insert comment to the previous line and enters INSERT mode
-- `gcA` - Insert comment to end of the current line and enters INSERT mode
require('Comment').setup{
        mappings = {
        extended = true,
    },
}
-- --------------------------------------
require('specs').setup{
    show_jumps  = true,
    min_jump = 30,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 5, -- time increments used for fade/resize effects
        blend = 0, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 70,
        winhl = "PMenu",
        -- Faders:
        -- linear_fader ▁▂▂▃▃▄▄▅▅▆▆▇▇██
        -- exp_fader ▁▁▁▁▂▂▂▃▃▃▄▄▅▆▇
        -- pulse_fader ▁▂▃▄▅▆▇█▇▆▅▄▃▂▁
        -- empty_fader ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
        fader = require('specs').exp_fader,
        -- Resizers:
        -- shrink_resizer ░░▒▒▓█████▓▒▒░░
        -- slide_resizer ████▓▓▓▒▒▒▒░░░░
        -- empty_resizer ███████████████
        resizer = require('specs').shrink_resizer,
    },
    ignore_filetypes = {"NvimTree"},
    ignore_buftypes = {
        nofile = true,
        "NvimTree"
    },
}
-- --------------------------------------
require 'colorizer'.setup {
  '*'; -- Highlight all files, but customize some others.
  '!vim'; -- Exclude vim from highlighting.
  -- Exclusion Only makes sense if '*' is specified!
}
-- --------------------------------------
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
    max_lines = 1000,
    max_num_results = 5,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
    ignored_file_types = { -- default is not to ignore
        -- TelescopePrompt = true,
        -- yaml = true
    },
    show_prediction_strength = false;
})
-- --------------------------------------
require("nvim-gps").setup({
  icons = {
    ["class-name"] = ' ',      -- Classes and class-like objects
    ["function-name"] = ' ',   -- Functions
    ["method-name"] = ' ',     -- Methods (functions inside class-like objects)
    ["container-name"] = '⛶ ',  -- Containers (example: lua tables)
    ["tag-name"] = '炙',         -- Tags (example: html tags)
    ["object-name"] = ' ',

  }
})
-- --------------------------------------
require('nvim-cursorline').setup {
  cursorline = {
    enable = false,
    timeout = 300,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}
-- --------------------------------------
require("autosave").setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
-- --------------------------------------
-- --------------------------------------
-- --------------------------------------
-- ----------------------------------------------------------------------

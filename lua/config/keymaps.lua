vim.o.timeoutlen = 300

local bind = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============= Basic Keymaps =============
--
-- vim.api.nvim_create_user_command('TransparentToggle', 'hi Normal ctermbg=NONE guibg=NONE | hi EndOfBuffer guibg=NONE ctermbg=NONE', {})
-- bind('n', '<F3>', '<CMD>TransparentToggle<CR>')

bind('n', ';', ':')
bind('n', 'U', '<C-r>', opts)
bind('v', ';', ':', opts)

bind('c', 'W', 'w', opts)
bind('c', 'WQ', 'wq', opts)
bind('c', 'Wq', 'wq', opts)
bind('c', 'QA', 'qa', opts)

-- do not copy delete and change command
bind('n', 'd', [["_d]], opts)
bind('v', 'd', [["_d]], opts)
bind('n', 'c', [["_c]], opts)
bind('v', 'c', [["_c]], opts)

bind('n', '<C-o>', '<C-o>zz', opts)
bind('n', '<C-i>', '<C-i>zz', opts)

bind('n', 'q', '<Nop>', opts)
bind('n', 'H', 'g^', opts)
bind('n', 'L', 'g_', opts)
bind('v', 'H', 'g^', opts)
bind('v', 'L', 'g_', opts)
bind('n', 'k', 'gk', opts)
bind('n', 'j', 'gj', opts)
bind('v', '<tab>', '<S->>gv', opts)
bind('v', '<S-tab>', '<S-<>gv', opts)
bind('n', '<C-left>', '<CMD>bp<CR>', opts)
bind('n', '<C-right>', '<CMD>bn<CR>', opts)

bind('n', '<C-t>', '<CMD>tabnew<CR>', opts)
bind('n', '<C-t>', '<Esc><CMD>tabnew<CR>', opts)

bind('n', '<ESC>', '<CMD>noh<CR>', opts)

bind('n', '<leader>0', '<CMD>tablast<CR>', opts)
bind('n', '<leader>dd', ':%bdelete<CR>', opts)

-- copy to system clipboard
bind('n', '<C-c>', '"+y', opts)
bind('n', '<C-h>', '<C-w>h', opts)
bind('n', '<C-j>', '<C-w>j', opts)
bind('n', '<C-k>', '<C-w>k', opts)
bind('n', '<C-l>', '<C-w>l', opts)
bind('n', '<C-q>', '<C-w>q', opts)
bind('n', '<C-\\>', '<C-w><bar>', opts)

-- Auto indent pasted text
-- bind('n', 'p', ']p', opts)
-- bind('n', 'P', '[p', opts)
bind('n', '(', '%', opts)
bind('n', ', opts)', '%', opts)

-- remap arrow keys to switch window
bind('n', '<Up>', '<C-w>k', opts)
bind('n', '<Down>', '<C-w>j', opts)
bind('n', '<Left>', '<C-w>h', opts)
bind('n', '<Right>', '<C-w>l', opts)

-- resize window
bind('n', '<S-Up>', '<cmd>resize +2<CR>', opts)
bind('n', '<S-Down>', '<cmd>resize -2<CR>', opts)
bind('n', '<S-Right>', '<cmd>vertical resize +5<CR>', opts)
bind('n', '<S-Left>', '<cmd>vertical resize -5<CR>', opts)

bind('n', '<space>', '/\\v', opts)
bind('t', '<Esc>', '<C-\\><C-n>', opts)

-- tab quick swich
bind('n', '<leader>th', '<CMD>tabfirst<CR>', opts)
bind('n', '<leader>tl', '<CMD>tablast<CR>', opts)
bind('n', '<leader>tj', '<CMD>tabnext<CR>', opts)
bind('n', '<leader>tk', '<CMD>tabprev<CR>', opts)
bind('n', '<leader>tn', '<CMD>tabnext<CR>', opts)
-- bind('n', '<leader>tp', '<CMD>tabprev<CR>', opts)
bind('n', '<leader>te', '<CMD>tabedit<CR>', opts)
-- bind('n', '<leader>td', '<CMD>tabclose<CR>', opts)
bind('n', '<leader>tm', '<CMD>tabm<CR>', opts)

-- open vscode from current directory
bind('n', '<leader>cd', "<CMD>let $VIM_DIR=expand('%:p:h')<CR>:silent !code $VIM_DIR<CR>")
-- select all text
bind('n', '<M-a>', 'ggVG', opts)

-- ============= Plugin Keymaps =============
-- lsp restart
bind('n', '<leader>lr', '<CMD>LspRestart<CR>', opts)
bind('n', '<leader>ls', '<CMD>LspStop<CR>', opts)
bind('n', '<leader>lS', '<CMD>LspStart<CR>', opts)
-- git open current repo
bind('n', '<leader>go', '<CMD>:!git open<CR><CR>', opts)
-- toggleTerm & Lazygit
bind('n', '<leader>tf', '<CMD>exe v:count1 . "ToggleTerm"<CR>', opts)
bind('n', '<leader>tb', '<CMD>ToggleTerm size=12 direction=horizontal<CR>', opts)
bind('n', '<leader>tt', '<CMD>ToggleTerm direction=tab<CR>', opts)
bind('n', '<leader>gg', '<CMD>lua _Lazygit_toggle()<CR>', opts)

-- vim-translator
-- bind('n', '<leader>ts', '<CMD>TranslateW<CR>', opts)
--

-- treesitter
bind('n', '<leader>hd', '<CMD>TSDisable highlight<CR>', opts)
bind('n', '<leader>he', '<CMD>TSEnable highlight<CR>', opts)

-- leaderF
bind('n', '<leader>lg', '<CMD>LeaderfRgInteractive<CR>', opts)
bind('n', '<leader>lf', '<CMD>LeaderfFile<CR>', opts)
bind('n', '<leader>lF', '<CMD>LeaderfFunctionAll<CR>', opts)

-- telescope-dap
-- bind('n', '<leader>dcc', '<CMD>Telescope dap commands<CR>', opts)
-- bind('n', '<leader>dcf', '<CMD>Telescope dap configurations<CR>', opts)
-- bind('n', '<leader>dl', '<CMD>Telescope dap list_breakpoints<CR>', opts)
-- bind('n', '<leader>dv', '<CMD>Telescope dap variables<CR>', opts)
-- bind('n', '<leader>df', '<CMD>Telescope dap frames<CR>', opts)
-- -- dap
-- bind('n', '<leader>bp', '<CMD>DapToggleBreakpoint<CR>', opts)
-- bind('n', '<leader>ds', '<CMD>DapTerminate<CR>', opts)
-- bind('n', '<leader>dt', '<CMD>DapTerminate<CR>', opts)
-- bind('n', '<leader>db', '<CMD>DapContinue<CR>', opts)
-- bind('n', '<leader>du', '<CMD>lua require("dapui").toggle()<CR>', opts)

-- -- undotree
bind('n', '<leader>oh', ':UndotreeToggle <BAR> :UndotreeFocus<CR>', opts)

-- -- tagbar
-- bind('n', '<leader>tb', ':TagbarToggle<CR>', opts)

-- plenary debug
bind(
    'n',
    '<leader>nd',
    ':lua require("plenary.profile").start("profile.log", { flame = true })<CR>',
    opts
)
bind(
    'n',
    '<leader>ns',
    ':lua require("plenary.profile").stop()<CR> | :!flamegraph.pl profile.log > flame.svg && rm -f profile.log && open flame.svg<CR>',
    opts
)
--
-- close lspinlayHit
bind(
    'n',
    '<leader>ih',
    '<CMD>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>',
    opts
)

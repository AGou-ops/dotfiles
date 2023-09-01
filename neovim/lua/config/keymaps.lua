vim.o.timeoutlen = 300

local bind = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============= Basic Keymaps =============
--
-- vim.api.nvim_create_user_command('TransparentToggle', 'hi Normal ctermbg=NONE guibg=NONE | hi EndOfBuffer guibg=NONE ctermbg=NONE', {})
-- bind('n', '<F3>', '<CMD>TransparentToggle<CR>')

bind('n', ';', ':')
bind('n', 'U', ':redo<CR>')
bind('v', ';', ':')

bind('c', 'W', 'w')
bind('c', 'WQ', 'wq')
bind('c', 'Wq', 'wq')
bind('c', 'QA', 'qa')

-- do not copy delete and change command
bind('n', 'd', [["_d]], opts)
bind('v', 'd', [["_d]], opts)
bind('n', 'c', [["_c]], opts)
bind('v', 'c', [["_c]], opts)

bind('n', '<C-o>', '<C-o>zz', opts)
bind('n', '<C-i>', '<C-i>zz', opts)

bind('n', 'q', '<Nop>')
bind('n', 'H', 'g^')
bind('n', 'L', 'g_')
bind('v', 'H', 'g^')
bind('v', 'L', 'g_')
bind('n', 'k', 'gk')
bind('n', 'j', 'gj')
bind('v', '<tab>', '<S->>gv')
bind('v', '<S-tab>', '<S-<>gv')
bind('n', '<C-left>', '<CMD>bp<CR>')
bind('n', '<C-right>', '<CMD>bn<CR>')

bind('n', '<C-t>', '<CMD>tabnew<CR>')
bind('n', '<C-t>', '<Esc><CMD>tabnew<CR>')

bind('n', '<ESC>', '<CMD>noh<CR>')

bind('n', '<leader>0', '<CMD>tablast<CR>')
bind('n', '<leader>dd', ':%bdelete<CR>')

-- copy to system clipboard
bind('n', '<C-c>', '"+y')
bind('n', '<C-h>', '<C-w>h')
bind('n', '<C-j>', '<C-w>j')
bind('n', '<C-k>', '<C-w>k')
bind('n', '<C-l>', '<C-w>l')
bind('n', '<C-q>', '<C-w>q')
bind('n', '<C-\\>', '<C-w><bar>')

-- Auto indent pasted text
bind('n', 'p', ']p')
bind('n', 'P', '[p')
bind('n', '(', '%')
bind('n', ')', '%')

-- turn off direction keyboard, force yourself use `hjkl` !!!
bind('n', '<Left>', '<Nop>')
bind('n', '<Right>', '<Nop>')
bind('n', '<Up>', '<Nop>')
bind('n', '<Down>', '<Nop>')
bind('n', '<space>', '/\\v')
bind('n', '<Esc>[1;3D', '<CMD>bn<CR>')
bind('n', '<Esc>[1;3C', '<CMD>bp<CR>')

-- tab quick swich
bind('n', '<leader>th', '<CMD>tabfirst<CR>')
bind('n', '<leader>tl', '<CMD>tablast<CR>')
bind('n', '<leader>tj', '<CMD>tabnext<CR>')
bind('n', '<leader>tk', '<CMD>tabprev<CR>')
bind('n', '<leader>tn', '<CMD>tabnext<CR>')
-- bind('n', '<leader>tp', '<CMD>tabprev<CR>')
bind('n', '<leader>te', '<CMD>tabedit<CR>')
-- bind('n', '<leader>td', '<CMD>tabclose<CR>')
bind('n', '<leader>tm', '<CMD>tabm<CR>')

-- ============= Plugin Keymaps =============
-- git open curren repo
bind('n', '<leader>go', '<CMD>:!git open<CR><CR>', opts)
-- toggleTerm & Lazygit
bind('n', '<leader>tt', '<CMD>exe v:count1 . "ToggleTerm"<CR>')
bind('n', '<leader>gg', '<CMD>lua _Lazygit_toggle()<CR>')

-- vim-translator
-- bind('n', '<leader>ts', '<CMD>TranslateW<CR>')
--

-- treesitter
bind('n', '<leader>hd', '<CMD>TSDisable highlight<CR>')

-- leaderF
bind('n', '<leader>lg', '<CMD>LeaderfRgInteractive<CR>')
bind('n', '<leader>lf', '<CMD>LeaderfFile<CR>')
bind('n', '<leader>lF', '<CMD>LeaderfFunctionAll<CR>')

-- telescope-dap
bind('n', '<leader>dcc', '<CMD>Telescope dap commands<CR>')
bind('n', '<leader>dcf', '<CMD>Telescope dap configurations<CR>')
bind('n', '<leader>dl', '<CMD>Telescope dap list_breakpoints<CR>')
bind('n', '<leader>dv', '<CMD>Telescope dap variables<CR>')
bind('n', '<leader>df', '<CMD>Telescope dap frames<CR>')
-- dap
bind('n', '<leader>bp', '<CMD>DapToggleBreakpoint<CR>')
bind('n', '<leader>ds', '<CMD>DapTerminate<CR>')
bind('n', '<leader>dt', '<CMD>DapTerminate<CR>')
bind('n', '<leader>db', '<CMD>DapContinue<CR>')
bind('n', '<leader>du', '<CMD>lua require("dapui").toggle()<CR>')

-- -- undotree
bind('n', '<leader>oh', ':UndotreeToggle <BAR> :UndotreeFocus<CR>')

-- -- tagbar
bind('n', '<leader>tb', ':TagbarToggle<CR>')
--
-- close lspinlayHit
bind('n', '<leader>io', '<CMD>lua vim.lsp.inlay_hint(0, true)<CR>')
bind('n', '<leader>ic', '<CMD>lua vim.lsp.inlay_hint(0, false)<CR>')

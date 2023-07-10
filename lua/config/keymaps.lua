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
bind('n', '/', '/\\v')
bind('n', '//', 'y/<c-r>"<cr>')
bind('n', '<C-left>', '<CMD>bp<CR>')
bind('n', '<C-right>', '<CMD>bn<CR>')

bind('n', '<C-t>', '<CMD>tabnew<CR>')
bind('n', '<C-t>', '<Esc><CMD>tabnew<CR>')

bind('n', '<ESC>', '<CMD>noh<CR>')

bind('n', '<leader>0', '<CMD>tablast<CR>')
bind('n', '<leader>dd', ':%bdelete<CR>')

-- copy to system clipboard
bind('n', '<C-c>', '"+y')
bind('n', 'y', '"+y')
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
bind('n', '<TAB>', '%')

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
-- toggleTerm & Lazygit
bind('n', '<leader>tt', '<CMD>exe v:count1 . "ToggleTerm"<CR>')
bind('n', '<leader>gg', '<CMD>lua _Lazygit_toggle()<CR>')

-- vim-translator
-- bind('n', '<leader>ts', '<CMD>TranslateW<CR>')

-- leaderF
bind('n', '<leader>fG', '<CMD>LeaderfRgInteractive<CR>')
bind('n', '<C-F>', '<CMD>LeaderfFile<CR>')

-- telescope-dap
-- bind('n', '<leader>dcc', '<CMD>Telescope dap commands<CR>')
-- bind('n', '<leader>dcf', '<CMD>Telescope dap configurations<CR>')
-- bind('n', '<leader>dl', '<CMD>Telescope dap list_breakpoints<CR>')
-- bind('n', '<leader>dv', '<CMD>Telescope dap variables<CR>')
-- bind('n', '<leader>df', '<CMD>Telescope dap frames<CR>')
--
-- -- undotree
bind('n', '<leader>oh', ':UndotreeToggle <BAR> :UndotreeFocus<CR>')

-- close lspinlayHit
bind('n', '<leader>io', '<CMD>lua vim.lsp.buf.inlay_hint(0, true)<CR>')
bind('n', '<leader>ic', '<CMD>lua vim.lsp.buf.inlay_hint(0, false)<CR>')

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

bind('n', '<C-i>', 'o<C-u>')

bind('n', '<leader>0', '<CMD>tablast<CR>')
bind('n', '<leader>dd', ':%bdelete<CR>')

-- copy to system clipboard
-- bind('n', '<leader>y', '"+y')
bind('n', '<C-c>', '"+y')
bind('n', 'y', '"+y')
-- bind('n', '<C-v>', '"+p')
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
bind('n', '<leader>td', '<CMD>tabclose<CR>')
bind('n', '<leader>tm', '<CMD>tabm<CR>')

-- ============= Plugin Keymaps =============
-- lspsaga
bind('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>')
bind({ 'n' }, 'gx', '<cmd>Lspsaga code_action<CR>')
bind('n', 'gr', '<cmd>Lspsaga rename<CR>')
-- bind("n", "gD", "<cmd>Lspsaga peek_definition<CR>")
bind('n', 'gd', '<cmd>Lspsaga goto_definition<CR>')
bind('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>')
bind('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
bind('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>')
bind('n', 'gP', '<cmd>Lspsaga peek_definition<CR>')
bind('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
bind('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<CR>')
bind('n', 'gK', function()
    require('lspsaga.diagnostic').goto_prev({
        severity = vim.diagnostic.severity.ERROR,
    })
end)
bind('n', 'gJ', function()
    require('lspsaga.diagnostic').goto_next({
        severity = vim.diagnostic.severity.ERROR,
    })
end)
bind('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
bind('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
bind('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>')
bind('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>')
bind({ 'n', 't' }, '<A-d>', '<cmd>Lspsaga term_toggle<CR>')

-- toggleTerm & Lazygit
bind('n', '<leader>tt', '<CMD>exe v:count1 . "ToggleTerm"<CR>')
bind('n', '<leader>gg', '<CMD>lua _Lazygit_toggle()<CR>')

-- vim-translator
bind('n', '<leader>ts', '<CMD>TranslateW<CR>')

-- leaderF
bind('n', '<leader>fG', '<CMD>LeaderfRgInteractive<CR>')
bind('n', '<leader>fm', '<CMD><C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>')
bind('n', '<leader>fl', '<CMD><C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>')
bind('n', '<leader>fb', '<CMD><C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>')
bind(
    'n',
    '<C-B>',
    '<CMD><C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>'
)
bind('n', '<C-F>', '<CMD><C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>')

-- telescope-dap
bind('n', '<leader>dcc', '<CMD>Telescope dap commands<CR>')
bind('n', '<leader>dcf', '<CMD>Telescope dap configurations<CR>')
bind('n', '<leader>dl', '<CMD>Telescope dap list_breakpoints<CR>')
bind('n', '<leader>dv', '<CMD>Telescope dap variables<CR>')
bind('n', '<leader>df', '<CMD>Telescope dap frames<CR>')

-- undotree
bind('n', '<leader>h', ':UndotreeToggle <BAR> :UndotreeFocus<CR>')

-- hop
bind(
    'n',
    'f',
    "<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
)
bind(
    'n',
    'F',
    "<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
)
bind(
    'v',
    'f',
    "<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
)
bind(
    'v',
    'F',
    "<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
)
bind('n', 't', '<CMD>HopWord<CR>')
bind('n', 'T', '<CMD>HopWord<CR>')

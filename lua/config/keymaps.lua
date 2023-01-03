vim.o.timeoutlen = 300


local bind = vim.keymap.set

bind('n', ';', ':')
bind('v', ';', ':')

bind('c', 'W', 'w')
bind('c', 'WQ', 'wq')
bind('c', 'Wq', 'wq')
bind('c', 'QA', 'qa')

bind('n', 'q', '<Nop>')
bind('n', 'H', '^')
bind('n', 'L', 'g_')
bind('n', 'L', 'g$')
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
bind('n', 'p', 'p=`]<C-o>')
bind('n', 'P', 'P=`]<C-o>')

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

bind('n', '<leader>tt', '<CMD>exe v:count1 . "ToggleTerm"<CR>')
bind('n', '<leader>gg', '<CMD>lua _LAZYGIT_TOGGLE()<CR>')

bind('n', '<leader>fG', '<CMD>LeaderfRgInteractive<CR>')
bind('n', '<leader>fm', '<CMD><C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>')
bind('n', '<leader>fl', '<CMD><C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>')
bind('n', '<leader>fb', '<CMD><C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>')
bind('n', '<C-B>', '<CMD><C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>')
bind('n', '<C-F>', '<CMD><C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>')

-- telescope-dap
bind('n', '<leader>dcc', '<CMD>Telescope dap commands<CR>')
bind('n', '<leader>dcf', '<CMD>Telescope dap configurations<CR>')
bind('n', '<leader>dl', '<CMD>Telescope dap list_breakpoints<CR>')
bind('n', '<leader>dv', '<CMD>Telescope dap variables<CR>')
bind('n', '<leader>df', '<CMD>Telescope dap frames<CR>')

bind('n', '<leader>h', ':UndotreeToggle <BAR> :UndotreeFocus<CR>')

bind('n', 'f',
	"<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>")
bind('n', 'F',
	"<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>")
bind('n', 'f',
	"<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>")
bind('n', 'F',
	"<CMD>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>")
bind('n', 't', '<CMD>HopWord<CR>')
bind('n', 'T', '<CMD>HopWord<CR>')

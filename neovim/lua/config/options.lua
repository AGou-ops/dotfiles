-- vim.cmd('source ~/.config/nvim/lua/config/general.vim')

-- leader KEY
vim.g.mapleader = ','

-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- Enable highlight on search
vim.o.hlsearch = true

-- vim.o.autochdir = true

-- Highlight match while typing search pattern
vim.o.incsearch = true

-- Make line numbers default
vim.wo.number = true

-- Do not save when switching buffers
vim.o.hidden = true

-- Enable break indent
vim.o.breakindent = true

-- Set breakline char
vim.o.showbreak = '⤿ '

-- Add clipboard support
vim.o.clipboard = 'unnamed'

-- Use swapfiles
vim.o.swapfile = false

-- Save undo history
-- vim.o.undofile = true
-- vim.o.undolevels = 1000

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 200
vim.wo.signcolumn = 'yes'

-- Faster scrolling
vim.o.lazyredraw = true

-- Decrease redraw time
vim.o.redrawtime = 100

-- Set true colors
vim.o.termguicolors = true

-- Disable intro message
vim.opt.shortmess:append('I')

-- Disable search count res from the bottom right corner
vim.opt.shortmess:append('S')

-- Disable ins-completion-menu messages
vim.opt.shortmess:append('c')

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append('<>hl')

-- Take indent for new line from previous line
vim.o.autoindent = true
vim.o.smartindent = true

-- Number of command-lines that are remembered
vim.o.history = 10000

-- Use menu for command line completion
vim.o.wildmenu = true

-- Enable wrap
vim.o.wrap = true

-- Wrap long lines at a blank
vim.o.linebreak = true

-- Highlight the current line
vim.o.cursorline = true

-- Autom. read file when changed outside of Vim
vim.o.autoread = true

-- Autom. save file before some action
vim.o.autowrite = true

-- Keep backup file after overwriting a file
vim.o.backup = true

-- Make a backup before overwriting a file
vim.o.writebackup = false

-- -- For opening splits on right or bottom.
-- vim.o.splitbelow = true
-- vim.o.splitright = true

-- Show cursor line and column in the status line
vim.o.ruler = true

-- Briefly jump to matching bracket if insert one
vim.o.showmatch = true

-- Hide show current mode on status line
vim.o.showmode = false

-- Show absolute line number in front of each line
vim.o.relativenumber = true

-- Maximum height of the popup menu
vim.o.pumheight = 15

-- Show cmdline by default
vim.o.cmdheight = 1

-- Minimum nr. of lines above and below cursor
vim.o.scrolloff = 5 -- could be 1
vim.o.sidescrolloff = 5

-- Ignore case when completing file names and directories.
vim.o.wildignorecase = true

-- Timeout on leaderkey
vim.o.ttimeout = true
vim.o.ttimeoutlen = 5

-- Timeout on mapped sequences
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Show (partial) command in status line
vim.o.showcmd = false

-- Configure the number of spaces a tab is counting for
vim.o.tabstop = 4

-- Number of spaces for a step of indent
vim.o.shiftwidth = 4

-- Folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.o.foldcolumn = '1'

-- Use ripgrep as grep tool
vim.o.grepprg = 'rg --vimgrep --no-heading'
vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'

-- No double spaces with join after a dot
vim.opt.joinspaces = false

-- Set directories for backup/swap/undo files
vim.opt.directory = vim.fn.stdpath('state') .. '/swap'
vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup'
vim.opt.undodir = vim.fn.stdpath('state') .. '/undo'

-- Set python3 interpreter
vim.g.python3_host_prog = '/opt/local/bin/python3'

-- Disable some builtin providers
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- ctrl-o/ctrl-i jump options
vim.opt.jumpoptions = 'stack,view'

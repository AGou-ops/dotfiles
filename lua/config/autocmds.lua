---@diagnostic disable: param-type-mismatch
-- TODO: 待优化
vim.cmd([[
" use async terminal instead
autocmd BufEnter *.go nnoremap <Leader>rr :AsyncRun -mode=term -pos=bottom -rows=10 go run $(VIM_FILEPATH)<CR>
autocmd BufEnter *.py nnoremap <Leader>rr :AsyncRun -mode=term -pos=bottom -rows=10 python3 $(VIM_FILEPATH)<CR>
autocmd BufEnter *.go nnoremap <Leader>rR :AsyncRun -mode=term -pos=bottom -rows=85 go run $(VIM_FILEPATH)<CR>
autocmd BufEnter *.go nnoremap <Leader>rt :AsyncRun -mode=term -pos=toggleterm2 go run $(VIM_FILEPATH)<CR>
autocmd BufEnter *.go nnoremap <Leader>rT :AsyncRun -mode=term -pos=macos go run $(VIM_FILEPATH)<CR>
autocmd BufEnter *.go nnoremap <Leader>rp :AsyncRun -mode=term -pos=bottom -rows=10 go run .<CR>
autocmd BufEnter *.go nnoremap <Leader>rP :AsyncRun -mode=term -pos=macos -rows=10 go run .<CR>
" autocmd BufEnter *.go nnoremap <Leader>gt :AsyncRun -mode=term -pos=bottom -rows=10 go test $(VIM_FILEPATH)CR>
autocmd BufEnter *.go nnoremap <Leader>gb :AsyncRun -mode=term -pos=bottom -rows=10 go build .<CR>
autocmd BufEnter *.html nnoremap <Leader>rr :AsyncRun -mode=term -pos=bottom -rows=80 miniserve .<CR>
autocmd BufEnter *.markdown nnoremap <C-b> ciw****<left><Esc>P
autocmd BufEnter *.markdown nnoremap <Leader>mp :MarkdownPreview<CR>
autocmd BufEnter *.markdown vnoremap <C-b> c****<left><Esc>P
autocmd BufEnter *.tex nnoremap <Leader>rr :AsyncRun -mode=term -pos=bottom -rows=10 miktex-xelatex % && open -a "Google Chrome" resume_photo.pdf<CR>
]])

vim.cmd([[
" notification after file change
autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" toggle number style when input mode changed.
autocmd InsertEnter * set norelativenumber number    " use absolute line number.
autocmd InsertLeave * set relativenumber

autocmd FileType zsh set nowrap
autocmd FileType dashboard :NvimTreeToggle
autocmd FileType dashboard nmap Q <cmd>qa<CR>

au FileType go set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

au BufRead,BufNewFile Jenkinsfile,*.jenkins set filetype=groovy

" TODO: set your own python3 path.(LeaderF)
let g:python3_host_prog = "/opt/homebrew/bin/python3.11"

" Clear jumplist on vim Enter
au VimEnter * :clearjumps

]])

-- ------------------------

local augroups = {}

augroups.buf_write_pre = {
    mkdir_before_saving = {
        event = { 'BufWritePre', 'FileWritePre' },
        pattern = '*',
        -- TODO: Replace vimscript function
        command = [[ silent! call mkdir(expand("<afile>:p:h"), "p") ]],
    },
    trim_extra_spaces_and_newlines = {
        event = 'BufWritePre',
        pattern = '*',
        -- TODO: Replace vimscript function
        command = [[
      let current_pos = getpos(".")
      silent! %s/\v\s+$|\n+%$//e
      silent! call setpos(".", current_pos)
    ]],
    },
}

augroups.filetype_behaviour = {
    remove_colorcolumn = {
        event = 'FileType',
        pattern = { 'fugitive*', 'git' },
        callback = function()
            vim.opt_local.colorcolumn = ''
        end,
    },
}

augroups.misc = {
    highlight_yank = {
        event = 'TextYankPost',
        pattern = '*',
        callback = function()
            vim.highlight.on_yank({
                higroup = 'IncSearch',
                timeout = 200,
                on_visual = true,
            })
        end,
    },
    -- trigger_nvim_lint = {
    --   event = {"BufEnter", "BufNew", "InsertLeave", "TextChanged"},
    --   pattern = "<buffer>",
    --   callback = function ()
    --     require("lint").try_lint()
    --   end,
    -- },
    unlist_terminal = {
        event = 'TermOpen',
        pattern = '*',
        callback = function()
            vim.opt_local.buflisted = false
        end,
    },
}

augroups.prose = {
    wrap = {
        event = 'FileType',
        pattern = { 'markdown', 'tex' },
        callback = function()
            vim.opt_local.wrap = true
        end,
    },
}

augroups.quit = {
    quit_with_q = {
        event = 'FileType',
        pattern = {
            'checkhealth',
            'fugitive',
            'git*',
            'help',
            'lspinfo',
            'startuptime',
            'qf',
            'TelescopePrompt',
            'neotest-output-panel',
            'neotest-summary',
            'dashboard',
            'spectre_panel',
            'neotest-output',
            'blame',
            'grug-far',
        },
        callback = function(event)
            vim.bo[event.buf].buflisted = false
            vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
        end,
    },
}

-- wrap and check for spell in text filetypes
augroups.wrap_spell = {
    wrap_spell_by_filetype = {
        event = 'FileType',
        pattern = { 'gitcommit', 'markdown' },
        callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
        end,
    },
}

-- resize splits if window got resized
augroups.resize_split = {
    resize_split = {
        event = 'VimResized',
        callback = function()
            vim.cmd('tabdo wincmd =')
        end,
    },
}

for group, commands in pairs(augroups) do
    local augroup = vim.api.nvim_create_augroup('AU_' .. group, { clear = true })

    for _, opts in pairs(commands) do
        local event = opts.event
        opts.event = nil
        opts.group = augroup
        vim.api.nvim_create_autocmd(event, opts)
    end
end

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- autosave file when buffer leave or focus lost
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost' }, {
    callback = function()
        if
            vim.bo.modified
            and not vim.bo.readonly
            and vim.fn.expand('%') ~= ''
            and vim.bo.buftype == ''
        then
            vim.api.nvim_command('silent update')
        end
    end,
})

-- inlay_hint auto enable
vim.api.nvim_create_autocmd('LspAttach', {
    pattern = { '*.go', '*.lua' },
    callback = function(_)
        vim.lsp.inlay_hint.enable()
    end,
})

-- disable semantic highlighting
for _, group in ipairs(vim.fn.getcompletion('@lsp', 'highlight')) do
    vim.api.nvim_set_hl(0, group, {})
end

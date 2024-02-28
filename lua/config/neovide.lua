-- Configuration for neovide
if vim.g.neovide then
    vim.o.guifont = 'VictorMono Nerd Font Propo:h17'
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
    vim.g.neovide_transparency = 0.5
    vim.g.transparency = 0.8
    vim.g.neovide_window_blurred = true
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_fullscreen = false
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_profiler = false
    vim.g.neovide_input_macos_alt_is_meta = true
    vim.g.neovide_cursor_vfx_mode = 'railgun'
    vim.g.neovide_cursor_vfx_mode = 'ripple'

    -- remap nvimTree keymap
    vim.keymap.set('n', '<D-n>', '<Cmd>NvimTreeToggle<CR>')
    vim.opt.laststatus = 3

    -- command mapping
    vim.keymap.set({ 'i', 'n' }, '<D-a>', '<Esc>ggVG') -- select all
    vim.keymap.set({ 'i', 'n' }, '<D-w>', function()
        confirm_close_tab()
    end) -- close tab
    vim.keymap.set({ 'i', 'n' }, '<D-[>', function()
        vim.cmd('BufferPrevious')
    end) -- previous tab
    vim.keymap.set({ 'i', 'n' }, '<D-]>', function()
        vim.cmd('BufferNext')
    end) -- next tab
    vim.keymap.set('i', '<D-t>', '<C-o>:tabnew<CR><Esc>') -- new tab (insert)
    vim.keymap.set('n', '<D-t>', ':tabnew<CR>') -- new tab (insert)
    vim.keymap.set('i', '<D-s>', '<C-o>:w<CR>') -- save (insert)
    vim.keymap.set('n', '<D-s>', ':w<CR>') -- save (normal)
    vim.keymap.set('x', '<D-x>', '"+dm0i<Esc>`0') -- cut (include insert hack to fix whichkey issue #518)
    vim.keymap.set('x', '<D-c>', '"+y') -- copy
    vim.keymap.set('i', '<D-v>', '<C-r><C-o>+') -- paste (insert)
    vim.keymap.set('n', '<D-v>', 'i<C-r><C-o>+<Esc>l') -- paste (normal)
    vim.keymap.set('x', '<D-v>', '"+P') -- paste (visual)
    vim.keymap.set('c', '<D-v>', '<C-r>+') -- paste (command)
    vim.keymap.set('n', '<D-z>', 'u') -- undo
    vim.keymap.set({ 'i', 'n' }, '<D-q>', function()
        vim.cmd('confirm qa')
    end) -- quit
end

local home = os.getenv("HOME")
local db = require("dashboard")
-- 需要提前安装好lolcat命令
db.preview_command = "cat | lolcat -F 0.3"
db.preview_file_path = home .. "/.config/nvim/neovim.cat"
db.preview_file_height = 15
db.preview_file_width = 70
db.session_directory = home .. "/.config/nvim/sessions/"
db.custom_center = {
    {
        desc = "New File                                ",
        shortcut = "KEY n",
        icon = "  ",
        action = "DashboardNewFile",
    },
    {
        icon = "  ",
        desc = "Recently latest session                 ",
        shortcut = "KEY s",
        action = "SessionLoad",
    },
    {
        icon = "  ",
        desc = "Find  File                              ",
        action = "Telescope find_files find_command=rg,--hidden,--files",
        shortcut = "KEY f",
    },
    {
        icon = "  ",
        desc = "File Browser                            ",
        action = "Telescope file_browser",
        shortcut = "KEY b",
    },
    {
        icon = "  ",
        desc = "Find  word                              ",
        action = "Telescope live_grep",
        shortcut = "KEY w",
    },
    {
        icon = "  ",
        desc = "Edit Personal dotfiles                  ",
        action = "e ~/.config/nvim/init.vim",
        shortcut = "KEY d",
    },
    {
        desc = "Update Plugins                          ",
        shortcut = "KEY u",
        icon = "  ",
        action = "PlugUpdate",
    },
    {
        icon = "  ",
        desc = "Quit Neovim                              ",
        action = "qa!",
        shortcut = "KEY q  ",
    },
}


vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'dashboard',
    group = vim.api.nvim_create_augroup('Dashboard_au', { clear = true }),
    callback = function()
        vim.cmd [[
            hi! link DashboardFooter NonText
            setlocal buftype=nofile
            setlocal nonumber norelativenumber nocursorline noruler
            nnoremap <buffer> n <cmd>DashboardNewFile<CR>
            nnoremap <buffer> f <cmd>Telescope find_files find_command=rg,--hidden,--files<CR>
            nnoremap <buffer> b <cmd>Telescope file_browser<CR>
            nnoremap <buffer> w <cmd>Telescope Telescope live_grep<CR>
            nnoremap <buffer> c <cmd>e ~/.config/nvim/init.vim<CR>
            nnoremap <buffer> u <cmd>PlugUpdate<CR>
            nnoremap <buffer> q <cmd>exit<CR>
        ]]
    end
})

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
        icon = "  ",
        desc = "Recently latest session                 ",
        shortcut = "SPC s l",
        action = "SessionLoad",
    },
    -- {
    --   icon = "  ",
    --   desc = "Recently opened files                   ",
    --   action = "DashboardFindHistory",
    --   shortcut = "SPC f h",
    -- },
    {
        icon = "  ",
        desc = "Find  File                              ",
        action = "Telescope find_files find_command=rg,--hidden,--files",
        shortcut = "SPC f f",
    },
    {
        icon = "  ",
        desc = "File Browser                            ",
        action = "Telescope file_browser",
        shortcut = "SPC f b",
    },
    {
        icon = "  ",
        desc = "Find  word                              ",
        action = "Telescope live_grep",
        shortcut = "SPC f w",
    },
    {
        icon = "  ",
        desc = "Edit Personal dotfiles                  ",
        action = "e ~/.config/nvim/init.vim",
        shortcut = "SPC f d",
    },
    {
        icon = "  ",
        desc = "Quit Neovim                             ",
        action = "qa!",
        shortcut = "SPC q  ",
    },
}
-- '',
-- '',
-- '',
-- '岂能尽如人意，但求无愧我心。',
-- }

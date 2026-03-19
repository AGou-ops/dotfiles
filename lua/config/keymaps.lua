-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

pcall(vim.keymap.del, "n", "<BS>")

-- Basic keymaps from external config.
map({ "n", "v" }, ";", function()
    vim.api.nvim_input(":")
end, { silent = true, desc = "Command Mode" })
map({ "n" }, "<space>", "/\\v", { nowait = true, desc = "Search" })
map("n", "U", "<C-r>", { silent = true, desc = "Redo" })
map("c", "W", "w", { silent = true, desc = "Write" })
map("c", "WQ", "wq", { silent = true, desc = "Write and Quit" })
map("c", "Wq", "wq", { silent = true, desc = "Write and Quit" })
map("c", "QA", "qa", { silent = true, desc = "Quit All" })

map({ "n", "v" }, "d", [["_d]], { silent = true, desc = "Delete to Black Hole" })
map({ "n", "v" }, "c", [["_c]], { silent = true, desc = "Change to Black Hole" })
map("n", "<C-o>", "<C-o>zz", { silent = true, desc = "Jump Back and Center" })
map("n", "<C-i>", "<C-i>zz", { silent = true, desc = "Jump Forward and Center" })
map("n", "q", "<Nop>", { silent = true, desc = "Disable q" })
map({ "n", "v" }, "H", "g^", { silent = true, desc = "Line Start" })
map({ "n", "v" }, "L", "g_", { silent = true, desc = "Line End" })
map("v", "<Tab>", ">gv", { silent = true, desc = "Indent Right and Reselect" })
map("v", "<S-Tab>", "<gv", { silent = true, desc = "Indent Left and Reselect" })

map("n", "<C-t>", "<Cmd>tabnew<CR>", { silent = true, desc = "New Tab" })
map("n", "<leader>0", "<Cmd>tablast<CR>", { silent = true, desc = "Last Tab" })
map("n", "<leader>dd", ":%bdelete<CR>", { silent = true, desc = "Delete All Buffers" })
map("n", "<C-c>", '"+y', { silent = true, desc = "Yank to Clipboard" })
map("n", "<C-q>", "<C-w>q", { silent = true, desc = "Close Window" })
map("n", [[<C-\>]], "<C-w><bar>", { silent = true, desc = "Maximize Window Width" })
map("n", "(", "%", { silent = true, desc = "Match Pair" })
map("n", ")", "%", { silent = true, desc = "Match Pair" })

map("n", "<S-Up>", "<cmd>resize +2<CR>", { silent = true, desc = "Increase Window Height" })
map("n", "<S-Down>", "<cmd>resize -2<CR>", { silent = true, desc = "Decrease Window Height" })
map("n", "<S-Right>", "<cmd>vertical resize +5<CR>", { silent = true, desc = "Increase Window Width" })
map("n", "<S-Left>", "<cmd>vertical resize -5<CR>", { silent = true, desc = "Decrease Window Width" })
map("t", "<Esc>", "<C-\\><C-n>", { silent = true, desc = "Terminal Normal Mode" })

map("n", "<leader>th", "<Cmd>tabfirst<CR>", { silent = true, desc = "First Tab" })
map("n", "<leader>tl", "<Cmd>tablast<CR>", { silent = true, desc = "Last Tab" })
map("n", "<leader>tj", "<Cmd>tabnext<CR>", { silent = true, desc = "Next Tab" })
map("n", "<leader>tk", "<Cmd>tabprev<CR>", { silent = true, desc = "Previous Tab" })
map("n", "<leader>tn", "<Cmd>tabnext<CR>", { silent = true, desc = "Next Tab" })
map("n", "<leader>te", "<Cmd>tabedit<CR>", { silent = true, desc = "Tab Edit" })
map("n", "<leader>tm", "<Cmd>tabm<CR>", { silent = true, desc = "Move Tab" })
map("n", "<M-a>", "ggVG", { silent = true, desc = "Select All" })

map("n", "<leader>lr", "<Cmd>LspRestart<CR>", { silent = true, desc = "LSP Restart" })
map("n", "<leader>ls", "<Cmd>LspStop<CR>", { silent = true, desc = "LSP Stop" })
map("n", "<leader>lS", "<Cmd>LspStart<CR>", { silent = true, desc = "LSP Start" })
map("n", "<leader>go", "<Cmd>:!git open<CR><CR>", { silent = true, desc = "Open Git Repo" })
map("n", "<leader>tf", [[<Cmd>exe v:count1 . "ToggleTerm"<CR>]], { silent = true, desc = "ToggleTerm" })
map("n", "<leader>tb", "<Cmd>ToggleTerm size=12 direction=horizontal<CR>", { silent = true, desc = "Terminal Bottom" })
map("n", "<leader>tt", "<Cmd>ToggleTerm direction=tab<CR>", { silent = true, desc = "Terminal Tab" })
map("n", "<leader>hd", "<Cmd>TSDisable highlight<CR>", { silent = true, desc = "TS Highlight Off" })
map("n", "<leader>he", "<Cmd>TSEnable highlight<CR>", { silent = true, desc = "TS Highlight On" })
map("n", "<leader>oh", ":UndotreeToggle <BAR> :UndotreeFocus<CR>", { silent = true, desc = "Undotree Toggle" })
map(
    "n",
    "<leader>nd",
    ':lua require("plenary.profile").start("profile.log", { flame = true })<CR>',
    { silent = true, desc = "Start Lua Profiling" }
)
map(
    "n",
    "<leader>ns",
    ':lua require("plenary.profile").stop()<CR> | :!flamegraph.pl profile.log > flame.svg && rm -f profile.log && open flame.svg<CR>',
    { silent = true, desc = "Stop Lua Profiling" }
)
vim.keymap.set("n", "<leader>lz", "<cmd>:Lazy<cr>")
vim.keymap.set("n", "<leader>lu", "<cmd>:Lazy update<cr>")
map("n", "<leader>lz", "<cmd>:Lazy<cr>", { silent = true, desc = "Lazy plugin manager" })
map("n", "<leader>lu", "<cmd>:Lazy update<cr>", { silent = true, desc = "Lazy plugin update" })

-- hardMode util
local o = vim.o
local fn = vim.fn
local cmd = vim.cmd
--[[
Deletes all trailing whitespaces in a file if it's not binary nor a diff.
]]
--
function _G.trim_trailing_whitespaces()
    if not o.binary and o.filetype ~= 'diff' then
        local current_view = fn.winsaveview()
        cmd([[keeppatterns %s/\s\+$//e]])
        fn.winrestview(current_view)
    end
end

-- avoid repeating hjkl keys, from: https://github.com/sabah1994/dotfiles/blob/master/nvim/lua/keyMappings.lua#L10-L58
-- local id
-- local function avoid_hjkl(mode, mov_keys)
--     for _, key in ipairs(mov_keys) do
--         local count = 0
--         vim.keymap.set(mode, key, function()
--             if count >= 12 then
--                 id = vim.notify(
--                     'WARN: DO NOT FUCKING USE hjkl！USE w/W/b/B/e/E/f/F ！',
--                     vim.log.levels.WARN,
--                     {
--                         icon = '🤠',
--                         replace = id,
--                         keep = function()
--                             return count >= 5
--                         end,
--                     }
--                 )
--             else
--                 count = count + 1
--                 -- after 5 seconds decrement
--                 vim.defer_fn(function()
--                     count = count - 1
--                 end, 5000)
--                 return key
--             end
--         end, { expr = true })
--     end
-- end
--
-- -- Hard mode toggle
-- HardMode = false
-- function ToggleHardMode()
--     local modes = { 'n' }
--     local movement_keys = { 'h', 'l' }
--     if HardMode then
--         for _, mode in pairs(modes) do
--             for _, m_key in pairs(movement_keys) do
--                 vim.api.nvim_del_keymap(mode, m_key)
--             end
--         end
--         vim.notify('Hard mode OFF')
--     else
--         for _, mode in pairs(modes) do
--             avoid_hjkl(mode, movement_keys)
--         end
--         vim.notify('Hard mode ON')
--     end
--     HardMode = not HardMode
-- end
--
-- ToggleHardMode()
-- vim.api.nvim_set_keymap(
--     'n',
--     '<leader>th',
--     ':lua ToggleHardMode()<CR>',
--     { noremap = true, silent = true }
-- )

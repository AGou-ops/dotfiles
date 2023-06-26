local map = vim.api.nvim_set_keymap

map( "n", "<S-h>", "<Plug>GoNSMLeft", {} )
map( "n", "<S-j>", "<Plug>GoNSMDown", {} )
map( "n", "<S-k>", "<Plug>GoNSMUp", {} )
map( "n", "<S-l>", "<Plug>GoNSMRight", {} )

map( "x", "<S-h>", "<Plug>GoVSMLeft", {} )
map( "x", "<S-j>", "<Plug>GoVSMDown", {} )
map( "x", "<S-k>", "<Plug>GoVSMUp", {} )
map( "x", "<S-l>", "<Plug>GoVSMRight", {} )

map( "n", "<C-j>", "<Plug>GoNSDDown", {} )
map( "n", "<C-h>", "<Plug>GoNSDLeft", {} )
map( "n", "<C-k>", "<Plug>GoNSDUp", {} )
map( "n", "<C-l>", "<Plug>GoNSDRight", {} )

map( "x", "<C-h>", "<Plug>GoVSDLeft", {} )
map( "x", "<C-j>", "<Plug>GoVSDDown", {} )
map( "x", "<C-k>", "<Plug>GoVSDUp", {} )
map( "x", "<C-l>", "<Plug>GoVSDRight", {} )



require("gomove").setup {
  -- whether or not to map default key bindings, (true/false)
  map_defaults = true,
  -- whether or not to reindent lines moved vertically (true/false)
  reindent = true,
  -- whether or not to undojoin same direction moves (true/false)
  undojoin = true,
  -- whether to not to move past end column when moving blocks horizontally, (true/false)
  move_past_end_col = false,
}

--[[ -- 测试数据
aaa bbb ccc ddd
eee fff ggg hhh
iii jjj kkk lll
aaa bbb ccc ddd
aaa bbb ccc ddd
aaa bbb ccc ddd
]]

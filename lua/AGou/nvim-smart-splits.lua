require("smart-splits").setup({
  -- Ignored filetypes (only while resizing)
  ignored_filetypes = {
    "nofile",
    "quickfix",
    "prompt",
  },
  -- Ignored buffer types (only while resizing)
  ignored_buftypes = { "NvimTree" },
  -- when moving cursor between splits left or right,
  -- place the cursor on the same row of the *screen*
  -- regardless of line numbers. False by default.
  -- Can be overridden via function parameter, see Usage.
  move_cursor_same_row = false,
  -- resize mode options
  resize_mode = {
    -- key to exit persistent resize mode
    quit_key = "<ESC>",
    -- set to true to silence the notifications
    -- when entering/exiting persistent resize mode
    silent = false,
    -- must be functions, they will be executed when
    -- entering or exiting the resize mode
    hooks = {
      on_enter = nil,
      on_leave = nil,
    },
  },
  -- set to true to silence the notifications
  -- when entering/exiting persistent resize mode
  resize_mode_silent = false,
})

local amount = 2
-- local same_row = 2
-- resizing splits
-- amount defaults to 3 if not specified
-- use absolute values, no + or -
require("smart-splits").resize_up(amount)
require("smart-splits").resize_down(amount)
require("smart-splits").resize_left(amount)
require("smart-splits").resize_right(amount)
-- moving between splits
-- pass same_row as a boolean to override the default
-- for the move_cursor_same_row config option.
-- See Configuration.
-- require('smart-splits').move_cursor_up()
-- require('smart-splits').move_cursor_down()
-- require('smart-splits').move_cursor_left(same_row)
-- require('smart-splits').move_cursor_right(same_row)
-- persistent resize mode
-- temporarily remap 'h', 'j', 'k', and 'l' to
-- smart resize left, down, up, and right, respectively,
-- press <ESC> to stop resize mode (unless you've set a different key in config)
-- require('smart-splits').start_resize_mode()

-- resizing splits
--  defaults to 3 if not specified
-- use absolute values, no + or -
require('smart-splits').resize_up(2)
require('smart-splits').resize_down(2)
require('smart-splits').resize_left(2)
require('smart-splits').resize_right(2)

-- require('smart-splits').move_cursor_up()
-- require('smart-splits').move_cursor_down()
-- require('smart-splits').move_cursor_left()
-- require('smart-splits').move_cursor_right()
--

require('smart-splits').ignored_buftypes = { 'NvimTree','tagbar'}
require('smart-splits').ignored_filetypes = {
  'nofile',
  'quickfix',
  'prompt',
  'tagbar',
}

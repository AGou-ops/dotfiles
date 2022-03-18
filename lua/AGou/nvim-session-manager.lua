local opts = {
  log_level = 'info',
  auto_session_enable_last_session = true,
  auto_session_root_dir = vim.fn.stdpath('config').."/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil
}

require('auto-session').setup(opts)

-- local tele_status_ok, telescope = pcall(require, "telescope")
-- if not tele_status_ok then
-- 	return
-- end
--
-- telescope.load_extension('sessions')

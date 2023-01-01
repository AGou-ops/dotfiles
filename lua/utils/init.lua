local o   = vim.o
local fn  = vim.fn
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

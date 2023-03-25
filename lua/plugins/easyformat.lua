local M = {
	"glepnir/easyformat.nvim",
	dependencies = { "williamboman/mason.nvim" },
	cmd = "EasyFormat",
	event = "VeryLazy",
	keys = { { "<leader>ef", "<cmd>EasyFormat<cr>", desc = "Format current file." } },
}

function M.config()
	local configs = require("easyformat.config")

	configs.use_default({
		"go",
		"lua",
	})

	require("easyformat").setup({
		fmt_on_save = true,
	})
end

return M

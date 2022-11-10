local augroups = {}

augroups.buf_write_pre = {
    mkdir_before_saving = {
        event = { "BufWritePre", "FileWritePre" },
        pattern = "*",
        -- TODO: Replace vimscript function
        command = [[ silent! call mkdir(expand("<afile>:p:h"), "p") ]],
    },
    trim_extra_spaces_and_newlines = {
        event = "BufWritePre",
        pattern = "*",
        -- TODO: Replace vimscript function
        command = [[
      let current_pos = getpos(".")
      silent! %s/\v\s+$|\n+%$//e
      silent! call setpos(".", current_pos)
    ]]   ,
    },
}

augroups.filetype_behaviour = {
    remove_colorcolumn = {
        event = "FileType",
        pattern = { "fugitive*", "git" },
        callback = function()
            vim.opt_local.colorcolumn = ""
        end,
    },
}

augroups.misc = {
    highlight_yank = {
        event = "TextYankPost",
        pattern = "*",
        callback = function()
            vim.highlight.on_yank { higroup = "IncSearch", timeout = 200, on_visual = true }
        end,
    },
    -- trigger_nvim_lint = {
    --   event = {"BufEnter", "BufNew", "InsertLeave", "TextChanged"},
    --   pattern = "<buffer>",
    --   callback = function ()
    --     require("lint").try_lint()
    --   end,
    -- },
    unlist_terminal = {
        event = "TermOpen",
        pattern = "*",
        callback = function()
            vim.opt_local.buflisted = false
        end
    },
}

augroups.prose = {
    wrap = {
        event = "FileType",
        pattern = { "markdown", "tex" },
        callback = function()
            vim.opt_local.wrap = true
        end,
    },
}

augroups.quit = {
    quit_with_q = {
        event = "FileType",
        pattern = { "checkhealth", "fugitive", "git*", "help", "lspinfo", "startuptime", "qf", "TelescopePrompt" },
        callback = function()
            -- vim.api.nvim_win_close(0, true) -- TODO: Replace vim command with this
            vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>close!<cr>", { noremap = true, silent = true })
        end
    }
}


for group, commands in pairs(augroups) do
    local augroup = vim.api.nvim_create_augroup("AU_" .. group, { clear = true })

    for _, opts in pairs(commands) do
        local event = opts.event
        opts.event = nil
        opts.group = augroup
        vim.api.nvim_create_autocmd(event, opts)
    end
end


-- auto toggle wrap when split mutil window or goto single window.
vim.api.nvim_create_autocmd({ "WinNew", "WinClosed", "WinEnter" }, {
    group = vim.api.nvim_create_augroup("on_demand_wrap", {}),
    callback = function()
        local should_wrap = vim.api.nvim_win_get_width(0) ~= vim.o.columns
        vim.api.nvim_win_set_option(0, "wrap", should_wrap)
    end,
})

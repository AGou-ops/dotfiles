local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
}

function M.config()
    if vim.g.started_by_firenvim then
        return
    end

    local status_ok, nvim_tree = pcall(require, 'nvim-tree')
    if not status_ok then
        return
    end

    -- always open nvim-tree
    local function open_nvim_tree(data)
        -- buffer is a real file on the disk
        local real_file = vim.fn.filereadable(data.file) == 1

        -- buffer is a [No Name]
        local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

        if not real_file and not no_name then
            return
        end

        -- skip ignored filetypes
        local filetype = vim.bo[data.buf].ft
        local IGNORED_FT = { 'dashboard' }
        if vim.tbl_contains(IGNORED_FT, filetype) then
            return
        end

        -- open the tree but don't focus it
        require('nvim-tree.api').tree.toggle({ focus = false })
    end

    -- open nvimTree by default.
    vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

    vim.keymap.set('n', '<M-n>', '<Cmd>NvimTreeToggle<CR>')

    -- Silently open a new tab
    local function open_tab_silent(node)
        local api = require('nvim-tree.api')

        api.node.open.tab(node)
        vim.cmd.tabprev()
    end

    vim.keymap.set('n', 'T', open_tab_silent)
    -- NEW: keymapping Migration (default)
    local function on_attach(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
            return {
                desc = 'nvim-tree: ' .. desc,
                buffer = bufnr,
                noremap = true,
                silent = true,
                nowait = true,
            }
        end

        api.config.mappings.default_on_attach(bufnr)
        -- END_DEFAULT_ON_ATTACH

        -- Mappings migrated from view.mappings.list
        --
        -- You will need to insert "your code goes here" for any mappings with a custom action_cb
        vim.keymap.set('n', '<cr>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', '<2-leftmouse>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
        vim.keymap.set('n', 'P', api.node.navigate.parent_close, opts('Close Directory'))
        vim.keymap.set('n', 'P', function()
            local node = api.tree.get_node_under_cursor()
            print(node.absolute_path)
        end, opts('Print Node Path'))

        vim.keymap.set('n', 'o', api.node.run.system, opts('Run System'))
    end

    -- END: keymapping Migration
    --
    -- change TOML icon
    require('nvim-web-devicons').setup({
        override_by_extension = {
            ['toml'] = {
                icon = '',
                color = '#708085',
                name = 'Log',
            },
        },
    })
    --
    -- setup with all defaults
    -- each of these are documented in `:help nvim-tree.OPTION_NAME`
    nvim_tree.setup({ -- BEGIN_DEFAULT_OPTS
        auto_reload_on_write = true,
        disable_netrw = false,
        hijack_cursor = false,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        root_dirs = {},
        prefer_startup_root = true,
        sync_root_with_cwd = false,
        reload_on_bufenter = true,
        respect_buf_cwd = true,
        on_attach = on_attach,
        select_prompts = true,
        sort = {
            sorter = 'name',
            folders_first = true,
            files_first = false,
        },
        view = {
            adaptive_size = true,
            centralize_selection = false,
            cursorline = true,
            width = 30,
            side = 'left',
            preserve_window_proportions = false,
            number = false,
            relativenumber = false,
            signcolumn = 'yes',
            float = {
                enable = false,
                quit_on_focus_loss = true,
                open_win_config = {
                    relative = 'editor',
                    border = 'rounded',
                    width = 30,
                    height = 30,
                    row = 1,
                    col = 1,
                },
            },
        },
        renderer = {
            add_trailing = false,
            group_empty = false,
            highlight_git = false,
            full_name = true,
            highlight_opened_files = 'none',
            highlight_modified = 'none',
            root_folder_label = ':~:s?$?/..?',
            indent_width = 2,
            indent_markers = {
                enable = false,
                inline_arrows = true,
                icons = {
                    corner = '└',
                    edge = '│',
                    item = '│',
                    bottom = '─',
                    none = ' ',
                },
            },
            icons = {
                webdev_colors = true,
                git_placement = 'before',
                modified_placement = 'after',
                padding = ' ',
                symlink_arrow = ' ➛ ',
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                    modified = true,
                },
                glyphs = {
                    default = '',
                    symlink = '',
                    bookmark = '',
                    modified = '●',
                    folder = {
                        arrow_closed = '',
                        arrow_open = '',
                        default = '',
                        open = '',
                        empty = '',
                        empty_open = '',
                        symlink = '',
                        symlink_open = '',
                    },
                    git = {
                        unstaged = '✗',
                        staged = '✓',
                        unmerged = '',
                        renamed = '➜',
                        untracked = '󰜄',
                        deleted = '',
                        ignored = '◌',
                    },
                },
            },
            special_files = {
                'Cargo.toml',
                'Makefile',
                'README.md',
                'readme.md',
                'package.json',
                'package-lock.json',
            },
            symlink_destination = true,
        },
        -- hijack_directories = { enable = true, auto_open = true },
        update_focused_file = {
            enable = true,
            debounce_delay = 15,
            update_root = true,
            ignore_list = { 'toggleterm', 'term' },
        },
        system_open = { cmd = '', args = {} },
        diagnostics = {
            enable = true,
            show_on_dirs = false,
            show_on_open_dirs = true,
            debounce_delay = 50,
            severity = {
                min = vim.diagnostic.severity.HINT,
                max = vim.diagnostic.severity.ERROR,
            },
            icons = { hint = '', info = '', warning = '', error = '' },
        },
        filters = {
            dotfiles = false,
            git_clean = false,
            no_buffer = false,
            custom = { 'node_modules', '.DS_Store', '.git', '.vscode', '.idea', '.conform' },
            exclude = {},
        },
        filesystem_watchers = {
            enable = true,
            debounce_delay = 50,
            ignore_dirs = {},
        },
        git = {
            enable = true,
            ignore = false,
            show_on_dirs = true,
            show_on_open_dirs = true,
            timeout = 400,
        },
        modified = {
            enable = false,
            show_on_dirs = true,
            show_on_open_dirs = true,
        },
        actions = {
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = false,
                restrict_above_cwd = false,
            },
            expand_all = { max_folder_discovery = 300, exclude = {} },
            file_popup = {
                open_win_config = {
                    col = 1,
                    row = 1,
                    relative = 'cursor',
                    border = 'shadow',
                    style = 'minimal',
                },
            },
            open_file = {
                quit_on_open = false,
                resize_window = true,
                window_picker = {
                    enable = true,
                    picker = 'default',
                    chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
                    exclude = {
                        filetype = {
                            'notify',
                            'packer',
                            'qf',
                            'diff',
                            'fugitive',
                            'fugitiveblame',
                        },
                        buftype = { 'nofile', 'terminal', 'help' },
                    },
                },
            },
            remove_file = { close_window = true },
        },
        trash = { cmd = 'trash-put', require_confirm = true },
        live_filter = { prefix = '[FILTER]: ', always_show_folders = true },
        tab = { sync = { open = false, close = false, ignore = {} } },
        notify = { threshold = vim.log.levels.INFO },
        log = {
            enable = false,
            truncate = false,
            types = {
                all = false,
                config = false,
                copy_paste = false,
                dev = false,
                diagnostics = false,
                git = false,
                profile = false,
                watcher = false,
            },
        },
    }) -- END_DEFAULT_OPTS
end

return M

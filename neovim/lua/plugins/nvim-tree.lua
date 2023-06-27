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

        -- Default mappings. Feel free to modify or remove as you wish.
        --
        -- BEGIN_DEFAULT_ON_ATTACH
        vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
        vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
        vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
        vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
        vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
        vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
        vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
        vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
        vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
        vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
        vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
        vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts('Move Bookmarked'))
        vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
        vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
        vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, opts('Toggle Git Clean'))
        vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
        vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
        vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
        vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
        vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
        vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
        vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
        vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
        vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
        vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
        vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
        vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
        vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
        vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
        vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
        vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
        vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
        vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
        vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
        vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
        vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
        vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
        vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
        vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
        vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
        vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
        vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
        vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
        vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
        vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
        vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
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
    -- setup with all defaults
    -- each of these are documented in `:help nvim-tree.OPTION_NAME`
    nvim_tree.setup({ -- BEGIN_DEFAULT_OPTS
        auto_reload_on_write = true,
        disable_netrw = false,
        hijack_cursor = false,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        sort_by = 'name',
        root_dirs = {},
        prefer_startup_root = true,
        sync_root_with_cwd = true,
        reload_on_bufenter = true,
        respect_buf_cwd = true,
        on_attach = on_attach,
        remove_keymaps = false,
        select_prompts = true,
        view = {
            adaptive_size = true,
            centralize_selection = false,
            cursorline = true,
            width = 30,
            hide_root_folder = false,
            side = 'left',
            preserve_window_proportions = false,
            number = false,
            relativenumber = false,
            signcolumn = 'yes',
            -- DEPRECATED, Migrating to `on_attach` function.
            -- mappings = {
            --     custom_only = false,
            --     list = {
            --         -- user mappings go here
            --         { key = { '<cr>', 'l', '<2-leftmouse>' }, action = 'edit' },
            --         { key = 'v', action = 'vsplit' },
            --         { key = 's', action = 'split' },
            --         { key = 'h', action = 'close_node' },
            --         -- custom function
            --         { key = 'P', action = 'Print Node Path', action_cb = print_node_path },
            --         { key = 'o', action = 'system_open' },
            --     },
            -- },
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
                    bookmark = '',
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
                        untracked = '★',
                        deleted = '',
                        ignored = '◌',
                    },
                },
            },
            special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
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
            custom = {},
            exclude = {},
        },
        filesystem_watchers = {
            enable = true,
            debounce_delay = 50,
            ignore_dirs = {},
        },
        git = {
            enable = true,
            ignore = true,
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

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
        {
      'filename',
      file_status = true,  -- displays file status (readonly status, modified status)
      path = 2,            -- 0 = just filename, 1 = relative path, 2 = absolute path
      shorting_target = 20 -- Shortens path to leave 40 space in the window
                           -- for other components. Terrible name any suggestions?
        }
        },
    lualine_x = {'encoding', 'fileformat',
    {
      'filetype',
      colored = true, -- displays filetype icon in color if set to `true
      icon_only = false -- Display only icon for filetype
    }
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

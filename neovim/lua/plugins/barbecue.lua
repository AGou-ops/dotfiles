local spec = {
    'utilyre/barbecue.nvim',
    -- event = 'UIEnter',
    ft = { 'go', 'lua', 'yaml', 'yml', 'markdown' },
    dependencies = {
        'neovim/nvim-lspconfig',
        'smiteshp/nvim-navic',
        'nvim-tree/nvim-web-devicons', -- optional dependency
    },
}

function spec.config()
    require('barbecue').setup({})
    vim.cmd([[
	hi barbecue_context_namespace guifg=#40ffff guibg=#282828
	hi barbecue_context_boolean guifg=#40ffff guibg=#282828
	hi barbecue_context_number guifg=#40ffff guibg=#282828
	hi barbecue_context_string guifg=#40ffff guibg=#282828
	hi barbecue_context_variable guifg=#40ffff guibg=#282828
	hi barbecue_context_function guifg=#40ffff guibg=#282828
	hi barbecue_context_interface guifg=#40ffff guibg=#282828
	hi barbecue_context_enum guifg=#40ffff guibg=#282828
	hi barbecue_context_constructor guifg=#40ffff guibg=#282828
	hi barbecue_normal guibg=#282828
	hi barbecue_modified guifg=#ffff60 guibg=#282828
	hi barbecue_context_property guifg=#40ffff guibg=#282828
	hi barbecue_context_method guifg=#40ffff guibg=#282828
	hi barbecue_context_class guifg=#40ffff guibg=#282828
	hi barbecue_context_package guifg=#40ffff guibg=#282828
	hi barbecue_context_module guifg=#40ffff guibg=#282828
	hi barbecue_context_file guifg=#40ffff guibg=#282828
	hi barbecue_basename cterm=bold gui=italic,bold guibg=#282828
	hi barbecue_ellipsis guifg=LightGrey guibg=#282828
	hi barbecue_context_event guifg=#40ffff guibg=#282828
	hi barbecue_context_enum_member guifg=#40ffff guibg=#282828
	hi barbecue_context_struct guifg=#40ffff guibg=#282828
	hi barbecue_context guibg=#282828
	hi barbecue_context_null guifg=#40ffff guibg=#282828
	hi barbecue_context_constant guifg=#40ffff guibg=#282828
	hi barbecue_context_key guifg=#40ffff guibg=#282828
	hi barbecue_context_operator guifg=#40ffff guibg=#282828
	hi barbecue_separator guifg=LightGrey guibg=#282828
	hi barbecue_context_object guifg=#40ffff guibg=#282828
	hi barbecue_context_type_parameter guifg=#40ffff guibg=#282828
	hi barbecue_dirname gui=italic,bold guifg=LightGrey guibg=#282828
	hi barbecue_context_array guifg=#40ffff guibg=#282828
	hi barbecue_context_field guifg=#40ffff guibg=#282828
	]])
end

return spec

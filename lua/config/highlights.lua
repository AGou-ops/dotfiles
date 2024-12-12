local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

hi('Comment', { fg = '#928374', italic = false })
hi('GitSignsCurrentLineBlame', { fg = '#928374', italic = true })

-- Treesitter
hi('TSTYPE', { fg = '#D1A863' })
hi('TSTypeDefinition', { fg = '#D1A863' })
hi('@module', { fg = '#D1A863' })
-- Treesitter keyword
local keyword_groups = { 'TSKeywordFunction', 'TSKeywordReturn', 'TSRepeat', 'TSConditional' }
for _, group in ipairs(keyword_groups) do
    hi(group, { fg = '#ea6962', italic = true })
end

hi('TreesitterContext', { fg = '#ddc7a1', bg = '#3c3836' })
hi('NormalFloat', { fg = '#ddc7a1', bg = '#1E2021' })
hi('FloatBorder', { fg = '#a9b665', bg = '#1E2021' })
hi('lualine_c_inactive', { fg = '#ddc7a1', bg = '#3c3836', italic = true })
hi('Pmenu', { fg = '#ddc7a1', bg = '#1E2021' })
hi('MatchParen', { bg = '#928374' })
hi('DiagnosticError', { fg = 'Red' })
hi('DiagnosticWarn', { fg = 'Orange' })
hi('DiagnosticHint', { fg = 'LightGrey' })
hi('Goplements', { fg = 'LightGrey', bg = '#333e34', italic = true })

-- NvimTree
hi('NvimTreeDiagnosticWarnIcon', { fg = 'Orange' })
hi('NvimTreeDiagnosticInfoIcon', { fg = '#7daea3' })

-- Snacks
local snacks_colors = {
    info = '#7daea3',
    warn = 'Orange',
    error = 'Red',
}

for _, level in ipairs({ 'Info', 'Warn', 'Error' }) do
    local color = snacks_colors[level:lower()]
    hi('SnacksNotifierBorder' .. level, { fg = color })
    hi('SnacksNotifierTitle' .. level, { fg = color })
end

hi('SnacksInputNormal', { fg = '#ddc7a1' })
hi('SnacksInputBorder', { fg = '#a9b665' })
hi('SnacksInputTitle', { fg = '#e78a4e', bold = true })

-- LspInlayHint
vim.api.nvim_set_hl(0, 'LspInlayHint', { link = 'Comment' })

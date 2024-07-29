vim.cmd([[
" ========= custom highlight group(buildin & Treesitter) settings =======
hi Comment cterm=NONE ctermfg=245 gui=NONE guifg=#928374
hi GitSignsCurrentLineBlame ctermfg=245 gui=italic guifg=#928374

" hi TSKeyword ctermfg=167 gui=italic guifg=#ea6962
hi TSTYPE ctermfg=3 guifg=#D1A863
hi TSTypeDefinition ctermfg=3 guifg=#D1A863
hi @module ctermfg=3 guifg=#D1A863
hi TSKeywordFunction ctermfg=167 gui=italic guifg=#ea6962
hi TSKeywordReturn ctermfg=167 gui=italic guifg=#ea6962
hi TSRepeat ctermfg=167 gui=italic guifg=#ea6962
hi TSConditional ctermfg=167 gui=italic guifg=#ea6962
hi TreesitterContext ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#3c3836
hi NormalFloat ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#1E2021
hi FloatBorder ctermfg=142 guifg=#a9b665 guibg=#1E2021
" hi InclineNormal ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
hi lualine_c_inactive ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
" hi FocusedSymbol cterm=italic ctermfg=4 ctermbg=11 gui=bold,italic guifg=#181A1A guibg=#77814C
" hi ErrorText cterm=undercurl ctermbg=52 gui=italic guibg=#442e2d guisp=#ea6962
hi Pmenu ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#1E2021
hi link LspInlayHint Comment
hi MatchParen ctermbg=6 guibg=#928374

hi DiagnosticError ctermfg=1 guifg=Red
hi DiagnosticWarn ctermfg=3 guifg=Orange
hi DiagnosticHint ctermfg=7 guifg=LightGrey
hi Goplements ctermfg=7 ctermbg=22 gui=italic guifg=LightGrey guibg=#333e34

" ------------------
" TEST hl group, don't use.
" undercurl support: https://wezfurlong.org/wezterm/faq.html#how-do-i-enable-undercurl-curly-underlines
hi Foo cterm=undercurl ctermbg=52 gui=undercurl guibg=#543937 guisp=#ea6962 guifg=Red
" ------------------
]])

if !exists('g:colors_name') || g:colors_name !=# 'gruvbox-material'
    finish
endif
if index(g:gruvbox_material_loaded_file_types, 'mason') ==# -1
    call add(g:gruvbox_material_loaded_file_types, 'mason')
else
    finish
endif
let s:configuration = gruvbox_material#get_configuration()
let s:palette = gruvbox_material#get_palette(s:configuration.background, s:configuration.foreground, s:configuration.colors_override)
" syn_begin: mason {{{
" https://github.com/williamboman/mason.nvim
call gruvbox_material#highlight('MasonHeader', s:palette.bg0, s:palette.red, 'bold')
call gruvbox_material#highlight('MasonHeaderSecondary', s:palette.bg0, s:palette.orange, 'bold')
highlight! link MasonHighlight Green
highlight! link MasonHighlightSecondary Yellow
call gruvbox_material#highlight('MasonHighlightBlock', s:palette.bg0, s:palette.orange)
call gruvbox_material#highlight('MasonHighlightBlockBold', s:palette.bg0, s:palette.orange, 'bold')
call gruvbox_material#highlight('MasonHighlightBlockSecondary', s:palette.bg0, s:palette.red)
call gruvbox_material#highlight('MasonHighlightBlockBoldSecondary', s:palette.bg0, s:palette.red, 'bold')
call gruvbox_material#highlight('MasonMuted', s:palette.grey0, s:palette.none)
call gruvbox_material#highlight('MasonMutedBlock', s:palette.bg0, s:palette.grey0)
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:

if !exists('g:colors_name') || g:colors_name !=# 'gruvbox-material'
    finish
endif
if index(g:gruvbox_material_loaded_file_types, 'neotest-summary') ==# -1
    call add(g:gruvbox_material_loaded_file_types, 'neotest-summary')
else
    finish
endif
let s:configuration = gruvbox_material#get_configuration()
let s:palette = gruvbox_material#get_palette(s:configuration.background, s:configuration.foreground, s:configuration.colors_override)
" syn_begin: neotest-summary {{{
" https://github.com/nvim-neotest/neotest
if has('nvim')
highlight! link NeotestNamespace Purple
highlight! link NeotestFile Blue
highlight! link NeotestDir Directory
highlight! link NeotestIndent NonText
call gruvbox_material#highlight('NeotestExpandMarker', s:palette.bg5, s:palette.none)
highlight! link NeotestAdapterName Red
highlight! link NeotestMarked Orange
highlight! link NeotestTarget Red
endif
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:

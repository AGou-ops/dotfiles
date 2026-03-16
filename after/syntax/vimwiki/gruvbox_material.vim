if !exists('g:colors_name') || g:colors_name !=# 'gruvbox-material'
    finish
endif
if index(g:gruvbox_material_loaded_file_types, 'vimwiki') ==# -1
    call add(g:gruvbox_material_loaded_file_types, 'vimwiki')
else
    finish
endif
let s:configuration = gruvbox_material#get_configuration()
let s:palette = gruvbox_material#get_palette(s:configuration.background, s:configuration.foreground, s:configuration.colors_override)
" syn_begin: vimwiki {{{
call gruvbox_material#highlight('VimwikiHeader1', s:palette.red, s:palette.none, 'bold')
call gruvbox_material#highlight('VimwikiHeader2', s:palette.orange, s:palette.none, 'bold')
call gruvbox_material#highlight('VimwikiHeader3', s:palette.yellow, s:palette.none, 'bold')
call gruvbox_material#highlight('VimwikiHeader4', s:palette.green, s:palette.none, 'bold')
call gruvbox_material#highlight('VimwikiHeader5', s:palette.blue, s:palette.none, 'bold')
call gruvbox_material#highlight('VimwikiHeader6', s:palette.purple, s:palette.none, 'bold')
call gruvbox_material#highlight('VimwikiLink', s:palette.blue, s:palette.none, 'underline')
call gruvbox_material#highlight('VimwikiItalic', s:palette.none, s:palette.none, 'italic')
call gruvbox_material#highlight('VimwikiBold', s:palette.none, s:palette.none, 'bold')
call gruvbox_material#highlight('VimwikiUnderline', s:palette.none, s:palette.none, 'underline')
highlight! link VimwikiList Red
highlight! link VimwikiTag Aqua
highlight! link VimwikiCode Green
highlight! link VimwikiHR Yellow
highlight! link VimwikiHeaderChar Grey
highlight! link VimwikiMarkers Grey
highlight! link VimwikiPre Green
highlight! link VimwikiPreDelim Green
highlight! link VimwikiNoExistsLink Red
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:

if !exists('g:colors_name') || g:colors_name !=# 'gruvbox-material'
    finish
endif
if index(g:gruvbox_material_loaded_file_types, 'octo') ==# -1
    call add(g:gruvbox_material_loaded_file_types, 'octo')
else
    finish
endif
let s:configuration = gruvbox_material#get_configuration()
let s:palette = gruvbox_material#get_palette(s:configuration.background, s:configuration.foreground, s:configuration.colors_override)
" syn_begin: octo {{{
" https://github.com/pwntester/octo.nvim
call gruvbox_material#highlight('OctoViewer', s:palette.bg0, s:palette.blue)
call gruvbox_material#highlight('OctoGreenFloat', s:palette.green, s:palette.bg3)
call gruvbox_material#highlight('OctoRedFloat', s:palette.red, s:palette.bg3)
call gruvbox_material#highlight('OctoPurpleFloat', s:palette.purple, s:palette.bg3)
call gruvbox_material#highlight('OctoYellowFloat', s:palette.yellow, s:palette.bg3)
call gruvbox_material#highlight('OctoBlueFloat', s:palette.blue, s:palette.bg3)
call gruvbox_material#highlight('OctoGreyFloat', s:palette.grey1, s:palette.bg3)
call gruvbox_material#highlight('OctoBubbleGreen', s:palette.bg0, s:palette.green)
call gruvbox_material#highlight('OctoBubbleRed', s:palette.bg0, s:palette.red)
call gruvbox_material#highlight('OctoBubblePurple', s:palette.bg0, s:palette.purple)
call gruvbox_material#highlight('OctoBubbleYellow', s:palette.bg0, s:palette.yellow)
call gruvbox_material#highlight('OctoBubbleBlue', s:palette.bg0, s:palette.blue)
call gruvbox_material#highlight('OctoBubbleGrey', s:palette.bg0, s:palette.grey1)
highlight! link OctoGreen Green
highlight! link OctoRed Red
highlight! link OctoPurple Purple
highlight! link OctoYellow Yellow
highlight! link OctoBlue Blue
highlight! link OctoGrey Grey
highlight! link OctoBubbleDelimiterGreen Green
highlight! link OctoBubbleDelimiterRed Red
highlight! link OctoBubbleDelimiterPurple Purple
highlight! link OctoBubbleDelimiterYellow Yellow
highlight! link OctoBubbleDelimiterBlue Blue
highlight! link OctoBubbleDelimiterGrey Grey
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:

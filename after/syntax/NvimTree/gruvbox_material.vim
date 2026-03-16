if !exists('g:colors_name') || g:colors_name !=# 'gruvbox-material'
    finish
endif
if index(g:gruvbox_material_loaded_file_types, 'NvimTree') ==# -1
    call add(g:gruvbox_material_loaded_file_types, 'NvimTree')
else
    finish
endif
let s:configuration = gruvbox_material#get_configuration()
let s:palette = gruvbox_material#get_palette(s:configuration.background, s:configuration.foreground, s:configuration.colors_override)
" syn_begin: NvimTree {{{
" https://github.com/kyazdani42/nvim-tree.lua
if !s:configuration.transparent_background
  call gruvbox_material#highlight('NvimTreeNormal', s:palette.fg0, s:palette.bg_dim)
  call gruvbox_material#highlight('NvimTreeEndOfBuffer', s:palette.bg_dim, s:palette.bg_dim)
  call gruvbox_material#highlight('NvimTreeVertSplit', s:palette.bg0, s:palette.bg0)
  call gruvbox_material#highlight('NvimTreeCursorLine', s:palette.none, s:palette.bg0)
endif
highlight! link NvimTreeSymlink Fg
highlight! link NvimTreeFolderName Green
highlight! link NvimTreeRootFolder Grey
highlight! link NvimTreeFolderIcon Orange
highlight! link NvimTreeEmptyFolderName Green
highlight! link NvimTreeOpenedFolderName Green
highlight! link NvimTreeExecFile Fg
highlight! link NvimTreeOpenedHL Fg
highlight! link NvimTreeSpecialFile Fg
highlight! link NvimTreeImageFile Fg
highlight! link NvimTreeIndentMarker Grey
highlight! link NvimTreeGitDirtyIcon Yellow
highlight! link NvimTreeGitStagedIcon Blue
highlight! link NvimTreeGitMergeIcon Orange
highlight! link NvimTreeGitRenamedIcon Purple
highlight! link NvimTreeGitNewIcon Aqua
highlight! link NvimTreeGitDeletedIcon Red
highlight! link NvimTreeLspDiagnosticsError RedSign
highlight! link NvimTreeLspDiagnosticsWarning YellowSign
highlight! link NvimTreeLspDiagnosticsInformation BlueSign
highlight! link NvimTreeLspDiagnosticsHint PurpleSign
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:

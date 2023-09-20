local M = {
    'kevinhwang91/rnvimr',
    event = 'VeryLazy',
    enabled = false,
    keys = {
        {
            '<leader>fF',
            function()
                vim.cmd('RnvimrToggle')
            end,
            desc = 'Toggle Rnvimr',
        },
    },
}

function M.config()
    vim.cmd([[
    " Hide the files included in gitignore
    let g:rnvimr_hide_gitignore = 0
    " Change the border's color
    let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
    " Add a shadow window, value is equal to 100 will disable shadow
    let g:rnvimr_shadow_winblend = 70
    " Draw border with both
    let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']
    " Link CursorLine into RnvimrNormal highlight in the Floating window
    highlight link RnvimrNormal CursorLine

    " Map Rnvimr action
    let g:rnvimr_action = {
        \ '<C-t>': 'NvimEdit tabedit',
        \ '<C-x>': 'NvimEdit split',
        \ '<C-v>': 'NvimEdit vsplit',
        \ 'gw': 'JumpNvimCwd',
        \ 'yw': 'EmitRangerCwd'
        \ }

        " Add views for Ranger to adapt the size of floating window
        let g:rnvimr_ranger_views = [
        \ {'minwidth': 90, 'ratio': []},
        \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
        \ {'maxwidth': 49, 'ratio': [1]}
        \ ]

        " Customize the initial layout
        let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.75 * &columns)),
            \ 'height': float2nr(round(0.75 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }

    ]])
end

return M

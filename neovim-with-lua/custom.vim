" Other vim-script settings
" ============================  hrsh7th/vim-searchx settings  ============================ 
" " Overwrite / and ?.
nnoremap ? <Cmd>call searchx#start({ 'dir': 0 })<CR>
nnoremap / <Cmd>call searchx#start({ 'dir': 1 })<CR>
xnoremap ? <Cmd>call searchx#start({ 'dir': 0 })<CR>
xnoremap / <Cmd>call searchx#start({ 'dir': 1 })<CR>
cnoremap ; <Cmd>call searchx#select()<CR>

" Move to next/prev match.
nnoremap N <Cmd>call searchx#prev_dir()<CR>
nnoremap n <Cmd>call searchx#next_dir()<CR>
xnoremap N <Cmd>call searchx#prev_dir()<CR>
xnoremap n <Cmd>call searchx#next_dir()<CR>

nnoremap <C--> <Cmd>call searchx#prev()<CR>
nnoremap <C-=> <Cmd>call searchx#next()<CR>
xnoremap <C--> <Cmd>call searchx#prev()<CR>
xnoremap <C-=> <Cmd>call searchx#next()<CR>
cnoremap <C--> <Cmd>call searchx#prev()<CR>
cnoremap <C-=> <Cmd>call searchx#next()<CR>
"
" Clear highlights
nnoremap <C-x> <Cmd>call searchx#clear()<CR>

let g:searchx = {}

" Auto jump if the recent input matches to any marker.
let g:searchx.auto_accept = v:true

" The scrolloff value for moving to next/prev.
let g:searchx.scrolloff = &scrolloff

" To enable scrolling animation.
let g:searchx.scrolltime = 500

" To enable auto nohlsearch after cursor is moved
let g:searchx.nohlsearch = {}
let g:searchx.nohlsearch.jump = v:true

" Marker characters.
let g:searchx.markers = split('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '.\zs')

" Convert search pattern.
function g:searchx.convert(input) abort
  if a:input !~# '\k'
    return '\V' .. a:input
  endif
  return a:input[0] .. substitute(a:input[1:], '\\\@<! ', '.\\{-}', 'g')
endfunction

" ============================  hrsh7th/vim-eft settings  ============================ 
  nmap ; <Plug>(eft-repeat)
  xmap ; <Plug>(eft-repeat)
  omap ; <Plug>(eft-repeat)

  nmap f <Plug>(eft-f)
  xmap f <Plug>(eft-f)
  omap f <Plug>(eft-f)
  nmap F <Plug>(eft-F)
  xmap F <Plug>(eft-F)
  omap F <Plug>(eft-F)
  
  nmap t <Plug>(eft-t)
  xmap t <Plug>(eft-t)
  omap t <Plug>(eft-t)
  nmap T <Plug>(eft-T)
  xmap T <Plug>(eft-T)
  omap T <Plug>(eft-T)

  " Disable highlight
let g:eft_highlight = {}

" Custom highlight
let g:eft_highlight = {
\   '1': {
\     'highlight': 'EftChar',
\     'allow_space': v:true,
\     'allow_operator': v:true,
\   },
\   '2': {
\     'highlight': 'EftSubChar',
\     'allow_space': v:false,
\     'allow_operator': v:false,
\   },
\   'n': {
\     'highlight': 'EftSubChar',
\     'allow_space': v:false,
\     'allow_operator': v:false,
\   }
\ }

" You can pick your favorite strategies.
let g:eft_index_function = {
\   'head': function('eft#index#head'),
\   'tail': function('eft#index#tail'),
\   'space': function('eft#index#space'),
\   'camel': function('eft#index#camel'),
\   'symbol': function('eft#index#symbol'),
\ }

" You can use the below function like native `f`
let g:eft_index_function = {
\   'all': { -> v:true },
\ }

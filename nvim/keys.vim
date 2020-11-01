" WichKey configuration
set timeoutlen=100

" Leader key
call which_key#register('<Space>', "g:leader_which_key_map")
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:leader_which_key_map = {}

nnoremap <leader>o :ProjectFiles<CR> 
let g:leader_which_key_map.o = 'Open a project file in a new buffer'

nnoremap <leader>O :Files<CR>
let g:leader_which_key_map.O = 'Open a local file in a new buffer'

nnoremap <leader>c :ColorHighlight<CR>
let g:leader_which_key_map.c = 'Colorize rgba literals'

nnoremap <leader>f :Format<CR>
let g:leader_which_key_map.f = 'Format file'

nnoremap <leader>F :Fold<CR>
let g:leader_which_key_map.f = 'Fold statement'

nmap <leader>r  <Plug>(coc-fix-current)
let g:leader_which_key_map.r = 'Quick fix problem'


nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
let g:leader_which_key_map.d = 'Show diagnostics'

nnoremap <silent> <space>s  :<C-u>CocList outline<cr>
let g:leader_which_key_map.s = "Search for symbol in current buffer"

nnoremap <silent> <space>S  :<C-u>CocList -I symbols<cr>
let g:leader_which_key_map.S = "Search for symbol in project"

" Buffers
call which_key#register(',', "g:comma_which_key_map")
nnoremap <silent> , :WhichKey ','<CR>
let g:comma_which_key_map = {}

nnoremap ,n :bn<CR>
let g:comma_which_key_map.n = 'Next buffer'

nnoremap ,l :bp<CR>
let g:comma_which_key_map.l = 'Last buffer'

nnoremap ,c :bdelete<CR>
let g:comma_which_key_map.c = 'Close buffer'

" Goto
call which_key#register('g', "g:g_which_key_map")
nnoremap <silent> g :WhichKey 'g'<CR>
let g:g_which_key_map = {}

nmap <silent> gd <Plug>(coc-definition)
let g:g_which_key_map.d = "Go to definition"

nmap <silent> gy <Plug>(coc-type-definition)
let g:g_which_key_map.y = "Go to type definition"

nmap <silent> gi <Plug>(coc-implementation)
let g:g_which_key_map.i = "Go to implementation"

nmap <silent> gr <Plug>(coc-references)
let g:g_which_key_map.r = "Go to references"

nmap <silent> gld <Plug>(coc-diagnostic-prev)
let g:g_which_key_map.ld = "Go to last diagnostic"

nmap <silent> gnd <Plug>(coc-diagnostic-next)
let g:g_which_key_map.nd = "Go to next diagnostic"

" Rename
nmap <leader>rn <Plug>(coc-rename)

" Move lines
nmap M :m +1<CR>
nmap m :m -2<CR>

" Open undo tree
nnoremap U :UndotreeShow<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


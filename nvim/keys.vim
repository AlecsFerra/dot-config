" WichKey configuration
set timeoutlen=0

let mapleader = ' ' " Leader key, used for commands

" Leader key
call which_key#register('<Space>', "g:leader_which_key_map")
nmap <silent> <leader> :WhichKey '<Space>'<CR>
vmap <silent> <leader> :WhichKey '<Space>'<CR>
let g:leader_which_key_map = {}

nmap <silent> <leader>o :ProjectFiles<CR> 
let g:leader_which_key_map.o = 'Open a project file in a new buffer'

nmap <silent> <leader>O :Files<CR>
let g:leader_which_key_map.O = 'Open a local file in a new buffer'

nmap <silent> <leader>c :ColorHighlight<CR>
let g:leader_which_key_map.c = 'Colorize rgba literals'

nmap <silent> <leader>fm :Format<CR>
let g:leader_which_key_map.fm = 'Format file'

nmap <silent> <leader>F :Fold<CR>
let g:leader_which_key_map.F = 'Fold statement'

nmap <silent> <leader>qf <Plug>(coc-fix-current)
let g:leader_which_key_map.qf = 'Quick fix problem'

nmap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
let g:leader_which_key_map.d = 'Show diagnostics'

nmap <silent> <leader>s  :<C-u>CocList outline<cr>
let g:leader_which_key_map.s = "Search for symbol in current buffer"

nmap <silent> <leader>S  :<C-u>CocList -I symbols<cr>
let g:leader_which_key_map.S = "Search for symbol in project"

nmap <silent> <leader>rn <Plug>(coc-rename)
let g:leader_which_key_map.rn = "Rename symbol"

let g:leader_which_key_map.r = { 'name': 'which_key_ignore' }
let g:leader_which_key_map.q = { 'name': 'which_key_ignore' }
let g:leader_which_key_map.f = { 'name': 'which_key_ignore' }

" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" let g:leader_which_key_map.a = 'Open action menu'

" Buffers
call which_key#register(',', "g:comma_which_key_map")
nmap <silent> , :WhichKey ','<CR>
let g:comma_which_key_map = {}

nmap ,n :bn<CR>
let g:comma_which_key_map.n = 'Next buffer'

nmap ,l :bp<CR>
let g:comma_which_key_map.l = 'Last buffer'

nmap ,c :bdelete<CR>
let g:comma_which_key_map.c = 'Close buffer'

" Goto
call which_key#register('g', "g:g_which_key_map")
nmap <silent> g :WhichKey 'g'<CR>
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

nmap <silent> gg :1<CR>
let g:g_which_key_map.g = "Go to top" 

" Move lines
nmap M :m +1<CR>
nmap m :m -2<CR>

" Open undo tree
nmap U :UndotreeShow<CR>

" Use K to show documentation in preview window.
nmap <silent> K :call <SID>show_documentation()<CR>

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

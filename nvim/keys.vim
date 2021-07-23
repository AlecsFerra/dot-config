
nmap <silent> <leader>o :ProjectFiles<CR> 
nmap <silent> <leader>O :Files<CR>

map <silent> <leader>e <Plug>(easymotion-overwin-w)

" Move lines
nmap M :m +1<CR>
nmap m :m -2<CR>

" Colori RGB
nmap <silent> <leader>c :ColorHighlight<CR>

" Tabs
map <silent> gt :bnext<CR>
map <silent> gT :bprev<CR>

" Open undo tree
nmap U :UndotreeShow<CR>

function! Compe_select_confirm() abort
  if !exists('*complete_info')
    throw 'compe#_select_confirm requires complete_info function to work'
  endif
  let selected = complete_info()['selected']
  if selected != -1
     return compe#confirm()
  elseif pumvisible()
     call feedkeys("\<down>\<cr>")
     return compe#confirm()
  endif
  return ''
endfunction

inoremap <silent><expr> <cr> pumvisible() ? Compe_select_confirm() : '<cr>'

command It :set spell spelllang=it
command En :set spell spelllang=En

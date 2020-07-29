
let mapleader = ' '

call plug#begin('/home/alecs/.local/share/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'dylanaraps/wal.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

Plug 'mbbill/undotree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'unblevable/quick-scope'

Plug 'chrisbra/Colorizer'

Plug 'vim-airline/vim-airline'

Plug 'frazrepo/vim-rainbow'

call plug#end()

syntax on
set number relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set noswapfile
set nobackup
set undodir=/home/alecs/.cache/nvim/undodir
set undofile
set incsearch
set colorcolumn=80
set updatetime=50
set cmdheight=2
set autochdir
set showtabline=2


let g:python3_host_prog = '/usr/bin/python3'

let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1

let g:rainbow_active = 1

" Open File Finder
let g:fzf_buffers_jump = 1
let g:fzf_action = {
    \ 'enter': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
function! s:find_files()
    let git_dir = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    if git_dir != ''
        execute 'GFiles' git_dir
    else
        execute 'Files'
    endif
endfunction " If a git root is found call GFiles on it else call Files on .
command! ProjectFiles execute s:find_files()
nmap <leader>p :ProjectFiles<CR>

" Switch windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>m :! echo % <bar> entr pandoc % -o %.pdf & <CR>

" Open Undo Tree
nnoremap <leader>u :UndotreeShow<CR>

colorscheme wal
"if (has("termguicolors"))
"  set termguicolors
"endif

exec 'source' expand('~') . '/.config/nvim/coc.vim'

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()


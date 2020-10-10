
let mapleader = ' '

call plug#begin('/home/alecs/.local/share/nvim/plugged')

Plug 'dylanaraps/wal.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

Plug 'mbbill/undotree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'unblevable/quick-scope'

Plug 'chrisbra/Colorizer'

Plug 'vim-airline/vim-airline'

Plug 'frazrepo/vim-rainbow'

Plug 'easymotion/vim-easymotion'

Plug 'edwinb/idris2-vim'

Plug 'jiangmiao/auto-pairs'

Plug 'liuchengxu/vim-which-key'

Plug 'justinmk/vim-sneak'

Plug 'tpope/vim-sleuth'

Plug 'sheerun/vim-polyglot'

Plug 'ryanoasis/vim-devicons'

Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}

Plug 'rust-lang/rust.vim'

Plug 'arthurxavierx/vim-unicoder'

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
set iskeyword+=-
set formatoptions-=cro
set clipboard=unnamedplus
set noshowmode
set mouse=a
set hidden

cmap w!! w !sudo tee %

let g:python3_host_prog = '/usr/bin/python3'

let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1

let g:rainbow_active = 1

let g:unicoder_exclude_filetypes = ['tex', 'latex']

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
nnoremap <leader>i :ProjectFiles<CR>

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

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

set timeoutlen=500

let g:clang_format#auto_format=1

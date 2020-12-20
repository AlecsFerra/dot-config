call plug#begin('/home/alecs/.local/share/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dylanaraps/wal.vim' " PyWal Colorschemes

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }} " Fuzzy finder (used in open buffer command)
Plug 'junegunn/fzf.vim'                            " Key combination <leader> o

Plug 'mbbill/undotree' " Open a history to undo/redo a bunch of modification
                       " Key combination U
		       
Plug 'liuchengxu/vim-which-key' " Show all combinations when key is pressed

Plug 'vim-airline/vim-airline' " Better airline
Plug 'pacha/vem-tabline'

Plug 'chrisbra/Colorizer' " Colorize rgb colors, Key combination <leader> c

Plug 'frazrepo/vim-rainbow' " Colorize parens
Plug 'jiangmiao/auto-pairs' " Auto close parens

Plug 'ryanoasis/vim-devicons' " Icons

Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP engine
Plug 'tenfyzhong/vim-gencode-cpp' " Generate c++ defs
Plug 'lervag/vimtex'
Plug 'idris-hackers/idris-vim'
Plug 'derekelkins/agda-vim'

Plug 'easymotion/vim-easymotion'

call plug#end()

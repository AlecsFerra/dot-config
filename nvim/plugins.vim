call plug#begin('/home/alecs/.local/share/nvim/plugged')

Plug 'dylanaraps/wal.vim' " PyWal Colorschemes

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }} " Fuzzy finder (used in open buffer command)
Plug 'junegunn/fzf.vim'                            " Key combination <leader> o

Plug 'mbbill/undotree' " Open a history to undo/redo a bunch of modification
                       " Key combination U
		       
Plug 'liuchengxu/vim-which-key' " Show all combinations when key is pressed

Plug 'vim-airline/vim-airline' " Better airline
Plug 'bling/vim-bufferline'    " Add support for buffers in the airline

Plug 'chrisbra/Colorizer' " Colorize rgb colors, Key combination <leader> c

Plug 'frazrepo/vim-rainbow' " Colorize parens
Plug 'jiangmiao/auto-pairs' " Auto close parens

Plug 'arthurxavierx/vim-unicoder' " Inser unicode chars

Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP engine

call plug#end()

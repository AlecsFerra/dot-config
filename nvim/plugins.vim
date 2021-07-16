call plug#begin('/home/alecs/.local/share/nvim/plugged')

Plug 'dylanaraps/wal.vim'     " PyWal Colorschemes
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'pacha/vem-tabline'      " Open tabs

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }} " Fuzzy finder (used in open buffer command)
Plug 'junegunn/fzf.vim'                            " Key combination <leader> o

Plug 'mbbill/undotree'

Plug 'easymotion/vim-easymotion'

Plug 'chrisbra/Colorizer'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'

call plug#end()

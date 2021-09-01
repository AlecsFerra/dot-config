call plug#begin('/home/alecs/.local/share/nvim/plugged')

Plug 'dylanaraps/wal.vim'     " PyWal Colorschemes
Plug 'joshdick/onedark.vim'

Plug 'ryanoasis/vim-devicons' " Icons
Plug 'pacha/vem-tabline'      " Open tabs
Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }} " Fuzzy finder (used in open buffer command)
Plug 'junegunn/fzf.vim'                            " Key combination <leader> o

Plug 'mbbill/undotree'

Plug 'easymotion/vim-easymotion'

Plug 'chrisbra/Colorizer'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kosayoda/nvim-lightbulb'
Plug 'folke/lsp-colors.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'sheerun/vim-polyglot'

Plug 'edwinb/idris2-vim'

Plug 'joom/latex-unicoder.vim'

Plug 'jiangmiao/auto-pairs'

call plug#end()

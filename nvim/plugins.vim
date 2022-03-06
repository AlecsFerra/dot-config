call plug#begin('$HOME/.local/share/nvim/plugged')

Plug 'dylanaraps/wal.vim'     " PyWal Colorschemes
Plug 'joshdick/onedark.vim'

Plug 'ryanoasis/vim-devicons' " Icons
Plug 'pacha/vem-tabline'      " Open tabs
Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }} " Fuzzy finder (used in open buffer command)
Plug 'junegunn/fzf.vim'                            " Key combination <leader> o

Plug 'mbbill/undotree'

Plug 'easymotion/vim-easymotion'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kosayoda/nvim-lightbulb'
Plug 'folke/lsp-colors.nvim'
Plug 'ray-x/lsp_signature.nvim'
"Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'

" Lang specific
Plug 'edwinb/idris2-vim'
Plug 'wlangstroth/vim-racket'

Plug 'joom/latex-unicoder.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'chrisbra/Colorizer'

call plug#end()

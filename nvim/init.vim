
let config_path = expand('~') . '/.config/nvim/' " Config directory

" Load plugins declaration
exec 'source' config_path . 'plugins.vim'
exec 'source' config_path . 'fzf.vim'
exec 'source' config_path . 'undotree.vim'
exec 'source' config_path . 'airline.vim'
exec 'source' config_path . 'keys.vim'
exec 'source' config_path . 'unicoder.vim'
exec 'source' config_path . 'rainbow.vim'
exec 'source' config_path . 'coc.vim'

" Set a colorscheme
colorscheme wal

" General settings
syntax on                   " Turn on syntax highlighting

set number relativenumber   " Show numbers relative to cursor position

set tabstop=2 softtabstop=2 " Tab vs spaces related stuff
set shiftwidth=2
set smarttab
set smartindent

set smartcase								" Search ignore case 
set incsearch								" Show mathces while typing

set noswapfile							" Remove stupid backupfiles
set nobackup

set colorcolumn=80					" Column for code

set cmdheight=2							" Make command zone 2 chars high

set iskeyword+=-						" Add - to word components

set clipboard=unnamedplus   " Share clipboard with system

set mouse=a									" Enable mouse

set hidden									" Allow new buffer open when unsaved

local options = {
  -- Random
  clipboard    = "unnamedplus",
  completeopt  = { "menuone", "noselect" },
  conceallevel = 0,
  shell        = "zsh",
  shellcmdflag = "-ic",
  updatetime   = 300,

  -- Style
  termguicolors  = true,
  colorcolumn    = "81",
  cmdheight      = 2,
  showmode       = false,
  showtabline    = 2,
  cursorline     = true,
  relativenumber = true,
  --number         = true,
  laststatus     = 3,
  numberwidth    = 3,
  signcolumn     = "yes",
  wrap           = false,
  scrolloff      = 8,
  sidescrolloff  = 8,

  -- Nvim files
  backup       = false,
  swapfile     = false,
  undofile     = true,
  writebackup  = false,
  fileencoding = "utf-8",

  -- Indent
  smartindent = true,
  expandtab   = true,
  tabstop     = 2,
  softtabstop = 2,
  shiftwidth  = 2,
  tw          = 80,

  -- Search
  hlsearch   = true,
  ignorecase = true,
  smartcase  = true,
  incsearch  = true,

  -- Splits
  splitbelow = true,
  splitright = true,

  -- Spell
  spelllang = { "en_us", "it" },
  spell     = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

require "local.plugins"
require "local.impatient"
require "local.colorscheme"
require "local.keymaps"

-- Plugin configs
require "local.treesitter"
require "local.rice"
require "local.colorizer"
require "local.neoscroll"
require "local.todo"
require "local.surround"
require "local.cmp"
require "local.lsp"
require "local.fzf"
require "local.comment"
require "local.dial"

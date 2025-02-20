local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Check if packer is correctly installed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Make packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)

  -- TODO: Comments, Bufferline, Witchkey, numb

  -- Package manager (lua/plugins.lua)
  use "wbthomason/packer.nvim"

  -- Deps
  use "nvim-lua/plenary.nvim"

  -- Colorschemes (lua/colorscheme.lua)
  -- use "dylanaraps/wal.vim"
  use "joshdick/onedark.vim"
  -- use "dracula/vim"
  -- use "andry-dev/nofrils"

  -- Rice (lua/rice.lua)
  use "nvim-lualine/lualine.nvim"
  use "akinsho/bufferline.nvim"

  -- Tree sitter (lua/treesitter.lua)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow" -- Rainbow parens
  -- use "mizlan/iswap.nvim" -- Swap argumetns
  use "windwp/nvim-autopairs" -- Auto pair parens, ecc...
  -- use "windwp/nvim-ts-autotag" -- Auto pair html tags
  -- use "SmiteshP/nvim-gps" -- Show precise location
  -- use "nvim-treesitter/playground" -- Show ast

  -- LSP (lua/lsp/*.lua)
  use "christianchiarulli/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "ray-x/lsp_signature.nvim"
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })


  -- Cmp (lua/cmp.lua)
  use "hrsh7th/nvim-cmp"
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }
  use { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  use { "hrsh7th/cmp-emoji", after = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" }
  use { "f3fora/cmp-spell", after = "nvim-cmp" }

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- Reduce up loading time (lua/impatient.lua)
  use "lewis6991/impatient.nvim"

  -- Highlight colors (lua/colorizer.lua)
  use "norcalli/nvim-colorizer.lua"

  -- Smooth scrolling (lua/neoscroll.lua)
  use "karb94/neoscroll.nvim"

  -- Surround text (lua/surround.lua)
  use "Mephistophiles/surround.nvim"

  -- Comment
  use "folke/todo-comments.nvim" -- Todo management

  -- Fzf (lua/fzf.lua)
  use "ibhagwan/fzf-lua"

  -- Better increments (lua/dial.lua)
  use "monaqa/dial.nvim"

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  -- Misc 0 conf
  use "nvim-lua/popup.nvim" -- Popup api
  use "kyazdani42/nvim-web-devicons" -- Icons
  use "moll/vim-bbye" -- Better buffer closing
  use "mbbill/undotree"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

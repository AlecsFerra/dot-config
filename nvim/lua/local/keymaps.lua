local opts = opts
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move between splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move between buffers
keymap("n", "<C-n>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)
keymap("n", "<C-c>", ":Bdelete<CR>", opts)

-- Move lines
keymap("n", "M", "<Esc>:m .+1<CR>", opts)
keymap("n", "m", "<Esc>:m .-2<CR>", opts)

-- UndoTree
keymap("n", "<leader>u", ":UndotreeShow <CR>", opts)

-- Fzf
keymap("n", "<leader>o", ":FzfLua git_files <CR>", opts)
keymap("n", "<leader>O", ":FzfLua files <CR>", opts)

-- Telescope
local builtin = require 'telescope.builtin'
keymap('n', '<leader>sg', builtin.git_files, opts)
keymap('n', '<leader>sf', builtin.find_files, opts)
keymap('n', '<leader>g', builtin.live_grep, opts)
keymap('n', '<leader>d', builtin.diagnostics, opts)
keymap('n', '<leader>sr', builtin.resume, opts)
keymap('n', '<leader><leader>', builtin.buffers, opts)



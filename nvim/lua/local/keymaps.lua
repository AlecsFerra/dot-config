local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

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
keymap("n", "<C-m>", ":bnext<CR>", opts)
keymap("n", "<C-n>", ":bprevious<CR>", opts)

-- Move lines
keymap("n", "M", "<Esc>:m .+1<CR>", opts)
keymap("n", "m", "<Esc>:m .-2<CR>", opts)

-- UndoTree
keymap("n", "U", ":UndotreeShow <CR>", opts)

-- Fzf
keymap("n", "<leader>O", ":Fzf git_files <CR>", opts)

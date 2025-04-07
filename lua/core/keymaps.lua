local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- Exit insert mode with 'jk' (faster than reaching for Escape)
keymap("i", "jk", "<Esc>", opts)


-- Move by visual lines rather than actual lines when lines wrap
-- This makes navigation more intuitive when dealing with wrapped text
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Window navigation shortcuts
-- Quickly move between split windows using Ctrl + hjkl
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation
-- Navigate between open buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Maintain register when pasting over selection
keymap("v", "p", '"_dP', opts)


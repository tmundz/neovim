-- Core Neovim settings
-- Controls editor behavior, UI elements, and basic functionality

-- Line numbers
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers (helpful for jumps)

-- Indentation
vim.opt.tabstop = 2 -- Number of spaces a tab counts for
vim.opt.shiftwidth = 2 -- Number of spaces for each step of autoindent
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Auto-indent new lines intelligently
vim.opt.autoindent = true -- Copy indent from current line when starting a new line

-- Search behavior
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Override ignorecase when search includes uppercase
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Incremental search (show matches as you type)

-- UI configuration
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.opt.wrap = false -- Don't wrap long lines
vim.opt.cursorline = true -- Highlight the current line
vim.opt.signcolumn = 'yes' -- Always show the sign column (prevents shifting)
vim.opt.scrolloff = 8 -- Min number of lines to keep above/below cursor
vim.opt.sidescrolloff = 8 -- Min number of columns to keep left/right of cursor
vim.opt.showmode = false -- Don't show mode (it will be in statusline)
vim.opt.colorcolumn = '80' -- Or "120" depending on your preference
-- Interface behavior
vim.opt.mouse = 'a' -- Enable mouse in all modes
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.updatetime = 300 -- Faster completion and better UX
vim.opt.timeoutlen = 500 -- Time to wait for a mapped sequence to complete
vim.opt.completeopt = { 'menuone', 'noselect' } -- Better completion experience

-- File handling
vim.opt.swapfile = false -- Don't create swap files
vim.opt.backup = false -- Don't create backup files
vim.opt.undofile = true -- Enable persistent undo history
vim.opt.fileencoding = 'utf-8' -- File encoding

-- Split behavior
vim.opt.splitbelow = true -- Open horizontal splits below current window
vim.opt.splitright = true -- Open vertical splits to the right of current window

-- Misc
-- vim.opt.hidden = true           -- Allow switching buffers without saving
-- vim.opt.confirm = true          -- Confirm before closing unsaved buffers
-- vim.opt.cmdheight = 2           -- More space for messages
--
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
  end,
})

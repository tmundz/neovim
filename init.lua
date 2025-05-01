local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require 'core.global'
-- require("core.autocmd")
require 'core.options'
require 'core.keymaps'

local opts = {
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { 'catppuccin-mocha' },
  },
  rtp = {
    disabled_plugins = {
      'gzip',
      'matchit',
      'matchparen',
      'netrw',
      'netrwPlugin',
      'tarPlugin',
      'tohtml',
      'tutor',
      'zipPlugin',
    },
  },
  change_detection = {
    notify = false,
  },
}

-- Setup lazy.nvim
require('lazy').setup({
  {import = "plugins"},
  {import = "plugins.lsp"}
}, opt)
vim.cmd.colorscheme 'catppuccin-mocha'

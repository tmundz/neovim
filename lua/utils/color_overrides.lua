local M = {}

-- Get catppuccin colors for consistency
local function get_catppuccin_colors()
  local cp = require('catppuccin.palettes').get_palette 'mocha'
  -- These are your custom colors from your catppuccin config
  local custom = {
    base = '#0A0A0F',
    mantle = '#121217',
    crust = '#1A1A22',
    text = '#B8C0CC',
    subtext1 = '#6B7280',
    subtext0 = '#4B5263',
    overlay0 = '#907A9A',
    mauve = '#705A8A',
    flamingo = '#7A5A7A',
    sapphire = '#4A5A8A',
    teal = '#4A6A7A',
    peach = '#6A4A6A',
    red = '#6A3A5A',
    green = '#5A6A6A',
    yellow = '#6A5A4A',
  }

  -- Merge custom colors with the palette
  for k, v in pairs(custom) do
    cp[k] = v
  end

  return cp
end

-- Sets the line colors for vague
function M.vague_line_colors()
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#646477' })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#646477' })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = '#d6d2c8' })
end

function M.my_line_colors()
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#888888', bg = '#1e1e1e' })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#888888', bg = '#1e1e1e' })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = '#d6d2c8' })
end

function M.catppuccin_line_colors()
  local colors = get_catppuccin_colors()
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = colors.subtext1, bg = colors.base })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = colors.subtext1, bg = colors.base })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.overlay0 })
end

function M.zenbones_theme_overrides()
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#888888', bg = '#1e1e1e' })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#888888', bg = '#1e1e1e' })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = '#d6d2c8' })
end

function M.catppuccin_theme_overrides()
  local colors = get_catppuccin_colors()

  vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = colors.red })
  vim.api.nvim_set_hl(0, 'TSComment', { fg = colors.subtext0, gui = nil })
  vim.api.nvim_set_hl(0, 'Visual', { bg = colors.flamingo, fg = colors.base })
  vim.api.nvim_set_hl(0, 'Search', { bg = colors.flamingo, fg = colors.base })
  vim.api.nvim_set_hl(0, 'PmenuSel', { bg = colors.flamingo, fg = colors.base })

  -- Line number highlights
  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = colors.subtext1, bg = colors.base })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = colors.subtext1, bg = colors.base })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.overlay0 })
end

function M.black_metal_theme_overrides()
  vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#912222' })
  vim.api.nvim_set_hl(0, 'TSComment', { fg = '#555555', gui = nil })
  vim.api.nvim_set_hl(0, 'Visual', { bg = '#9b8d7f', fg = '#1e1e1e' })
  vim.api.nvim_set_hl(0, 'Search', { bg = '#9b8d7f', fg = '#1e1e1e' })
  vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#9b8d7f', fg = '#1e1e1e' })

  vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#888888', bg = '#1e1e1e' })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#888888', bg = '#1e1e1e' })
  vim.api.nvim_set_hl(0, 'LineNr', { fg = '#d6d2c8' })
end

function M.catppuccin_status_colors()
  local colors = get_catppuccin_colors()

  local custom_catppuccin = {
    normal = {
      a = { fg = colors.base, bg = colors.mauve, gui = 'bold' },
      b = { fg = colors.text, bg = colors.mantle },
      c = { fg = colors.text, bg = nil },
    },
    insert = {
      a = { fg = colors.base, bg = colors.teal, gui = 'bold' },
      b = { fg = colors.text, bg = colors.mantle },
    },
    visual = {
      a = { fg = colors.base, bg = colors.flamingo, gui = 'bold' },
      b = { fg = colors.text, bg = colors.mantle },
    },
    replace = {
      a = { fg = colors.base, bg = colors.red, gui = 'bold' },
      b = { fg = colors.text, bg = colors.mantle },
    },
    command = {
      a = { fg = colors.base, bg = colors.peach, gui = 'bold' },
      b = { fg = colors.text, bg = colors.mantle },
    },
    inactive = {
      a = { fg = colors.subtext1, bg = nil },
      b = { fg = colors.subtext1, bg = nil },
      c = { fg = colors.subtext1, bg = nil },
    },
  }

  require('lualine').setup {
    options = {
      theme = custom_catppuccin,
    },
  }
end

function M.vague_status_colors()
  local custom_iceberk_dark = require 'lualine.themes.iceberg_dark'
  custom_iceberk_dark.normal.c.bg = nil
  custom_iceberk_dark.inactive.b.bg = nil
  custom_iceberk_dark.inactive.a.bg = nil
  custom_iceberk_dark.inactive.c.bg = nil
  custom_iceberk_dark.insert.a.bg = '#bc96b0'
  custom_iceberk_dark.visual.a.bg = '#787bab'
  custom_iceberk_dark.replace.a.bg = '#a1b3b9'

  require('lualine').setup {
    options = {
      theme = custom_iceberk_dark,
    },
  }
end

-- Sets up custom colors dependent on themes
function M.setup_colorscheme_overrides()
  vim.api.nvim_create_autocmd('ColorScheme', {
    -- so it's fired when used in other autocmds
    nested = true,
    pattern = '*',
    callback = function()
      local colorscheme = vim.g.colors_name
      if colorscheme == 'catppuccin' then
        M.catppuccin_theme_overrides()
        M.catppuccin_status_colors()
      elseif string.find(colorscheme, 'base16') then
        if string.find(colorscheme, 'metal') then
          M.black_metal_theme_overrides()
        end
        M.my_line_colors()
      elseif colorscheme == 'zenburn' then
        M.my_line_colors()
      elseif colorscheme == 'zenbones' then
        M.zenbones_theme_overrides()
      end
    end,
  })
end

-- Setup some commands for manually setting values
vim.api.nvim_create_user_command('MyLine', M.my_line_colors, {})
vim.api.nvim_create_user_command('CatppuccinLine', M.catppuccin_line_colors, {})
vim.api.nvim_create_user_command('CatppuccinStatus', M.catppuccin_status_colors, {})
vim.api.nvim_create_user_command('VagueStatus', M.vague_status_colors, {})
vim.api.nvim_create_user_command('VagueLine', M.vague_line_colors, {})
vim.api.nvim_create_user_command('DefStatus', function()
  require('lualine').setup { options = { theme = 'auto' } }
end, {})

return M

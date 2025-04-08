return {
  'nvim-lualine/lualine.nvim',
  config = function()
    -- Function to get catppuccin colors
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

    -- Create custom lualine theme
    local colors = get_catppuccin_colors()
    local custom_catppuccin = {
      normal = {
        a = { fg = colors.base, bg = colors.mauve, gui = 'bold' },
        b = { fg = colors.text, bg = colors.mantle },
        c = { fg = colors.text, bg = colors.base },
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
        a = { fg = colors.subtext1, bg = colors.mantle },
        b = { fg = colors.subtext1, bg = colors.mantle },
        c = { fg = colors.subtext1, bg = colors.base },
      },
    }

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }
    local filename = {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
    }
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end
    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }
    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      cond = hide_in_width,
    }
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = custom_catppuccin, -- Use the custom theme we created
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}

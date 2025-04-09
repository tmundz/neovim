return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    local mocha = {
      base = '#1A1426', -- Updated to darker black-purple hint (matches Kitty)
      mantle = '#2A1B3D', -- Slightly darker purple for contrast
      crust = '#4B367C', -- Subtle highlight with purple tone
      text = '#F5EBF2', -- Bright text with pink undertone
      subtext1 = '#D1B8CC', -- Bright secondary text with pink cast
      subtext0 = '#B89CB3', -- Bright comments with pink cast
      overlay0 = '#C5B5E0', -- Lighter purple for line numbers
      mauve = '#C080D0', -- Bright mauve (purplish-pink)
      flamingo = '#F5A0C0', -- Bright flamingo (vibrant pink)
      pink = '#FF85B3', -- Vibrant bright pink (focus color)
      sapphire = '#A285D1', -- Bright bluish-purple
      teal = '#A285D1', -- Already set to sapphire for purple emphasis
      peach = '#E099AA', -- Bright peachy pink
      red = '#FF6088', -- Bright vibrant red with pink undertone
      green = '#B0A5E0', -- Changed to a light purple (replacing green for DiffAdd)
      yellow = '#C5B5E0', -- Changed to overlay0 (light purple) for DiagnosticWarn, Debug
    }

    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      transparent_background = true, -- disables setting the background color.
      color_overrides = {
        mocha = mocha,
      },
      custom_highlights = function(colors)
        -- Force override with our custom mocha colors
        local c = mocha

        return {
          -- Syntax Highlighting
          Comment = { fg = c.mauve }, -- Changed to mauve for purple focus
          Constant = { fg = c.sapphire },
          String = { fg = c.mauve },
          Character = { fg = c.mauve },
          Number = { fg = c.sapphire },
          Boolean = { fg = c.sapphire },
          Float = { fg = c.sapphire },
          Identifier = { fg = c.overlay0 }, -- Changed to overlay0 (light purple)
          Function = { fg = c.mauve },
          Statement = { fg = c.mauve }, -- Changed to mauve
          Conditional = { fg = c.mauve }, -- Changed to mauve
          Repeat = { fg = c.mauve }, -- Changed to mauve
          Label = { fg = c.overlay0 }, -- Changed to overlay0
          Operator = { fg = c.text },
          Keyword = { fg = c.overlay0 }, -- Changed to overlay0
          Exception = { fg = c.mauve }, -- Changed to mauve
          PreProc = { fg = c.mauve },
          Include = { fg = c.mauve },
          Define = { fg = c.mauve },
          Macro = { fg = c.mauve },
          PreCondit = { fg = c.mauve },
          Type = { fg = c.sapphire },
          StorageClass = { fg = c.mauve }, -- Changed to mauve
          Structure = { fg = c.sapphire },
          Typedef = { fg = c.sapphire },
          Special = { fg = c.sapphire },
          SpecialChar = { fg = c.sapphire },
          Tag = { fg = c.overlay0 },
          Delimiter = { fg = c.text },
          SpecialComment = { fg = c.mauve }, -- Changed to mauve
          Debug = { fg = c.yellow }, -- Light purple (overlay0)
          Underlined = { style = { 'underline' } },
          Ignore = { fg = c.subtext1 },
          Error = { fg = c.pink }, -- Keep pink for high focus
          Todo = { fg = c.pink }, -- Changed to mauve

          -- Diagnostics
          DiagnosticError = { fg = c.red }, -- Keep pink for high focus
          DiagnosticWarn = { fg = c.yellow }, -- Light purple (overlay0)
          DiagnosticInfo = { fg = c.sapphire },
          DiagnosticHint = { fg = c.mauve },

          -- Diff
          DiffAdd = { fg = c.green }, -- Light purple
          DiffChange = { fg = c.yellow }, -- Light purple (overlay0)
          DiffDelete = { fg = c.red },
          DiffText = { fg = c.sapphire },

          -- UI Elements
          NormalFloat = { bg = c.mantle },
          FloatBorder = { fg = c.mauve }, -- Keep pink for focus
          LineNr = { fg = c.overlay0 },
          CursorLineNr = { fg = c.mauve }, -- Changed to mauve
          CursorLine = { bg = c.mantle },
          Cursor = { fg = c.text, bg = c.mauve }, -- Keep pink for focus
          Visual = { bg = c.mauve, fg = c.base },
          Search = { fg = c.base, bg = c.pink },
          IncSearch = { fg = c.base, bg = c.mauve },
          MatchParen = { fg = c.mauve, style = { 'bold' } }, -- Keep pink for focus
          StatusLine = { fg = c.text, bg = c.mantle },
          StatusLineNC = { fg = c.subtext1, bg = c.mantle },
          TabLine = { fg = c.subtext1, bg = c.base },
          TabLineSel = { fg = c.text, bg = c.mauve },
          TabLineFill = { bg = c.base },
          Pmenu = { fg = c.text, bg = c.mantle },
          PmenuSel = { fg = c.text, bg = c.crust },
          PmenuSbar = { bg = c.mantle },
          PmenuThumb = { bg = c.mauve }, -- Changed to mauve
          CmpBorder = { fg = c.mauve }, -- Changed to mauve
          VertSplit = { fg = c.mauve }, -- Changed to mauve
          Folded = { fg = c.subtext0, bg = c.mantle },
          FoldColumn = { fg = c.mauve }, -- Changed to mauve
          SignColumn = { fg = c.overlay0 },
          ColorColumn = { bg = c.mantle },
          NonText = { fg = c.overlay0 },
          SpecialKey = { fg = c.mauve }, -- Changed to mauve
        }
      end,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        -- Add other integrations as needed
      },
    }
  end,
}

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      transparent_background = true, -- disables setting the background color.
      mocha = {
        base = '#0A0A0F', -- Near-black background
        mantle = '#121217', -- Slightly lighter dark
        crust = '#1A1A22', -- Subtle highlight
        text = '#B8C0CC', -- Cool gray for readable text
        subtext1 = '#6B7280', -- Dim gray for secondary text
        subtext0 = '#4B5263', -- Dim gray for comments
        overlay0 = '#907A9A', -- Lighter purple for overlays
        mauve = '#705A8A', -- Deep muted purple (primary accent)
        flamingo = '#7A5A7A', -- Pinkish-purple (secondary accent)
        sapphire = '#4A5A8A', -- Muted dark blue
        teal = '#4A6A7A', -- Muted teal
        peach = '#6A4A6A', -- Muted dark plum
        red = '#6A3A5A', -- Muted dark reddish-purple
        green = '#5A6A6A', -- Muted dark green
        yellow = '#6A5A4A', -- Muted dark mustard
      },
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.pink },
          Constant = { fg = colors.peach }, -- Muted dark peach for constants
          String = { fg = colors.teal }, -- Muted teal for strings
          Character = { fg = colors.teal }, -- Same as strings
          Number = { fg = colors.peach }, -- Same as constants
          Boolean = { fg = colors.peach }, -- Same as constants
          Float = { fg = colors.peach }, -- Same as constants
          Identifier = { fg = colors.flamingo }, -- Deep muted pink for variables
          Function = { fg = colors.mauve }, -- Purplish-pink for functions
          Statement = { fg = colors.flamingo }, -- Deep muted pink for statements (if, for, etc.)
          Conditional = { fg = colors.flamingo }, -- Same as statements
          Repeat = { fg = colors.flamingo }, -- Same as statements
          Label = { fg = colors.flamingo }, -- Same as statements
          Operator = { fg = colors.text }, -- Cool gray for operators
          Keyword = { fg = colors.flamingo }, -- Deep muted pink for keywords
          Exception = { fg = colors.flamingo }, -- Same as keywords
          PreProc = { fg = colors.mauve }, -- Purplish-pink for preprocessor directives
          Include = { fg = colors.mauve }, -- Same as PreProc
          Define = { fg = colors.mauve }, -- Same as PreProc
          Macro = { fg = colors.mauve }, -- Same as PreProc
          PreCondit = { fg = colors.mauve }, -- Same as PreProc
          Type = { fg = colors.sapphire }, -- Muted dark blue for types
          StorageClass = { fg = colors.sapphire }, -- Same as types
          Structure = { fg = colors.sapphire }, -- Same as types
          Typedef = { fg = colors.sapphire }, -- Same as types
          Special = { fg = colors.peach }, -- Muted dark peach for special characters
          SpecialChar = { fg = colors.peach }, -- Same as special
          Tag = { fg = colors.flamingo }, -- Deep muted pink for tags
          Delimiter = { fg = colors.text }, -- Cool gray for delimiters
          SpecialComment = { fg = colors.subtext0 }, -- Same as comments
          Debug = { fg = colors.yellow }, -- Muted dark yellow for debug
          Underlined = { style = { 'underline' } }, -- Underlined text
          Ignore = { fg = colors.subtext1 }, -- Dim gray for ignored
          Error = { fg = colors.red }, -- Muted dark red for errors
          Todo = { fg = colors.yellow }, -- Muted dark yellow for TODOs

          -- Diagnostics
          DiagnosticError = { fg = colors.red }, -- Muted dark red for errors
          DiagnosticWarn = { fg = colors.yellow }, -- Muted dark yellow for warnings
          DiagnosticInfo = { fg = colors.sapphire }, -- Muted dark blue for info
          DiagnosticHint = { fg = colors.teal }, -- Muted teal for hints

          -- Diff
          DiffAdd = { fg = colors.green }, -- Muted dark green for additions
          DiffChange = { fg = colors.yellow }, -- Muted dark yellow for changes
          DiffDelete = { fg = colors.red }, -- Muted dark red for deletions
          DiffText = { fg = colors.sapphire }, -- Muted dark blue for changed text

          -- UI Elements
          -- Normal = { fg = colors.text, bg = colors.none }, -- Cool gray text, transparent background
          NormalFloat = { bg = colors.mantle }, -- Slightly lighter background for floating windows
          FloatBorder = { fg = colors.subtext1 }, -- Dim gray for floating window borders
          LineNr = { fg = colors.overlay0 }, -- Lighter pink for line numbers
          CursorLineNr = { fg = colors.mauve }, -- Purplish-pink for current line number
          CursorLine = { bg = colors.mantle }, -- Slightly lighter background for current line
          Cursor = { fg = colors.text, bg = colors.flamingo }, -- Deep muted pink cursor
          Visual = { bg = colors.crust }, -- Subtle highlight for visual selection
          Search = { fg = colors.text, bg = colors.flamingo }, -- Deep muted pink for search highlights
          IncSearch = { fg = colors.text, bg = colors.mauve }, -- Purplish-pink for incremental search
          MatchParen = { fg = colors.flamingo, style = { 'bold' } }, -- Deep muted pink for matching parentheses
          StatusLine = { fg = colors.text, bg = colors.mantle }, -- Status line
          StatusLineNC = { fg = colors.subtext1, bg = colors.mantle }, -- Inactive status line
          TabLine = { fg = colors.subtext1, bg = colors.base }, -- Tab line
          TabLineSel = { fg = colors.text, bg = colors.flamingo }, -- Selected tab
          TabLineFill = { bg = colors.base }, -- Tab line fill
          Pmenu = { fg = colors.text, bg = colors.none }, -- Popup menu (transparent background)
          PmenuSel = { fg = colors.text, bg = colors.crust }, -- Selected item in popup menu
          PmenuSbar = { bg = colors.mantle }, -- Popup menu scrollbar
          PmenuThumb = { bg = colors.crust }, -- Popup menu scrollbar thumb
          CmpBorder = { fg = colors.subtext1 }, -- Completion menu border
          VertSplit = { fg = colors.subtext1 }, -- Vertical split line
          Folded = { fg = colors.subtext0, bg = colors.mantle }, -- Folded text
          FoldColumn = { fg = colors.subtext0 }, -- Fold column
          SignColumn = { fg = colors.subtext0 }, -- Sign column
          ColorColumn = { bg = colors.mantle }, -- Color column
          NonText = { fg = colors.subtext1 }, -- Non-text characters
          SpecialKey = { fg = colors.subtext1 }, -- Special keys
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

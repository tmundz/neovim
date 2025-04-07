return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
   config = function()
    require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true, -- disables setting the background color.

    custom_highlights = function(colors)
        return {
            Comment = { fg = colors.pink },
            TabLineSel = { bg = colors.flamingo },
            CmpBorder = { fg = colors.surface2 },
            Pmenu = { bg = colors.none },
        }
    end
    
})
  end,
}

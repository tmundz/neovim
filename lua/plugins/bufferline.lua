return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- set to "tabs" to only show tabpages instead
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal  string,
        close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
        buffer_close_icon = '✗',
        close_icon = '✗',
        path_components = 1, -- Show only the file name without the directory
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        diagnostics = false,
        diagnostics_update_in_insert = false,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        show_tab_indicators = false,
        indicator = {
          -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'none', -- Options: 'icon', 'underline', 'none'
        },
        icon_pinned = '󰐃',
        minimum_padding = 1,
        maximum_padding = 5,
        maximum_length = 15,
        sort_by = 'insert_at_end',
      },
      highlights = {
        -- Background of the entire bufferline
        fill = {
          fg = '#D1B8CC', -- subtext1 for muted text
          bg = '#3C2F5F', -- base
        },
        -- Unselected buffers
        buffer = {
          fg = '#D1B8CC', -- subtext1
          bg = '#2A1B3D', -- mantle
        },
        -- Selected buffer
        buffer_selected = {
          fg = '#F5EBF2', -- text
          bg = '#4B367C', -- crust
          bold = true,
          italic = false,
        },
        -- Separator between buffers
        separator = {
          fg = '#C5B5E0', -- overlay0
          bg = '#2A1B3D', -- mantle
        },
        separator_selected = {
          fg = '#C5B5E0', -- overlay0
          bg = '#4B367C', -- crust
        },
        -- Modified buffer
        modified = {
          fg = '#E099AA', -- peach
          bg = '#2A1B3D', -- mantle
        },
        modified_selected = {
          fg = '#E099AA', -- peach
          bg = '#4B367C', -- crust
        },
        -- Close icon
        close_button = {
          fg = '#FF6088', -- red
          bg = '#2A1B3D', -- mantle
        },
        close_button_selected = {
          fg = '#FF6088', -- red
          bg = '#4B367C', -- crust
        },
        -- Tab (if you use mode = 'tabs')
        tab = {
          fg = '#D1B8CC', -- subtext1
          bg = '#2A1B3D', -- mantle
        },
        tab_selected = {
          fg = '#A285D1', -- sapphire
          bg = '#4B367C', -- crust
        },
        -- Indicator (if you change style to 'icon' or 'underline')
        indicator_selected = {
          fg = '#A285D1', -- sapphire
          bg = '#4B367C', -- crust
        },
      },
    }
  end,
}

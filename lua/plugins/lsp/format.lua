return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        -- go = { 'gofmt' },
        rust = { 'rustfmt' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        -- java = { 'google_java_format' },
        kotlin = { 'ktlint' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        html = { 'prettier' },
        bash = { 'shfmt' },
        dockerfile = { 'prettier' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}

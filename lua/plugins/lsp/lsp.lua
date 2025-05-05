return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      -- "saghen/blink.cmp",
      { 'antosha417/nvim-lsp-file-operations', config = true },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- NOTE: LSP Keybinds

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Buffer local mappings
          -- Check `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf, silent = true }

          -- keymaps
          opts.desc = 'See available code actions'
          vim.keymap.set({ 'n', 'v' }, '<leader>vca', function() end, opts) -- see available code actions, in visual mode will apply to selection

          opts.desc = 'Smart rename'
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

          opts.desc = 'Show line diagnostics'
          vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

          opts.desc = 'Show documentation for what is under cursor'
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

          opts.desc = 'Restart LSP'
          vim.keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary

          vim.keymap.set('i', '<C-h>', function()
            vim.lsp.buf.signature_help()
          end, opts)
        end,
      })

      -- NOTE : Moved all this to Mason including local variables
      -- used to enable autocompletion (assign to every lsp server config)
      -- local capabilities = cmp_nvim_lsp.default_capabilities()
      -- Change the Diagnostic symbols in the sign column (gutter)

      -- Define sign icons for each severity
      local signs = {
        [vim.diagnostic.severity.ERROR] = ' ',
        [vim.diagnostic.severity.WARN] = ' ',
        [vim.diagnostic.severity.HINT] = '󰠠 ',
        [vim.diagnostic.severity.INFO] = ' ',
      }

      -- Set the diagnostic config with all icons
      vim.diagnostic.config {
        signs = {
          text = signs, -- Enable signs in the gutter
        },
        virtual_text = true, -- Specify Enable virtual text for diagnostics
        underline = true, -- Specify Underline diagnostics
        update_in_insert = false, -- Keep diagnostics active in insert mode
      }

      -- NOTE : Moved all mason_lspconfig.setup_handlers to mason.lua file

      -- HACK: If using Blink.cmp Configure all LSPs here
      -- disabled cuz blink has no tailwind support

      -- ( comment the ones in mason )
      -- local lspconfig = require("lspconfig")
      -- local capabilities = require("blink.cmp").get_lsp_capabilities() -- Import capabilities from blink.cmp

      -- Configure lua_ls
      -- lspconfig.lua_ls.setup({
      --     capabilities = capabilities,
      --     settings = {
      --         Lua = {
      --             diagnostics = {
      --                 globals = { "vim" },
      --             },
      --             completion = {
      --                 callSnippet = "Replace",
      --             },
      --             workspace = {
      --                 library = {
      --                     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
      --                     [vim.fn.stdpath("config") .. "/lua"] = true,
      --                 },
      --             },
      --         },
      --     },
      -- })
      --
      -- -- Configure tsserver (TypeScript and JavaScript)
      -- lspconfig.ts_ls.setup({
      --     capabilities = capabilities,
      --     root_dir = function(fname)
      --         local util = lspconfig.util
      --         return not util.root_pattern('deno.json', 'deno.jsonc')(fname)
      --             and util.root_pattern('tsconfig.json', 'package.json', 'jsconfig.json', '.git')(fname)
      --     end,
      --     single_file_support = false,
      --     on_attach = function(client, bufnr)
      --         -- Disable formatting if you're using a separate formatter like Prettier
      --         client.server_capabilities.documentFormattingProvider = false
      --     end,
      --     init_options = {
      --         preferences = {
      --             includeCompletionsWithSnippetText = true,
      --             includeCompletionsForImportStatements = true,
      --         },
      --     },
      -- })

      -- Add other LSP servers as needed, e.g., gopls, eslint, html, etc.
      -- lspconfig.gopls.setup({ capabilities = capabilities })
      -- lspconfig.html.setup({ capabilities = capabilities })
      -- lspconfig.cssls.setup({ capabilities = capabilities })
    end,
  },
}

return {
  'williamboman/mason.nvim',
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    -- import mason and mason_lspconfig
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'
    -- NOTE: Moved from lspconfig.lua
    -- import lspconfig plugin
    local lspconfig = require 'lspconfig'
    local cmp_nvim_lsp = require 'cmp_nvim_lsp' -- import cmp-nvim-lsp plugin
    local capabilities = cmp_nvim_lsp.default_capabilities() -- used to enable autocompletion (assign to every lsp server config)
    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }
    mason_tool_installer.setup {
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'isort', -- python formatter
        'black', -- python formatter
        'pylint', -- python linter
        'eslint_d', -- js linter
        'shfmt',
        -- 'google_java_format',
        'ktlint',
        'clang-format',
        -- 'gofmt',
        'rustfmt',
        -- Langs
        'clangd',
        'dockerfile-language-server',
        'gopls',
        --'java-language-server',
        'hyprls',
        'kotlin-language-server',
        'omnisharp',
        'terraform-ls',
        'pyright',
        'rust-analyzer',
        'rust_hdl',
        'taplo',
        'yaml-language-server',
        'zls',
        'termux-language-server',
        'asm-lsp',
        'bash-language-server',
        -- Linters
        'ast-grep',
        'actionlint',
        'cpplint',
        'cmakelint',
        -- 'gospel',
        'htmlhint',
        'jsonlint',
        'semgrep',
        'shellcheck',
        'shellharden',
        'systemdlint',
        'trufflehog',
        'vsg',
        'yamllint',
        'api-linter',
        -- DAP
        'bash-debug-adapter',
        'codelldb',
        'java-debug-adapter',
        'kotlin-debug-adapter',
        'js-debug-adapter',
        'delve',
        'debugpy',
        'netcoredbg',
      },
    }
    
    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
    }) -- Added closing brace here
  end,
}

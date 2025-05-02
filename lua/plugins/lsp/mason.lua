return {
  'williamboman/mason.nvim',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require 'mason'

    local mason_tool_installer = require 'mason-tool-installer'

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
        'java-language-server',
        'hyprls',
        'kotlin-language-server',
        'omnisharp',
        'pyright',
        'rust-analyzer',
        'rust_hdl',
        'taplo',
        'yaml-language-server',
        'zls',
        'termux-language-server',
        'asm-lsp',

        -- Linters
        'ast-grep',
        'actionlint',
        'cpplint',
        'cmakelint',
        'gospel',
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
  end,
}

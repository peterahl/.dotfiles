local Util = require("lazyvim.util")

return {
  -- add typescript to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx", "vue" })
      end
    end,
  },

  -- make sure mason installs the server
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "typescript-language-server",
      })
    end,
  },

  -- -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        ---@type lspconfig.options.tsserver
        tsserver = {
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
          },
          init_options = {
            preferences = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
              importModuleSpecifierPreference = 'non-relative',
            },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          opts.capabilities.documentFormattingProvider = false
        end,
      },
    },
  },
}

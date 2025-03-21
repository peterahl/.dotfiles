return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "vue-language-server",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          init_options = {
            vue = {
              -- disable hybrid mode
              hybridMode = false,
            },
          },
        },
      },
      setup = {
        volar = function(_, opts)
          opts.capabilities.documentFormattingProvider = false
        end,
      },
    },
  },
}

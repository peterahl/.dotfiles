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
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        volar = {},
      },
      setup = {
        volar = function(_, opts)
          opts.capabilities.documentFormattingProvider = false
        end,
      },
    },
  },
}

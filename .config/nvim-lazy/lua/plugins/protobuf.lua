return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "buf-language-server",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bufls = {},
      },
      setup = {
        bufls = function(_, opts)
          opts.capabilities.documentFormattingProvider = false
        end,
      },
    },
  },
}

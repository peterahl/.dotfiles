return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      require("vim.lsp._watchfiles")._watchfunc = function()
        return function() end
      end
      vim.list_extend(opts.ensure_installed, {
        "biome",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        biome = {},
      },
    },
  },
}

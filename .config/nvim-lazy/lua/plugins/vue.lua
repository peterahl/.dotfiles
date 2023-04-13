return {
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
        end
      },
    },
  }
}

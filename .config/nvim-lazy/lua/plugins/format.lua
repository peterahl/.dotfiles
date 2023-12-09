return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "buf",
        "eslint_d",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        formatters_by_ft = {
          java = { "google-java-format" },
          javascript = { "biome" },
          typescript = { "biome" },
          xml = { "xmlformat" },
          vue = { "eslint_d" },
          sql = { "sql_format" },
          proto = { "buf" },
        },
        formatters = {
          injected = { options = { ignore_errors = true } },
          xmlformat = {
            prepend_args = { "--indent", "4" },
          },
        },
      }
      return opts
    end,
  },
}

return {
  {
    "phaazon/hop.nvim",
    branch = "v1", -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
    keys = {
      {
        "<M-g><M-g>",
        function()
          require("hop").hint_words()
        end,
        desc = "Hop hint char1",
      },
    },
  }
}

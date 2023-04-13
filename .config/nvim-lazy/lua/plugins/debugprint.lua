return {
  {
    "andrewferrier/debugprint.nvim",
    opts = {
      create_keymaps = false,
    },
    keys = {
      { "n", "<leader>al", function() require("debugprint").debugprint() end,   { desc = "DebugPrint" } },
      { "n", "<leader>ad", function() require("debugprint").deleteprints() end, { desc = "DebugPrint deleteprints" } },
    }
  }

}

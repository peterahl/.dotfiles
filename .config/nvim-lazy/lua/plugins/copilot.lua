return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
      },
      filetypes = {
        ["*"] = true,
      },
    },
  },
}

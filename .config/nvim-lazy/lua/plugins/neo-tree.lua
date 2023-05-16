local is_neotree_focused = function()
  -- Get our current buffer number
  local bufnr = vim.api.nvim_get_current_buf and vim.api.nvim_get_current_buf() or vim.fn.bufnr()
  -- Get all the available sources in neo-tree
  for _, source in ipairs(require("neo-tree").config.sources) do
    -- Get each sources state
    local state = require("neo-tree.sources.manager").get_state(source)
    -- Check if the source has a state, if the state has a buffer and if the buffer is our current buffer
    if state and state.bufnr and state.bufnr == bufnr then
      return true
    end
  end
  return false
end

local is_neotree_open = function()
  local is_open = false
  -- Get all the available sources in neo-tree
  for _, source in ipairs(require("neo-tree").config.sources) do
    -- Get each sources state
    local state = require("neo-tree.sources.manager").get_state(source)
    -- Check if the source has a state and if the state has a buffer
    if state and state.bufnr then
      is_open = true
      break
    end
  end
  return is_open
end

local focus_toggle_neotree = function()
  if is_neotree_open() then
    vim.cmd(":Neotree reveal")
  else
    require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
  end
end

return {}
-- return {
--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     -- keys = {
--     --   { "<leader>e", focus_toggle_neotree, desc = "Toggle NeoTree" },
--     -- },
--     opts = {
--       filesystem = {
--         -- bind_to_cwd = false,
--         follow_current_file = false,
--         -- use_libuv_file_watcher = true,
--       },
--     }
--   }
-- }

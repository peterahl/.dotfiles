local rocks_config = {
    rocks_path = vim.env.HOME .. "/.local/share/nvim/rocks",
}

vim.g.rocks_nvim = rocks_config

local luarocks_path = {
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}
package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath = {
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
    -- Remove the dylib and dll paths if you do not need macos or windows support
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dylib"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dylib"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dll"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dll"),
}
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*")) 


vim.cmd('colorscheme gruvbox')

local g = vim.g
g.indent_blankline_char = "┊"
-- g.tokyonight_style = 'night'
g.mapleader = " "
g.maplocalleader = ","
g.gitblame_enabled = 1
-- g.neovide_fullscreen = 1
-- g.neovide_transparency = 0.95

local opt = vim.opt
opt.termguicolors = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

local o = vim.o
o.scrolloff = 999
o.background = "dark" -- or "light" for light mode
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.guifont = "Fira Code SemiBold:h8"
o.clipboard = "unnamedplus"
o.timeoutlen = 50
o.timeout = true

vim.keymap.set("n", "<leader>fs", ":w<CR>")
vim.keymap.set("n", "<leader>qq", ":qa<CR>")

-- vim.wo.number = true
-- vim.wo.relativenumber = true

require("telescope").setup {
  defaults = {
    layout_strategy = "vertical",
    path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      return string.format("%s%s%s", tail, string.rep(" ", 60 - #tail), path)
    end,
    layout_config = {
      prompt_position = "top",
      preview_cutoff = 40,
    },
    sorting_strategy = "ascending",
    winblend = 0,
  },
  extensions = {
    -- fzf = {
    --   fuzzy = true, -- false will only do exact matching
    --   override_generic_sorter = true, -- override the generic sorter
    --   override_file_sorter = true, -- override the file sorter
    --   case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    -- },
    file_browser = {
      path_display = {},
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          preview_width = 0.6,
        },
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

vim.keymap.set("n", "<M-g><M-r>", ":Telescope file_browser path=%:p:h select_buffer=true display_stat=false<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>,", ":Telescope buffers<CR>")

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

-- Mason
require("mason").setup()
require("mason-lspconfig").setup()

vim.keymap.set("n", "<leader>cm", ":Mason<CR>")

-- Neogit
require("neogit").setup()
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>")

-- Which-key
require("which-key").setup()

-- Copilot
-- require('copilot').setup()

-- cmp

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end


local cmp = require('cmp').setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<C-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- local capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp
--
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- end
--
-- -- Setup lspconfig.
-- local nvim_lsp = require('lspconfig')
--
-- -- setup languages 
-- -- GoLang
-- nvim_lsp['gopls'].setup{
--   cmd = {'gopls'},
--   -- on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     gopls = {
--       experimentalPostfixCompletions = true,
--       analyses = {
--         unusedparams = true,
--         shadow = true,
--       },
--       staticcheck = true,
--     },
--   },
--   init_options = {
--     usePlaceholders = true,
--   }
-- }


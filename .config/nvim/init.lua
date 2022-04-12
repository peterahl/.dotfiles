require('plugins')
require('telescope').load_extension('fzf')

local g = vim.g
g.indent_blankline_char = '┊'
g.tokyonight_style = 'night'
g.mapleader = ' '

local opt = vim.opt
opt.termguicolors = true
opt.completeopt = { 'menu' , 'menuone', 'noselect' }
opt.ignorecase = true
opt.cursorline = true
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

local o = vim.o
o.background = "dark" -- or "light" for light mode
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.guifont = "Fira Code:h8"
o.clipboard = "unnamedplus"
o.timeoutlen = 300


vim.cmd([[colorscheme tokyonight]])
vim.cmd([[nnoremap j jzz]])
vim.cmd([[nnoremap k kzz]])
vim.cmd([[nnoremap <C-d> <C-d>zz]])
vim.cmd([[nnoremap <C-u>  <C-u>zz]])
vim.cmd([[:tnoremap <Esc> <C-\><C-n>]])

-- Setup nvim-cmp.
local cmp = require('cmp')

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

cmp.setup({
  snippet = {
      expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
  }, {
    { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
  { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
  { name = 'path' }
  }, {
    { name = 'cmdline' }
    })
})

local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap
local wk = require("which-key")

wk.register({
  ['<M-o>'] = { "<C-w>w", "other window" },
  ['<M-g>'] = {
    name = 'my g',
    ['<M-g>'] = { "<cmd>HopWord<CR>", 'ace jump' },
    ['<M-r>'] = { "<cmd> lua require('neofs').open(require('telescope.utils').buffer_dir())<cr>", 'ace jump' }
  }
})

-- map('n', '<M-o>', '<C-w>w', opts)
map('v', '<S-r>', '"hy/<C-r>h<CR>:%s/<C-r>h//g<left><left>', opts)
map('n', '<S-r>', ':noh<CR>', opts)
-- map('n', '<M-g><M-g>', '<cmd>HopWord<CR>', opts)

map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

require('private-lsp-config')

require('keybindings')

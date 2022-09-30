vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

local use = require('packer').use

return require('packer').startup(function()
  -- Packer can manage itself

  use 'Olical/aniseed'

  -- use 'Olical/conjure'

  use 'wbthomason/packer.nvim'

  use 'voldikss/vim-floaterm'

  use 'nanotee/sqls.nvim'

  use 'f-person/git-blame.nvim'

  use {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup {}
    end
  }

  -- use {
  --   "nvim-neorg/neorg",
  --   config = function()
  --     require('neorg').setup {
  --       load = {
  --         ["core.defaults"] = {}
  --       }
  --     }
  --   end,
  --   requires = "nvim-lua/plenary.nvim"
  -- }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    "lukas-reineke/lsp-format.nvim",
    config = function()
      require("lsp-format").setup {}
    end
  }

  use 'folke/tokyonight.nvim'

  use "folke/lua-dev.nvim"

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = true,
        --
        -- show_end_of_line = true,
        space_char_blankline = " ",
      }
    end
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use { 'ibhagwan/fzf-lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('fzf-lua').setup {
        winopts = {
          preview = {
            vertical = 'up:65%',
            layout = 'vertical'
          }
        }
      }
    end
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = "all",
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        indent = {
          enable = true
        }
      }
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require("treesitter-context").setup {}
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'ThePrimeagen/harpoon',
      'nvim-telescope/telescope-project.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require("telescope").setup {
        defaults = {
          sorting_strategy = "ascending",
          layout_strategy = 'vertical',
          path_display = function(opts, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s%s%s", tail, string.rep(" ", 60 - #tail), path)
          end,
          layout_config = {
            height = 0.9,
            preview_cutoff = 40,
            prompt_position = "top",
            width = 0.9
          }
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
          file_browser = {
            path_display = {},
            sorting_strategy = "ascending",
            layout_strategy = 'horizontal',
            layout_config = {
              preview_width = 0.6
            },
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          },
          project = {
            base_dirs = {
              '~/git',
              '~/.dotfiles',
            }
          }
        }
      }
      require('telescope').load_extension('fzf')
      require("telescope").load_extension('harpoon')
      require("telescope").load_extension("ui-select")
    end
  }

  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('neogit').setup()
    end
  }

  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use {
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    config = function()
    end
  }
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- use {
  --   'ray-x/lsp_signature.nvim',
  --   config = function()
  --     require("lsp_signature").setup({
  --       log_path = vim.fn.expand("$HOME") .. "/.cache/nvim/sig.log",
  --     })
  --   end
  -- }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    'tami5/lspsaga.nvim',
    config = function()
      require('lspsaga').setup()
    end
  }

  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  }


  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      require 'nvim-tree'.setup {}
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  }


end)

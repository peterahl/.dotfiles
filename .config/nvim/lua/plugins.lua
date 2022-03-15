-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

local use = require('packer').use

return require('packer').startup(function()
	-- Packer can manage itself

  use {
    'numToStr/Comment.nvim',
    config = function ()
      require('Comment').setup()
    end
  }

	use 'wbthomason/packer.nvim'

  use "lukas-reineke/indent-blankline.nvim"

	use { "ellisonleao/gruvbox.nvim" }

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use { 'nvim-telescope/telescope-project.nvim' }

  use { "nvim-telescope/telescope-file-browser.nvim" }

  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require('fzf-lua').setup {
        winopts = {
          preview = {
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
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
    config = function ()
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
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function()
			require("telescope").setup {
        defaults = {
          sorting_strategy = "ascending",
          layout_strategy = 'vertical',
          path_display = function(opts, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s%s%s", tail, string.rep(" ", 90 -#tail), path)
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
						fuzzy = true,                    -- false will only do exact matching
						override_generic_sorter = true,  -- override the generic sorter
						override_file_sorter = true,     -- override the file sorter
						case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
          file_browser = {
            theme = "ivy",
          },
          project = {
            base_dirs = {
              '~/git',
              '~/.dotfiles',
            }
          }
				}
			}
		end
	}

	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function ()
      require('neogit').setup()
    end
  }

	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

  use 'ray-x/lsp_signature.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }
  use 'tami5/lspsaga.nvim'
  
  use 'arcticicestudio/nord-vim'

  use 'folke/tokyonight.nvim'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function() require'nvim-tree'.setup {} end
	}

  use 'windwp/nvim-autopairs'

end)

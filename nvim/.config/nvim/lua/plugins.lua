return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	use {
    'nvim-telescope/telescope.nvim',
    requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
      require('fuzzy')
		end
	}

	use {
		'gbprod/nord.nvim',
		config = function()
			require('theme')
		end
	}

	use('tpope/vim-obsession')
	use('tpope/vim-surround')
	use('tpope/vim-commentary')
	use('tpope/vim-fugitive')

	use { 
		'neovim/nvim-lspconfig',
		after = 'nvim-cmp',
		config = function()
			require('lsp')
		end
	}

	use {
		'sbdchd/neoformat',
		config = function()
      require('formatting')
		end
	}

	use('elixir-editors/vim-elixir')

	use { 
		'nvim-treesitter/nvim-treesitter',
		requires = { 'nvim-treesitter/playground' },
		config = function()
			require('treesitter')
		end
	}

	use {
    'christoomey/vim-tmux-navigator',
    config = function ()
      vim.g.tmux_navigator_disable_when_zoomed = true
    end
  }

	use {
		'nvim-tree/nvim-tree.lua',
    config = function ()
			require('tree')
    end,
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('git')
		end
	}

	use {
		'mfussenegger/nvim-lint',
		config = function()
			require('linter')
		end
	}

	use('psliwka/vim-smoothie')

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 
			'kyazdani42/nvim-web-devicons',
			opt = true 
		},
		config = function()
			require('status')
		end
	}

	use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lua',
      'onsails/lspkind-nvim'
    },
    config = function()
      require('complete')
    end
  }

	use {
    'mattn/emmet-vim',
    ft = {'svelte', 'html', 'heex', 'elixir', 'javascript'},
    config = function()
      vim.g.user_emmet_settings = {
        ['javascript.jsx'] = {
          extends = 'jsx',
        },
        elixir = {
          extends = 'html'
        },
        eelixir = {
          extends = 'html'
        },
        heex = {
          extends = 'html'
        }
      }
      vim.g.user_emmet_mode = 'inv'
    end
  }
	
	use {
		'norcalli/nvim-colorizer.lua',
		config = function()
			require 'colorizer'.setup()
		end
  }

	use {
    'janko/vim-test',
    requires = {
      'tpope/vim-dispatch',
      'neomake/neomake',
      'preservim/vimux'
    },
		config = function()
			require 'testing'
		end
  }
end)

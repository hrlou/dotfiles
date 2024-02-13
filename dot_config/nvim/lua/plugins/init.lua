local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	-- THEMES
	{ 'dracula/vim', name = 'dracula' },
	{ 'ellisonleao/gruvbox.nvim', name = 'gruvbox' },
	{ 'navarasu/onedark.nvim', name = 'onedark' },
	{ 'nordtheme/vim', name  = 'nord' },
	{ 'sainnhe/sonokai', name = 'sonokai' },
	{ 'catppuccin/nvim', name = 'catppuccin' },
	-- SYNTAX
	{ 'alker0/chezmoi.vim', name = 'chezmoi' },
	{ 'cespare/vim-toml', name = 'toml' },
	-- LANGUAGE SUPPORT - IDE STUFF
	{ 'neovim/nvim-lspconfig', name = 'lspconfig' },
	{ 'cdelledonne/vim-cmake', name = 'cmake' }, -- cmake exposure
	{ 'nvim-treesitter/nvim-treesitter', name = 'treesitter' }, -- language parser
	{ 'williamboman/mason.nvim',
		name = 'mason',
		dependencies = {
			 { 'williamboman/mason-lspconfig.nvim' },
		}
	},
	{ 'hrsh7th/nvim-cmp',
		name = 'cmp',
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
		},
		init = function()
			require('plugins.config.cmp')
		end,
	},
	{ 'nvimdev/guard.nvim', -- MIGHT DELETE
		-- provides code auto formatting
		name = 'guard',
		dependencies = {
			{ 'nvimdev/guard-collection' },
		}
	},
	{ 'saecki/crates.nvim',
		-- crates intergration
		name = 'crates',
		tag = 'stable',
		opts = {},
	},
	{ 'mrcjkb/rustaceanvim',
		version = '^4', -- Recommended
		ft = { 'rust' },
	},
	-- EXTRA
	{ 'folke/which-key.nvim',
		name = 'which-key',
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
  		end,
	},
	{ 'windwp/nvim-autopairs',
		event = "InsertEnter",
    	opts = {}
	},
	{ 'nvim-lualine/lualine.nvim', name = 'lualine', opts = {} },
	{ 'EtiamNullam/deferred-clipboard.nvim', name = 'deferred-clipboard', opts = {} }, -- use system clipboard
	{ 'lukas-reineke/indent-blankline.nvim', name = 'ibl', main = "ibl", opts = {} }, -- tab lines
	{ 'nvim-tree/nvim-tree.lua',
		-- better file explorer
		name = 'nvim-tree',
		opts = function()
			return require 'plugins.config.nvim-tree'
    	end,
	},
	{ 'voldikss/vim-floaterm', name = 'floaterm' }, -- floating shell
	{ 'toppair/peek.nvim',
		-- markdown preview
		name = 'peek',
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
	},
	{ 'nvim-telescope/telescope.nvim',
		-- vim fuzzy finder
		name = 'telescope',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
		}
	},
})

require('plugins.config')

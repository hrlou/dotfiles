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
	-- SYNTAX
	{ 'alker0/chezmoi.vim', name = 'chezmoi' },
	{ 'cespare/vim-toml', name = 'toml' },
	-- LANGUAGE SUPPORT - IDE STUFF
	{ 'cdelledonne/vim-cmake', name = 'cmake' }, -- cmake exposure
	{ 'mrcjkb/rustaceanvim', name = 'rustaceanvim' }, -- rust lsp
	{ 'ms-jpq/coq_nvim', name = 'coq', branch = 'coq' }, -- autocompletion
	{ 'neovim/nvim-lspconfig', name = 'lspconfig', },
	{ 'nvim-treesitter/nvim-treesitter', name = 'treesitter' }, -- language parser
	{ 'nvimdev/guard.nvim',
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
	},
	-- EXTRA
	{ 'EtiamNullam/deferred-clipboard.nvim', name = 'deferred-clipboard' }, -- use system clipboard
	{ 'lukas-reineke/indent-blankline.nvim', name = 'indent-blankline' }, -- tab lines
	{ 'nvim-tree/nvim-tree.lua', name = 'nvim-tree' } -- better file explorer, I'd prefer joshuto integration 
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

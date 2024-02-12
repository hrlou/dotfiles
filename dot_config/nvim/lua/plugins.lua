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
	{ 'sainnhe/sonokai', name = 'sonokai' },
	{ 'ellisonleao/gruvbox.nvim', name = 'gruvbox' },
	{ 'dracula/vim', name = 'dracula' },
	{ 'nordtheme/vim', name  = 'nord' },
	{ 'navarasu/onedark.nvim', name = 'onedark' },
	-- SYNTAX
	{ 'alker0/chezmoi.vim', name = 'chezmoi' },
	{ 'cespare/vim-toml', name = 'toml' },
	-- LANGUAGE SUPPORT - IDE STUFF
	{ 'ms-jpq/coq_nvim', name = 'coq', branch = 'coq' },
	{ 'nvim-treesitter/nvim-treesitter', name = 'treesitter' },
	{ 'cdelledonne/vim-cmake', name = 'cmake' },
	{ 'nvimdev/guard.nvim',
		name = 'guard',
		-- event = "BufReadPre",
		config = function()
			local ft = require("guard.filetype")
			ft("c,cpp,json"):fmt("clang-format")
				:lint('clang-tidy')
			ft('lua'):fmt('lsp')
				:append('stylua')
			require("guard").setup({
				fmt_on_save = true,
				lsp_as_default_formatter = false,
		})
		end,
		dependencies = {
			{ 'nvimdev/guard-collection' },
		}
	},
	{ 'neovim/nvim-lspconfig',
		name = 'lspconfig',
		config = function()
			require('lspconfig')
		end,
	},
	{ 'vxpm/ferris.nvim',
		name = 'ferris',
		config = function()
			require("ferris").setup()
		end,
	},
	-- EXTRA
	{ 'voldikss/vim-floaterm', name = 'floaterm' },
	{ 'toppair/peek.nvim',
		name = 'peek',
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			-- refer to `configuration to change defaults`
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{ 'EtiamNullam/deferred-clipboard.nvim',
		name = 'deferred-clipboard',
		config = function()
			require("deferred-clipboard").setup()
		end,
	},
	{ 'lukas-reineke/indent-blankline.nvim',
		name = 'indent-blankline',
		config = function()
			require("ibl").setup()
		end, 
	},
	{ 'nvim-telescope/telescope.nvim',
		name = 'telescope',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
		}
	},
	{ 'nvim-tree/nvim-tree.lua',
		name = 'nvim-tree',
		config = function()
			require("nvim-tree").setup()
		end,
	}
})
-- vim: ft=lua

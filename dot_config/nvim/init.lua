vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.clipboard = unnamedplus

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
	{ 'folke/tokyonight.nvim', name = 'tokyonight' },
	-- SYNTAX
	{ 'alker0/chezmoi.vim', name = 'chezmoi' },
	{ 'cespare/vim-toml', name = 'toml' },
	-- LANGUAGE SUPPORT 
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

require "theme"
vim.wo.relativenumber = true
-- vim: ft=lua

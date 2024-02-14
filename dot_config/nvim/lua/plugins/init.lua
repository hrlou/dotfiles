require('plugins.bootstrap')

require('lazy').setup({
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
	-- OTHER
	{ 'cdelledonne/vim-cmake', name = 'cmake' }, -- cmake exposure
	{ 'nvim-treesitter/nvim-treesitter', name = 'treesitter' }, -- language parser
	{ 'lukas-reineke/indent-blankline.nvim', name = 'ibl', main = "ibl", opts = {} }, -- tab lines
	{ 'windwp/nvim-autopairs', event = "InsertEnter", opts = {} },
	{ 'EtiamNullam/deferred-clipboard.nvim', name = 'deferred-clipboard', opts = {} }, -- use system clipboard
	require('plugins.config.alpha'),
	require('plugins.config.barbar'),
	require('plugins.config.cmp'),
	require('plugins.config.floaterm'),
	require('plugins.config.lsp'),
	require('plugins.config.lualine'),
	require('plugins.config.peek'),
	require('plugins.config.telescope'),
	require('plugins.config.tree'),
	require('plugins.config.whichkey'),
	require('plugins.config.guard'),
})

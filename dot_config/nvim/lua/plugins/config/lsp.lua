return {
	'williamboman/mason.nvim',
	name = 'mason',
	event = "VeryLazy",
	dependencies = {
		{ 'neovim/nvim-lspconfig' },
		{ 'williamboman/mason-lspconfig.nvim' },
	},
	init = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
	end,
}

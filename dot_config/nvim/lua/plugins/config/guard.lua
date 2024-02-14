return {
	'nvimdev/guard.nvim',
	name = 'guard',
	event = "VeryLazy",
	dependencies = {
		{ 'nvimdev/guard-collection' },
	},
--	init = function()
--		require('plugins.config.guard')
--	end,	
}

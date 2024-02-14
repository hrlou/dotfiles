return {
	'voldikss/vim-floaterm',
	name = 'floaterm',
	init = function()
		vim.cmd[[let g:floaterm_keymap_toggle = '<Leader>f']]
		vim.cmd[[let g:floaterm_wintype = 'split']]
	end,
}

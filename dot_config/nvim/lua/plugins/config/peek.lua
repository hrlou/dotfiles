return { 
	'toppair/peek.nvim',
	name = 'peek',
	event = { "VeryLazy" },
	build = "deno task --quiet build:fast",
}

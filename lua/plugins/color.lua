return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	config = function ()
		vim.cmd.colorscheme "catppuccin"
	end,
	setup = ({
		flavour = "auto", -- will respect terminal's background
		background = { -- :h background
		    light = "latte",
		    dark = "frappe",
		},
	})
}

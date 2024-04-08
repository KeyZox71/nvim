return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	config = function()
		vim.cmd.colorscheme "catppuccin"
	end,
	setup = ({
		flavour = "auto", -- will respect terminal's background
		background = { -- :h background
			light = "latte",
			dark = "frappe",
		},
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = false,
			telescope = {
				enabled = true,
				-- style = "nvchad"
			},
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		telescope = {
			enabled = true,
			-- style = "nvchad"
		},
		mason = true,
		cmp = true,
	})
}

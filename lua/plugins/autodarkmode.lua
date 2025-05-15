return {
	"f-person/auto-dark-mode.nvim",
	config = {
	  update_interval = 1000,
	  set_dark_mode = function()
		vim.cmd('Catppuccin frappe')
			vim.cmd("hi Normal ctermbg=none guibg=none")
	  end,
	  set_light_mode = function()
		vim.cmd('Catppuccin latte')
			vim.cmd("hi Normal ctermbg=none guibg=none")
	  end,
	},
  }

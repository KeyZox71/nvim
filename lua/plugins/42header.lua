return {
    "Diogo-ss/42-header.nvim",
	config = function()
		local header = require("42header")
		header.setup({
			default_map = true,     -- default Mapping <F1> in normal mode
			auto_update = true,     -- update header when saving
			user = "adjoly",      -- your user
			mail = "adjoly@student.42angouleme.fr", -- your mail
		})
	end
}
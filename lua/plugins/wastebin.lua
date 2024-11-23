return {
  {
    "keyzox71/wastebin.nvim",
    config = function ()
		require("wastebin").setup({
			url = "https://paste.keyzox.me",
		})
	end,
  }
}

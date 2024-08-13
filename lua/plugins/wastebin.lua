return {
  {
    "matze/wastebin.nvim",
    config = function ()
		require("wastebin").setup({
			url = "https://wastebin.vaultzox.duckdns.org",
		})
	end,
  }
}

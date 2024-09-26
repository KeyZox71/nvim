return {
  {
    "matze/wastebin.nvim",
    config = function ()
		require("wastebin").setup({
			url = "https://wastebin.vaultzox.duckdns.org",
			open_cmd = "wl-copy",
		})
	end,
  }
}

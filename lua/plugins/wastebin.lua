return {
  {
    "matze/wastebin.nvim",
    config = function ()
		require("wastebin").setup({
			url = "https://wastebin.vaultzox.duckdns.org",
			-- To open on default browser
			open_cmd = "open",
			-- To copy on hyprland
			-- open_cmd = "wl-copy",
		})
	end,
  }
}

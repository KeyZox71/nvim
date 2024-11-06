return {
  {
    "keyzox71/wastebin.nvim",
    config = function ()
		require("wastebin").setup({
			url = "https://paste.keyzox.me",
			-- To open on default browser
			open_cmd = "xdg-open",
			-- To copy on hyprland
			-- open_cmd = "wl-copy",
		})
	end,
  }
}

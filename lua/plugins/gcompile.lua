return ({
	"leosmaia21/gcompilecommands.nvim",
	opts = {
		tmp_file_path = (os.getenv("HOME") or os.getenv("USERPROFILE")) .. "/.vim/compilecommandsNEOVIM.json"
	},
	ft = { "c", "cpp" }, -- lazy load plugin only on C and C++ filetypes
})

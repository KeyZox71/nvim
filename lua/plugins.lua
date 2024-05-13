return ({
	'ThePrimeagen/vim-be-good',
    'christoomey/vim-tmux-navigator',
	'windwp/nvim-autopairs',
	{
        "kylechui/nvim-surround",
        version = "*", -- For stability; omit to use `main` branch for latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    }
})
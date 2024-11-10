return ({
	'rmagatti/auto-session',
	lazy = false,
	keys = {
		{ '<leader>wr', '<cmd>SessionSearch<CR>', desc = 'Session search' },
		{ '<leader>ws', '<cmd>SessionSave<CR>', desc = 'Save session' },
		{ '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
	},

	---@module "auto-session"
	---@type AutoSession.Config

	opts = {
		enabled = true,
		lazy_support = true,
		session_lens = {
			load_on_setup = true,
			previewer = true,
			mappings = {
				-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
				delete_session = { "i", "<C-D>" },
				alternate_session = { "i", "<C-S>" },
				copy_session = { "i", "<C-Y>" },
			},
		},
	},
})

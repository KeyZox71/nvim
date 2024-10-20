return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},

	config = function()
		local cmp = require('cmp')
		local cmp_lsp = require("cmp_nvim_lsp")
		local lsp = require('lsp-zero')

		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		local on_attach = function(client, bufnr)
			-- Keybindings (add more as needed)
			local bufopts = { noremap=true, silent=true, buffer=bufnr }
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
			-- Other keybindings...
		end

		local function quickfix()
			vim.lsp.buf.code_action({
				filter = function(a) return a.isPreferred end,
				apply = true
			})
		end

		vim.keymap.set('n', '<leader>qf', quickfix, opts)

		require('lspconfig').clangd.setup({})
		require('lspconfig').gopls.setup({})
		require('lspconfig').nixd.setup({})
		require('lspconfig').lua_ls.setup({})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
			}, {
					{ name = 'buffer' },
				})
		})

		lsp.setup()
	end
}

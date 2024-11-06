vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)

local function goto_definition()
    vim.lsp.buf.definition()
    vim.cmd('normal! zz')
end

vim.keymap.set("n", "<leader>gd", goto_definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.cmd([[command! W w]])

vim.api.nvim_create_user_command('CompileCommands', function()
	os.execute('bear -- make')
	vim.cmd('LspRestart')
end, {})


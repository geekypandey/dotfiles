local builtin = require('telescope.builtin')
-- TODO: check if the directory is git, if yes use git_files else use find_files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- TODO: this mapping is not working..fix it later
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

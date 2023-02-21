local opts = { noremap = true, silent = true }

-- system copy
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', opts)

-- moving line up and down
vim.api.nvim_set_keymap('n', '<C-k>', ':m-2<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-j>', ':m+<CR>', opts)

-- buffer navigation
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)

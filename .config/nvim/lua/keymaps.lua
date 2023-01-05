local opts = { noremap = true, silent = true }

-- system copy
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', opts)

-- moving line up and down
vim.api.nvim_set_keymap('n', '<C-k>', ':m-2<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-j>', ':m+<CR>', opts)

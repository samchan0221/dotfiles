local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float"
})

local function lazygit_toggle() lazygit:toggle() end

vim.api.nvim_set_keymap("n", "<leader>g", "", { callback = lazygit_toggle })

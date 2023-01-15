local trouble = require("trouble.providers.telescope")
local bulitin = require('telescope.builtin')

require 'telescope'.setup {
  defaults = {
    layout_strategy = "vertical",
    color_devicons = true,
    initial_mode = 'insert',
    mappings = {
      i = { ["<c-q>"] = trouble.open_with_trouble },
      n = { ["<c-q>"] = trouble.open_with_trouble }
    }
  },
  git_status = { initial_mode = "normal" },
  pickers = {
    live_grep = {
      -- https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#common-options
      additional_args = function()
        return { "--hidden" }
      end
    },
  },
}

vim.keymap.set('n', ';f', function() bulitin.find_files { hidden = true } end, {})
vim.keymap.set('n', ';g', bulitin.live_grep, {})
vim.keymap.set('n', ';b', function() bulitin.buffers { initial_mode = "normal" } end, {})
vim.keymap.set('n', ';;', bulitin.help_tags, {})
vim.keymap.set('n', ';c', bulitin.git_branches, {})
vim.keymap.set('n', ';j', function() bulitin.quickfix { initial_mode = "normal" } end, {})
vim.keymap.set('n', ';s', function() bulitin.git_status { initial_mode = "normal" } end, {})

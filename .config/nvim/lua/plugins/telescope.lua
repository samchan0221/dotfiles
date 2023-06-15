local trouble = require("trouble.providers.telescope")
local bulitin = require('telescope.builtin')

local telescope = require('telescope')

telescope.setup {
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
  fzf = {
    fuzzy = true, -- false will only do exact matching
    override_generic_sorter = true, -- override the generic sorter
    override_file_sorter = true, -- override the file sorter
    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
  }
  -- pickers = {
  --   live_grep = {
  --     -- https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#common-options
  --     additional_args = function()
  --       return { "--hidden" }
  --     end
  --   },
  -- },
}

telescope.load_extension('fzf')

vim.keymap.set('n', ';f', function() bulitin.find_files { hidden = true } end, {})
vim.keymap.set('n', ';g', bulitin.live_grep, {})
vim.keymap.set('n', ';b', function() bulitin.buffers { initial_mode = "normal" } end, {})
vim.keymap.set('n', ';;', bulitin.help_tags, {})
vim.keymap.set('n', ';c', bulitin.commands)
vim.keymap.set('n', ';j', function() bulitin.quickfix { initial_mode = "normal" } end, {})
vim.keymap.set('n', ';s', function() bulitin.git_status { initial_mode = "normal" } end, {})

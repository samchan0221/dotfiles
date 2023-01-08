-- init autocmd
vim.cmd('autocmd!')
-- set script encoding
-- stop loading config if it's on tiny or small
vim.cmd('if !1 | finish | endif')

vim.opt.number = true
vim.opt.conceallevel = 0
vim.opt.ff = 'unix'
vim.opt.encoding = 'utf-8'
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.background = 'dark'
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.mouse = ''
vim.cmd('syntax enable')
-- vim.cmd('set t_Co=256')
vim.g.dracula_colorterm = 0
vim.g.dracula_italic = 0

-- Suppress appending <PasteStart> and <PasteEnd> when pasting
vim.cmd('set t_BE=')
vim.cmd('set hidden')

vim.cmd('set nosc noru nosm')
-- Don't redraw while executing macros (good performance config)
vim.cmd('set lazyredraw')
vim.cmd('set showmatch')
-- How many tenths of a second to blink when matching brackets
vim.cmd('set mat=2')
-- Ignore case when searching
vim.cmd('set ignorecase')
-- Be smart when using tabs ;)
vim.cmd('set smarttab')
-- indents
vim.cmd('filetype plugin indent on')
vim.cmd('set shiftwidth=2')
vim.cmd('set tabstop=2')
vim.cmd('set ai "Auto indent')
vim.cmd('set si "Smart indent')
vim.cmd('set nowrap "No Wrap lines')
vim.cmd('set backspace=start,eol,indent')
-- Finding files - Search down into subfolders
vim.cmd('set path+=**')
vim.cmd('set wildignore+=*/node_modules/*')

-- Turn off paste mode when leaving insert
vim.cmd('autocmd InsertLeave * set nopaste')

-- Add asterisks in block comments
vim.cmd('set formatoptions+=r')

-- Highlights
vim.cmd('set cursorline')

-- Set cursor line color on visual mode
vim.cmd('highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40')

vim.cmd('highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000')

vim.cmd([[
  augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
  augroup END
]])

-- Tmux cursor
vim.cmd([[
  if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
  else
      let &t_SI = "\e[5 q"
      let &t_EI = "\e[2 q"
  endif
]])

-- File types
vim.cmd('au BufNewFile,BufRead *.es6 setf javascript')
vim.cmd('au BufNewFile,BufRead *.tsx setf typescriptreact')
vim.cmd('au BufNewFile,BufRead *.md set filetype=markdown')
vim.cmd('au BufNewFile,BufRead *.flow set filetype=javascript')

vim.cmd('set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md')

vim.cmd('autocmd FileType coffee setlocal shiftwidth=2 tabstop=2')
vim.cmd('autocmd FileType ruby setlocal shiftwidth=2 tabstop=2')
vim.cmd('autocmd FileType yaml setlocal shiftwidth=2 tabstop=2')

-- Syntax theme
vim.cmd('set t_Co=256')
vim.cmd([[
  colorscheme dracula
]])

-- After
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.lualine')
require('plugins.cmp')
require('plugins.toggleterm')
require('plugins.comment')
require('plugins.gitsigns')
require('keymaps')

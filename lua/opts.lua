-- [[ Setting options ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
-- See `:help vim.o`
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.colorcolumn = '80' -- str:  Show col for max line length
opt.textwidth = 120 -- int:  Max line length
opt.scrolloff = 8 -- int:  Min num lines of context
opt.laststatus = 2
opt.cursorline = true
opt.cmdheight = 2
opt.wildmenu = true

-- Enable mouse mode
opt.mouse = 'a'

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true
opt.undodir = '/Users/Nigel/.config/nvim/undodir'
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = false -- bool: Highlight search matches

-- Decrease update time
opt.updatetime = 250
opt.signcolumn = 'yes'

-- Set colorscheme
opt.termguicolors = true
vim.g.t_co = 256
vim.g.background = 'dark'
require('colourscheme')

-- Set completeopt to have a better completion experience
opt.completeopt = 'menu,menuone,noselect'

-- [[ Filetypes ]]
opt.encoding = 'utf8' -- str:  String encoding to use
opt.fileencoding = 'utf8' -- str:  File encoding to use

-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

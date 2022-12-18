-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--[[ keys.lua ]]
local opts = { noremap = true, silent = true }
--local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

-- Remap the escape key used to leave insert mode
keymap('i', 'jk', '<ESC>', opts)

-- Typo Bindings
keymap('c', 'Q<cr>', 'q<cr>', opts)
keymap('c', 'W<cr>', 'w<cr>', opts)
keymap('c', 'Wq<cr>', 'wq<cr>', opts)

-- Buffer Bindings
keymap('n', '<leader>b', ':ls<cr>', opts)
keymap('n', '<leader>bn', ':bn<cr>', opts)
keymap('n', '<leader>bp', ':bp<cr>', opts)
keymap('n', '<leader>bd', ':bd<cr>', opts)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Awesome Keymaps - Primagean
-- Block move
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Keys cursor position when apending lines
keymap("n", "J", "mzJ`z")

-- Keeps cursor in middle of screen when scrolling updown
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Keeps cursor in middle when searching
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- greatest remap ever - replace text with paste without replacing the paste buffer
keymap("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", "\"+y")
keymap("n", "<leader>Y", "\"+Y")
keymap({ "n", "v" }, "<leader>d", "\"_d")

keymap({ "n", "v" }, "<leader>d", [["_d]])

-- Nerdtree Bindings (File Explorer)
keymap('n', '<leader>f', ':NvimTreeToggle<CR>', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

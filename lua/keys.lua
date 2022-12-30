-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

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

-- Window/Pane Navigation Bindings
keymap('n', '<leader>l', '<C-W><C-l>', opts)
keymap('n', '<leader>h', '<C-W><C-h>', opts)
keymap('n', '<leader>j', '<C-W><C-j>', opts)
keymap('n', '<leader>k', '<C-W><C-k>', opts)
keymap('n', '<leader><left>', ':vertical resize +15<cr>', opts)
keymap('n', '<leader><right>', ':vertical resize -15<cr>', opts)
keymap('n', '<leader><up>', ':resize +3<cr>', opts)
keymap('n', '<leader><down>', ':resize -3<cr>', opts)

-- Buffer Bindings
keymap('n', '<leader>b', ':ls<cr>', opts)
keymap('n', '<leader>bn', ':bn<cr>', opts)
keymap('n', '<leader>bp', ':bp<cr>', opts)
keymap('n', '<leader>bd', ':Bdelete<cr>', { silent = true })

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

-- Terminal Bindings
keymap('n', '<leader>tt', ':botright 10sp<cr>:term<cr>i', {})
keymap('n', '<leader>tv', ':botright 50vsp<cr>:term<cr>i', {})
keymap('n', '<leader>tt', ':rightbelow sp<cr>:term<cr>i', {})
keymap('n', '<leader>tt', ':vert sp<cr>:term<cr>i', {})

-- Format File
keymap('n', '<leader>F', ':Format<cr>', opts)

-- NVIM-R Bindings
keymap('n', '<leader>r<space>', ':call StartR("default")<cr>:vertical resize -30<cr>', opts) -- Start R as a V split
-- keymap('n', '<leader>r<space>', ':call StartR("default")<cr><C-W><C-l><C-W>T', opts) -- Start R as a new tab
keymap('n', '<leader>rq', ':call RQuit("nosave")<cr>', opts) -- Close R
keymap('n', '<leader>rp', ':call RAction("print")<cr>', opts) -- Print what ever is under cursor
keymap('n', '<leader>rsf', ':call SendFileToR("silent")<cr>', opts) -- Send file to R
keymap('n', '<leader>rsl', ':call SendLineToR("down")<cr>', opts) -- Send line to R and move down
keymap('n', '<leader>rdf', ':call RAction("viewobj", ", howto=\'split\'")<cr>', opts)
keymap('n', '<leader>ro', ':call RObjBrowser()<cr>', opts)
keymap('n', '<leader>rv', ':call RAction("viewobj",)')
-- nnoremap <silent> <leader>rdf :call RAction("viewobj", ", howto='split'")<cr>
-- nnoremap <silent> <leader>ro :call RObjBrowser()<cr>
-- nnoremap <silent> <leader>rq :call RQuit('nosave')<cr> -- Close R
-- nnoremap <silent> <leader>rr :call b:SendChunkToR("silent", "stay")<cr> -- Send Chunk to R
-- nnoremap <silent> <leader>rsc :call b:SendChunkToR("silent", "stay")<cr>
-- nnoremap <silent> <leader>rsl :call SendLineToR("down")<cr> -- Send line to R
-- nnoremap <silent> <leader>rsf :call SendFileToR("silent")<cr> -- Send file to R (R files only)
-- nnoremap <silent> <leader>rn :call RAction("nvim.names")<cr> -- get names/headers in data frame
-- nnoremap <silent> <leader>rh :call RAction("head")<cr>
-- nnoremap <silent> <leader>rp :call RAction("print")<cr>
-- nnoremap <silent> <leader>rs :call RAction("str")<cr>
-- nnoremap <silent> <leader>rdf :call RAction("viewobj", ", howto='split'")<cr>
-- nnoremap <silent> <leader>ro :call RObjBrowser()<cr>


--[[ init.lua ]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
-- LEADER
vim.g.mapleader = ' '
vim.g.localleader = '\\'

require('keys')
require('opts')
require('packerConfig')

require('nvimTreeConfig')
require('lualineConfig')
require('commentConfig')
require('gitsignsConfig')
require('telescopeConfig')
require('treesitterConfig')
require('completionConfig')
require('lspPluginConfig')
require('autopairsConfig')
require('bufferlineConfig')
require('debuggerConfig')
require('formatterConfig')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

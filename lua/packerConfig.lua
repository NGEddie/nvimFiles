require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim' -- Used by other Lua plugins


  -- Colour schemes
  use({ 'dracula/vim', as = 'dracula' })
  use({ 'morhetz/gruvbox' })
  use({ 'EdenEast/nightfox.nvim' })
  use({ 'navarasu/onedark.nvim' }) -- Theme inspired by Atom

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

  use({ 'hrsh7th/nvim-cmp' }) -- The completion plugin
  use({ 'hrsh7th/cmp-buffer' }) -- buffer completions
  use({ 'hrsh7th/cmp-path' }) -- path completions
  use({ 'hrsh7th/cmp-cmdline' }) -- cmdline completions
  use({ 'hrsh7th/cmp-nvim-lsp' }) -- lsp completions
  use({ 'hrsh7th/cmp-nvim-lua' }) -- lsp completions
  use({ 'saadparwaiz1/cmp_luasnip' }) -- snippet completions
  -- use({ 'quangnguyen30192/cmp-nvim-ultisnips' })
  -- use({ 'SirVer/ultisnips' })

  use { 'mhartington/formatter.nvim' }

  -- snippets
  use({ 'L3MON4D3/LuaSnip' }) --snippet engine
  use({ 'rafamadriz/friendly-snippets' }) -- a bunch of snippets to use

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use({ 'tpope/vim-fugitive' })
  use({ 'tpope/vim-rhubarb' })
  use({ 'lewis6991/gitsigns.nvim' })

  use({ 'nvim-lualine/lualine.nvim' }) -- Fancier statusline
  use({ 'lukas-reineke/indent-blankline.nvim' }) -- Add indentation guides even on blank lines
  use({ 'numToStr/Comment.nvim' }) -- "gc" to comment visual regions/lines
  use({ 'tpope/vim-sleuth' }) -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Nvim Tree file explorer
  use({ 'nvim-tree/nvim-web-devicons' })
  use({ 'kyazdani42/nvim-tree.lua' })

  -- Nvim-R (Adds R support)
  use({ 'jalvesaq/Nvim-R' })

  -- Autopairs (Bracket completion)
  use({ 'windwp/nvim-autopairs' })
  use({ 'tpope/vim-surround' })

  -- Bufferline (Buffer headers)
  use({ 'akinsho/bufferline.nvim' })
  use({ 'moll/vim-bbye' })

  -- Toggleterm (Toggles Terminal)
  use({ 'akinsho/toggleterm.nvim' })

  -- Startify
  use({ 'mhinz/vim-startify' })

  -- Rainbow CSV (colourise CSV)
  use({ 'mechatroner/rainbow_csv' })

  -- Debugging
  use({ 'mfussenegger/nvim-dap' }) -- DAP Debugger
  use({ 'rcarriga/nvim-dap-ui' }) -- Debugger UI
  use({ 'mfussenegger/nvim-dap-python' }) -- Python Debugging
end)

-- Automatically source and re-compile packer whenever you save this file
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

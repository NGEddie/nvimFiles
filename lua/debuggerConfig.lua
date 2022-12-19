local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  print('DAP Error')
end

local status_ok2, dapui = pcall(require, 'dapui')
if not status_ok2 then
  print('DAP UI Error')
end

-- Debug Keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<F5>', "<cmd>lua require'dap'.continue()<cr>", opts)
keymap('n', '<F8>', "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap('n', '<F9>', "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap('n', '<F10>', "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap('n', '<leader>d<leader>', "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap('n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap('n', '<leader>dB', "<cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint Condition: '))<cr>", opts)
keymap('n', '<leader>dk', "<cmd>lua require'dapui'.eval()<cr>", opts)

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })

dap.adapters.python = {
  type = 'executable',
  command = '/Users/nigel/.virtualenvs/debugpy/bin/python',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch',
    name = 'Launch file',

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = '${file}', -- This configuration will launch the current file if used.
    console = 'internalConsole',
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end,
  },
}

require('dapui').setup({
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has('nvim-0.7'),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = 'scopes', size = 0.25 },
        'breakpoints',
        -- 'stacks',
        'watches',
      },
      size = 40, -- 40 columns
      position = 'left',
    },
    {
      elements = {
        'repl',
        -- 'console',
      },
      size = 0.25, -- 25% of total lines
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = 'single', -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  },
})

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
-- dap.listeners.before.event_terminated['dapui_config'] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited['dapui_config'] = function()
--   dapui.close()
-- end


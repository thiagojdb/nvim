
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}


dap.configurations.javascript = {
  {
    name = 'Lanuch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processid = require'dap.utils'.pick_process,
  }
}

dap.configurations.typescriptreact = {
  {
    name = 'Lanuch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processid = require'dap.utils'.pick_process,
  }
}

dap.configurations.typescript = {
  {
    name = 'Lanuch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processid = require'dap.utils'.pick_process,
  }
}



dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { '/home/thiago/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js' },
}

--dap.configurations.javascriptreact = { -- change this to javascript if needed
--    {
--        type = "chrome",
--        request = "attach",
--        program = "${file}",
--        cwd = vim.fn.getcwd(),
--        sourceMaps = true,
--        protocol = "inspector",
--        port = 9222,
--        webRoot = "${workspaceFolder}"
--    }
--}

dap.configurations.typescript = { -- change to typescript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

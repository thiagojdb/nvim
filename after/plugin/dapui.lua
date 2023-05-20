local dap = require('dap')
dap.configurations.java = {
  {
    type = 'java',
    request = 'attach',
    name = "Debug (Attach) - Remote",
    hostName = "127.0.0.1",
    processid = require'dap.utils'.pick_process,
  },
}

require("dapui").setup(require('user.dap-config'))
require("nvim-dap-virtual-text").setup()

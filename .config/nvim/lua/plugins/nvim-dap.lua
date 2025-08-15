return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text", -- Shows variable values inline
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- JavaScript/TypeScript adapter
    dap.adapters.node2 = {
      type = "executable",
      command = "node",
      args = { os.getenv("HOME") ..
      "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
    }

    dap.configurations.javascript = {
      {
        name = "Launch",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
      },
    }

    -- Auto-open UI when debugging starts
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
  end
}

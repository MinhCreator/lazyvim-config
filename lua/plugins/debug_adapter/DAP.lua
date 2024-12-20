return {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        local dap = require "dap"
        local dapui = require "dapui"

        require "mason-nvim-dap".setup {
            automatic_setup = true,

            handlers = {},
        }

        dap.adapters.godot = {
            type = "server",
            port = "${port}",
            executable = {
                command = "godot",
                args = { "-d", "${port}" },
            },
            host = "127.0.0.1",
        }

        dap.configurations.gdscript = {
            {
                type = "godot",
                request = "launch",
                name = "Launch Main Scene",
                project = "${workspaceFolder}",
                -- launch_scene = true,
            },
        }

        vim.keymap.set("n", "<C-r>", "", { noremap = true, desc = "Debuging" })
        vim.keymap.set("n", "<C-r><F5>", dap.continue, { noremap = true, desc = "Debug: Start/Continue" })
        vim.keymap.set("n", "F6", function()
            dap.terminate()
            dapui.close()
        end)
        vim.keymap.set("n", "<C-r><F7>", dap.step_over, { noremap = true, desc = "Debug: Step Over" })
        vim.keymap.set("n", "<C-r><F8>", dap.step_into, { noremap = true, desc = "Debug: Step Into" })
        vim.keymap.set("n", "<C-r><F9>", dap.step_out, { noremap = true, desc = "Debug: Step Out" })
        vim.keymap.set("n", "<C-r><F10>", dap.toggle_breakpoint, { noremap = true, desc = "Debug: Toggle Breakpoint" })
        vim.keymap.set("n", "<C-r><F11>", function()
            dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
        end, { noremap = true, desc = "Debug: Toggle Breakpoint" })

        dapui.setup()
    end



}

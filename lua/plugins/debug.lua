return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            
            -- Adaptador GDB
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-i", "dap" }
            }
            
            -- Configuración para C
            dap.configurations.c = {
                {
                    name = "Debug",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        -- Detectar si es proyecto CMake
                        local cmake_build = vim.fn.getcwd() .. "/build/"
                        if vim.fn.isdirectory(cmake_build) == 1 then
                            return vim.fn.input('Executable: ', cmake_build, 'file')
                        else
                            return vim.fn.input('Executable: ', vim.fn.getcwd() .. '/', 'file')
                        end
                    end,
                    cwd = "${workspaceFolder}",
                    args = function()
                        local args = vim.fn.input('Arguments: ')
                        return vim.split(args, " ")
                    end,
                },
            }
            
            -- Configuración para C++ (igual que C)
            dap.configurations.cpp = dap.configurations.c
            
            -- UI con mejor configuración
            dapui.setup({
                icons = { expanded = "▾", collapsed = "▸" },
                mappings = {
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.25 },
                            { id = "breakpoints", size = 0.25 },
                            { id = "stacks", size = 0.25 },
                            { id = "watches", size = 0.25 },
                        },
                        size = 40,
                        position = "left",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 0.25,
                        position = "bottom",
                    },
                },
            })
            
            -- Auto abrir/cerrar UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
            
            -- Keymaps completos para debugging (CAMBIADOS A <leader>D)
            local opts = { noremap = true, silent = true }
            
            -- Teclas de función principales (estas se mantienen igual)
            vim.keymap.set("n", "<F5>", dap.continue, opts)                    -- Start/Continue
            vim.keymap.set("n", "<F6>", function()                            -- Stop y cerrar
                dap.terminate()
                dapui.close()
            end, opts)
            vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, opts)          -- Toggle breakpoint
            vim.keymap.set("n", "<F10>", dap.step_over, opts)                 -- Step over
            vim.keymap.set("n", "<F11>", dap.step_into, opts)                 -- Step into
            vim.keymap.set("n", "<F12>", dap.step_out, opts)                  -- Step out
            
            -- Breakpoints avanzados (CAMBIADO A <leader>D)
            vim.keymap.set("n", "<leader>Db", dap.toggle_breakpoint, opts)    -- Toggle breakpoint
            vim.keymap.set("n", "<leader>Dc", function()                      -- Conditional breakpoint
                dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
            end, opts)
            vim.keymap.set("n", "<leader>Dl", function()                      -- Log point
                dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
            end, opts)
            vim.keymap.set("n", "<leader>DC", dap.clear_breakpoints, opts)    -- Clear all breakpoints
            
            -- Control de ejecución (CAMBIADO A <leader>D)
            vim.keymap.set("n", "<leader>Dr", dap.continue, opts)             -- Continue (cambié de dc a Dr para "run")
            vim.keymap.set("n", "<leader>DR", dap.restart, opts)              -- Restart
            vim.keymap.set("n", "<leader>Dq", function()                      -- Quit
                dap.terminate()
                dapui.close()
            end, opts)
            
            -- Navegación (CAMBIADO A <leader>D)
            vim.keymap.set("n", "<leader>Ds", dap.step_over, opts)            -- Step over
            vim.keymap.set("n", "<leader>Di", dap.step_into, opts)            -- Step into
            vim.keymap.set("n", "<leader>Do", dap.step_out, opts)             -- Step out
            vim.keymap.set("n", "<leader>Dk", dap.up, opts)                   -- Up stack
            vim.keymap.set("n", "<leader>Dj", dap.down, opts)                 -- Down stack
            
            -- UI y ventanas (CAMBIADO A <leader>D)
            vim.keymap.set("n", "<leader>Du", dapui.toggle, opts)             -- Toggle UI
            vim.keymap.set("n", "<leader>Dv", function()                      -- Hover
                require('dap.ui.widgets').hover()
            end, opts)
            vim.keymap.set("n", "<leader>Dp", function()                      -- Preview
                require('dap.ui.widgets').preview()
            end, opts)
            
            -- REPL y evaluación (CAMBIADO A <leader>D)
            vim.keymap.set("n", "<leader>Dt", dap.repl.toggle, opts)          -- Toggle REPL
            vim.keymap.set("v", "<leader>De", function()                      -- Evaluate selection
                dapui.eval()
            end, opts)
            vim.keymap.set("n", "<leader>De", function()                      -- Evaluate expression
                local expr = vim.fn.input('Expression: ')
                dapui.eval(expr)
            end, opts)
            
            -- Funciones útiles adicionales (CAMBIADO A <leader>D)
            vim.keymap.set("n", "<leader>Dw", function()                      -- Add watch
                local expr = vim.fn.input('Watch expression: ')
                if expr ~= "" then
                    dapui.elements.watches.add(expr)
                end
            end, opts)
            
            -- Configurar signos para breakpoints
            vim.fn.sign_define('DapBreakpoint', {
                text = '●',
                texthl = 'DapBreakpoint',
                linehl = '',
                numhl = ''
            })
            vim.fn.sign_define('DapBreakpointCondition', {
                text = '◆',
                texthl = 'DapBreakpointCondition',
                linehl = '',
                numhl = ''
            })
            vim.fn.sign_define('DapLogPoint', {
                text = '◉',
                texthl = 'DapLogPoint',
                linehl = '',
                numhl = ''
            })
            vim.fn.sign_define('DapStopped', {
                text = '→',
                texthl = 'DapStopped',
                linehl = 'DapStoppedLine',
                numhl = ''
            })
            vim.fn.sign_define('DapBreakpointRejected', {
                text = '✗',
                texthl = 'DapBreakpointRejected',
                linehl = '',
                numhl = ''
            })
            
        end,
    },
}

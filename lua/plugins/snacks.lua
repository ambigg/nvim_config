return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            dashboard = {
                enabled = false,
                preset = {
                    header = [[
     ▄▄▄▄    ▒█████   ▄▄▄       ███▄    █ ▓█████
    ▓█████▄ ▒██▒  ██▒▒████▄     ██ ▀█   █ ▓█   ▀
    ▒██▒ ▄██▒██░  ██▒▒██  ▀█▄  ▓██  ▀█ ██▒▒███
    ▒██░█▀  ▒██   ██░░██▄▄▄▄██ ▓██▒  ▐▌██▒▒▓█  ▄
    ░▓█  ▀█▓░ ████▓▒░ ▓█   ▓██▒▒██░   ▓██░░▒████▒
    ░▒▓███▀▒░ ▒░▒░▒░  ▒▒   ▓▒█░░ ▒░   ▒ ▒ ░░ ▒░ ░
    ▒░▒   ░   ░ ▒ ▒░   ▒   ▒▒ ░░ ░░   ░ ▒░ ░ ░  ░
     ░    ░ ░ ░ ░ ▒    ░   ▒      ░   ░ ░    ░
     ░          ░ ░        ░  ░         ░    ░  ░
          ░
  ]],
                }
            },
            input = { enabled = true },
            quickfile = { enabled = true },
            picker = { enabled = true },
        },
        keys = {

            { "<leader>lg", function() require("snacks").lazygit() end,            desc = "Lazygit" },
            { "<leader>rN", function() require("snacks").rename.rename_file() end, desc = "Fast Rename Current File" },
            { "<leader>dB", function() require("snacks").bufdelete() end,          desc = "Delete or Close Buffer" },


            { "<leader>FF", function() require("snacks").picker.files() end,       desc = "Find Files" },
            { "<leader>ps", function() require("snacks").picker.grep() end,        desc = "Grep" },
        }
    },
}

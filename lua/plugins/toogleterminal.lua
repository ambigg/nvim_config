return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "VimEnter",
        keys = {
            { "<leader>T", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
            { "<Esc>",     "<cmd>ToggleTerm<cr>", mode = "t",              desc = "Close terminal" },
        },
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<leader>T]],
                direction = "horizontal",
                size = function(term)
                    if term.direction == "horizontal" then
                        return vim.o.lines * 0.33
                    end
                end,
                start_in_insert = true,
                insert_mappings = false,
                close_on_exit = true,

            })
        end,
    },
}

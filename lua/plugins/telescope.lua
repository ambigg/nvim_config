return {
	"nvim-telescope/telescope.nvim",
	branch = "master", -- using master to fix issues with deprecated to definition warnings 
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.load_extension("fzf")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "Find Connected Words under cursor" })

	end,
}

return {
	"nvim-lua/plenary.nvim", --lua functions that many plugins use
	"TovarishFin/vim-solidity", -- syntax highlighting for Solidity
	"karb94/neoscroll.nvim", -- smooth scrolling without moving cursor

	{
		"christoomey/vim-tmux-navigator",
		keys = {
			{ "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Tmux left" },
			{ "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Tmux down" },
			{ "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Tmux up" },
			{ "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Tmux right" },
		},
	},
	--nvim-autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	--undotree
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
		},
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}, -- usa configuración por defecto
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
		cmd = "Trouble",
		opts = { focus = true },
		keys = {
			{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Workspace diagnostics" },
			{ "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Document diagnostics" },
			{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Quickfix list" },
			{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Location list" },
			{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Todos in trouble" },
		},
	},
	--folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			require("ufo").setup({
				provider_selector = function()
					return { "treesitter", "indent" }
				end,
				open_fold_hl_timeout = 0,
			})

			-- Folding settings
			vim.o.foldenable = true
			vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99

			-- Keymaps
			vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
		end,
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},
	-- indent-blankline.lua
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = {
				enabled = true,
				show_start = true,
				show_end = false,
			},
		},
	},
	-- colorizer.lua
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*", -- todas las extensiones
				css = { rgb_fn = true },
				html = { names = false },
			})
		end,
	},
	-- dressing.lua
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
	},
	-- dropbar.lua
	{
		"Bekaboo/dropbar.nvim",
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
	},
	-- twilight.lua
	{
		"folke/twilight.nvim",
		opts = {
			context = 10,
		},
	},
}

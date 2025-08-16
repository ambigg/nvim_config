return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				python = { "black", "isort" },
				rust = { "rustfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				ruby = { "rubocop" },
				go = { "gofmt" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({ lsp_fallback = true })
		end, { desc = "Format file or range" })
	end,
}

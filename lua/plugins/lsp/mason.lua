return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"html",
				"cssls",
				"tailwindcss",
				"marksman",
				"rust_analyzer",
				"pyright",
				"ts_ls", -- Cambiado de tsserver a ts_ls
				"denols",
				"jdtls",
				"solidity_ls",
				"clangd",
				"asm_lsp",
				"solargraph",
				"gopls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"pylint", -- python linter
				"rustfmt", -- rust formatter
				"solhint", -- solidity linter
				"eslint_d", -- js linter
				"checkstyle", -- java linter
				"clang-format", -- c/c++ formatter
				"cpplint", -- c/c++ linter
				"rubocop", -- ruby linter
				"golangci-lint", -- go linter
			},
		})
	end,
}

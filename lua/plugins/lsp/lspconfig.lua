return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- NOTE: LSP Keybinds
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings
				local opts = { buffer = ev.buf, silent = true }

				-- keymaps
				opts.desc = "Show LSP references"
				vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, opts)

				opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "<leader>,", vim.diagnostic.open_float, opts)

				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- Define sign icons for each severity
		local signs = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		}

		-- Set the diagnostic config with all icons
		vim.diagnostic.config({
			signs = {
				text = signs,
			},
			virtual_text = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		-- Setup servers
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- lua_ls
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- HTML
		lspconfig.html.setup({
			capabilities = capabilities,
		})

		-- CSS
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		-- TailwindCSS
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		-- Markdown
		lspconfig.marksman.setup({
			capabilities = capabilities,
		})

		-- Rust
		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		})

		-- Solidity
		lspconfig.solidity_ls.setup({
			capabilities = capabilities,
		})

		-- Python
		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		-- Java
		lspconfig.jdtls.setup({
			capabilities = capabilities,
		})

		-- Deno (for Deno projects)
		lspconfig.denols.setup({
			capabilities = capabilities,
			root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
		})

		-- TypeScript/JavaScript (for Node.js projects)
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			root_dir = function(fname)
				local util = lspconfig.util
				return not util.root_pattern("deno.json", "deno.jsonc")(fname)
					and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
			end,
			single_file_support = false,
			init_options = {
				preferences = {
					includeCompletionsWithSnippetText = true,
					includeCompletionsForImportStatements = true,
				},
			},
		})

		-- C/C++
		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = { "clangd", "--background-index", "--clang-tidy" },
			filetypes = { "c", "cpp", "objc", "objcpp" },
			settings = {
				clangd = {
					fallbackFlags = { "-std=c++17" },
				},
			},
		})

		-- Assembly (opcional - no todos los dialectos tienen LSP)
		lspconfig.asm_lsp.setup({
			capabilities = capabilities,
			filetypes = { "asm", "s", "S" },
		})
		-- Ruby
		lspconfig.solargraph.setup({
			capabilities = capabilities,
			settings = {
				solargraph = {
					diagnostics = true,
					completion = true,
				},
			},
		})

		-- Go
		lspconfig.gopls.setup({
			capabilities = capabilities,
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					gofumpt = true,
				},
			},
		})
	end,
}

-- Configuración minimalista para nvim-tree
return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			-- Desactivar netrw (explorador de archivos nativo de vim)
			disable_netrw = true,
			hijack_netrw = true,

			-- Vista y apariencia
			view = {
				width = 30,
				side = "left",
				number = false,
				relativenumber = false,
			},

			-- Renderizado
			renderer = {
				highlight_git = false,
				highlight_opened_files = "none",
				root_folder_label = false,
				indent_markers = {
					enable = false,
				},
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = false,
					},
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_closed = "▶",
							arrow_open = "▼",
							default = "📁",
							open = "📂",
							empty = "📁",
							empty_open = "📂",
							symlink = "🔗",
						},
					},
				},
			},

			-- Filtros
			filters = {
				dotfiles = false,
				custom = { ".git", "node_modules", ".cache" },
			},

			-- Git
			git = {
				enable = false,
			},

			-- Acciones
			actions = {
				open_file = {
					quit_on_open = false,
					resize_window = true,
				},
			},

			-- Desactivar diagnósticos
			diagnostics = {
				enable = false,
			},
		})

		-- Keymaps básicos
		vim.keymap.set("n", "<C-a>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
	end,
}

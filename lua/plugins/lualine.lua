return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local colors = {
			color0 = "#092236",
			color1 = "#ff5874",
			color2 = "#c3ccdc",
			color3 = "#ff587460", -- Rojo menos transparente para el fondo
			color6 = "#a1aab8",
			color7 = "#3a7bd5",
			color8 = "#ae81ff",
		}
		local my_lualine_theme = {
			replace = {
				a = { fg = colors.color0, bg = colors.color1, gui = "bold" },
				b = { fg = colors.color2, bg = colors.color3 },
			},
			inactive = {
				a = { fg = colors.color6, bg = colors.color3, gui = "bold" },
				b = { fg = colors.color6, bg = colors.color3 },
				c = { fg = colors.color6, bg = colors.color3 },
			},
			normal = {
				a = { fg = colors.color0, bg = colors.color7, gui = "bold" },
				b = { fg = colors.color2, bg = colors.color3 },
				c = { fg = colors.color2, bg = colors.color3 },
			},
			visual = {
				a = { fg = colors.color0, bg = colors.color8, gui = "bold" },
				b = { fg = colors.color2, bg = colors.color3 },
			},
			insert = {
				a = { fg = colors.color0, bg = "#eb6f92", gui = "bold" },
				b = { fg = colors.color2, bg = colors.color3 },
			},
		}

		local separators = {
			right = "",
		}
		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str:sub(1, 1):upper() .. str:sub(2) .. " "
			end,
			separator = { right = separators.right },
		}
		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			-- cond = hide_in_width,
		}
		local filename = {
			"filename",
			file_status = true,
			path = 1,
            shorting_target = 40,
		}
		local branch = { "branch", icon = { "", color = { fg = "#A6D4DE" } }, "|" }
		lualine.setup({
			icons_enabled = true,
			options = {
				theme = my_lualine_theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding", separator = "", color = { fg = "#F0F8FF" } },
					{ "fileformat", separator = "", color = { fg = "#F0F8FF" } },
					{ "filetype", separator = "", color = { fg = "#F0F8FF" } },
				},
			},
		})
	end,
}

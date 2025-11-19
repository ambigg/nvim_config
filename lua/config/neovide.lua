-- Configuración de Neovide
if vim.g.neovide then
	-- ========== ANIMACIONES DEL CURSOR ==========
	vim.g.neovide_cursor_animation_length = 0.05 -- Duración (más bajo = más rápido)
	vim.g.neovide_cursor_trail_size = 0.4 -- Estela del cursor
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_animate_command_line = true

	-- Efectos visuales del cursor (prueba cada uno)
	vim.g.neovide_cursor_vfx_mode = "ripple"
	-- Opciones: "railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe", ""

	vim.g.neovide_cursor_vfx_opacity = 200.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
	vim.g.neovide_cursor_vfx_particle_density = 7.0

	-- ========== SCROLL SUAVE ==========
	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_scroll_animation_far_lines = 1

	-- ========== VISUAL ==========
	vim.g.neovide_opacidi = 1.0 -- 1.0 = opaco, 0.0 = transparente
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5

	-- ========== FUENTE ==========
	-- Cambia según tu fuente instalada
	vim.o.guifont = "JetBrainsMono Nerd Font:h13"
	-- Otras opciones:
	-- vim.o.guifont = "FiraCode Nerd Font:h13"
	-- vim.o.guifont = "Hack Nerd Font:h13"

	-- ========== RENDIMIENTO ==========
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_no_idle = false

	-- ========== COMPORTAMIENTO ==========
	vim.g.neovide_fullscreen = false
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_confirm_quit = true

	-- ========== PADDING ==========
	vim.g.neovide_padding_top = 5
	vim.g.neovide_padding_bottom = 5
	vim.g.neovide_padding_right = 5
	vim.g.neovide_padding_left = 5

	-- ========== ATAJOS DE TECLADO ==========
	-- Fullscreen toggle
	vim.keymap.set("n", "<D-CR>", function()
		vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
	end, { desc = "Toggle fullscreen" })

	-- Zoom
	vim.keymap.set("n", "<D-+>", function()
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
	end, { desc = "Zoom in" })

	vim.keymap.set("n", "<D-->", function()
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
	end, { desc = "Zoom out" })

	vim.keymap.set("n", "<D-0>", function()
		vim.g.neovide_scale_factor = 1.0
	end, { desc = "Reset zoom" })
end

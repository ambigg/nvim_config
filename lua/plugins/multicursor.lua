return { {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()
        local set = vim.keymap.set

        -- Add or skip cursor above/below the main cursor (usando Alt para evitar conflictos)
        set({ "n", "x" }, "<A-k>", function() mc.lineAddCursor(-1) end)
        set({ "n", "x" }, "<A-j>", function() mc.lineAddCursor(1) end)
        set({ "n", "x" }, "<leader><A-k>", function() mc.lineSkipCursor(-1) end)
        set({ "n", "x" }, "<leader><A-j>", function() mc.lineSkipCursor(1) end)

        -- Add or skip adding a new cursor by matching word/selection (prefijo <leader>m para multicursor)
        set({ "n", "x" }, "<leader>mn", function() mc.matchAddCursor(1) end)
        set({ "n", "x" }, "<leader>ms", function() mc.matchSkipCursor(1) end)
        set({ "n", "x" }, "<leader>mN", function() mc.matchAddCursor(-1) end)
        set({ "n", "x" }, "<leader>mS", function() mc.matchSkipCursor(-1) end)

        -- Add and remove cursors with control + left click (sin cambios)
        set("n", "<c-leftmouse>", mc.handleMouse)
        set("n", "<c-leftdrag>", mc.handleMouseDrag)
        set("n", "<c-leftrelease>", mc.handleMouseRelease)

        -- Disable and enable cursors (cambiado para evitar conflictos)
        set({ "n", "x" }, "<leader>mt", mc.toggleCursor)

        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        mc.addKeymapLayer(function(layerSet)
            -- Select a different cursor as the main one (usando h/l en lugar de left/right)
            layerSet({ "n", "x" }, "h", mc.prevCursor)
            layerSet({ "n", "x" }, "l", mc.nextCursor)

            -- Delete the main cursor
            layerSet({ "n", "x" }, "<leader>mx", mc.deleteCursor)

            -- Enable and clear cursors using escape
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)

        -- Customize how cursors look
        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { reverse = true })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn" })
        hl(0, "MultiCursorMatchPreview", { link = "Search" })
        hl(0, "MultiCursorDisabledCursor", { reverse = true })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end
} }

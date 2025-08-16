return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            -- Ventana más estética
            window = {
                completion = {
                    border = "rounded",
                    winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
                    scrollbar = false,
                    col_offset = -3,
                    side_padding = 1,
                },
                documentation = {
                    border = "rounded",
                    winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder",
                    max_width = 80,
                    max_height = 12,
                },
            },

            -- Formateo más limpio
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end,
            },

            -- Mapeo de teclas
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            }),

            -- Fuentes más selectivas (solo LSP y path)
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
            }),

            -- Comportamiento más sutil
            completion = {
                completeopt = "menu,menuone,noinsert",
            },

            -- Configuración experimental
            experimental = {
                ghost_text = false, -- Sin texto fantasma
            },
        })

        -- Colores personalizados para mejor apariencia
        vim.cmd([[
            highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
            highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
            highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
            highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
            highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
            highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
            highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
            highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
            highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
        ]])
    end,
}

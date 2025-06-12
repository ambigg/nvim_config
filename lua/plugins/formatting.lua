return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                -- JavaScript/TypeScript ecosystem
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                
                -- Web technologies
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                
                -- Lua (for Neovim config)
                lua = { "stylua" },
                
                -- Python
                python = { "black" },
                
                -- Rust
                rust = { "rustfmt" },
                
                -- Java
                java = { "google-java-format" },
                
                -- Solidity
                solidity = { "forge_fmt" },
            },
            -- Uncomment if you want auto-format on save
            -- format_on_save = {
            --     lsp_fallback = true,
            --     async = false,
            --     timeout_ms = 1000,
            -- },
        })

        -- Configure Prettier with your preferences
        conform.formatters.prettier = {
            args = {
                "--stdin-filepath",
                "$FILENAME",
                "--tab-width",
                "4",
                "--use-tabs",
                "false",
            },
        }

        -- Configure Black for Python
        conform.formatters.black = {
            prepend_args = { "--line-length", "88" },
        }

        -- Configure rustfmt
        conform.formatters.rustfmt = {
            prepend_args = { "--edition", "2021" },
        }

        -- Format keymap
        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range" })
    end,
}

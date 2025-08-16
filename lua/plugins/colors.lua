local function enable_transparency()
    local groups = {
        "Normal", "NormalNC", "NormalFloat", "FloatBorder",
        "SignColumn", "VertSplit", "StatusLine", "LineNr", "EndOfBuffer"
    }
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
end

return {
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        config = function()
            require("tokyonight").setup({
                style = "night", -- "storm", "moon", "night", or "day"
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
            vim.cmd.colorscheme "tokyonight"
            enable_transparency()
        end,
    },
}

local function enable_transparency()
    local groups = { "Normal", "NormalNC", "NormalFloat", "FloatBorder", "SignColumn", "VertSplit", "StatusLine",
        "LineNr", "EndOfBuffer" }
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
end
return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "main",
                disable_background = true,
                disable_float_background = true,
            })
            vim.cmd.colorscheme "rose-pine"
            enable_transparency()
        end,
    },
    
}

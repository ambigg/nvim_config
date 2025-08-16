return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('dashboard').setup({
            theme = 'hyper',
            config = {
                header = {
                    "",
                    "░▒▓███████▓▒░░▒▓████████▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓██████████████▓▒░",
                    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
                    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
                    "░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
                    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
                    "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
                    "░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓██████▓▒░   ░▒▓██▓▒░  ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░",
                    "                                                                               ",
                    "                                                                               ",
                },
                week_header = {
                    enable = false,
                },
                shortcut = {
                    {
                        icon = '󰊳 ',
                        desc = 'update',
                        group = '@property',
                        action = 'Lazy update',
                        key = 'u',
                    },
                    {
                        icon = ' ',
                        icon_hl = '@variable',
                        desc = 'files',
                        group = 'label',
                        action = 'Telescope find_files',
                        key = 'f',
                    },
                    {
                        icon = ' ',
                        desc = 'apps',
                        group = 'diagnostichint',
                        action = 'Telescope app',
                        key = 'a',
                    },
                    {
                        icon = ' ',
                        desc = 'dotfiles',
                        group = 'number',
                        action = 'Telescope dotfiles',
                        key = 'd',
                    },
                },
                project = {
                    enable = true,
                    limit = 8,
                    icon = ' ',
                    label = ' projects:',
                    action = 'Telescope find_files cwd=',
                },
                mru = {
                    enable = true,
                    limit = 10,
                    icon = ' ',
                    label = ' recent files:',
                    cwd_only = false,
                },
                footer = { '',
                },
            },
        })
        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#c94f4f" })
    end
}

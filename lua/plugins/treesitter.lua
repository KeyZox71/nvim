return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ':TSUpdate', 
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "lua", "c", "nix" },
                highlight = {
                    enable = true,
                    use_languagetree = true,
                },
                indent = { enable = true },
            }
        end,
    },
    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        config = function()
        end,
    }
}

return {
    "TobinPalmer/Tip.nvim",
    event = "VeryLazy",
    init = function()
        require("tip").setup({
            seconds = 2,
            title = "Tip!",
            url = "https://vtip.43z.one", -- Or https://vimiscool.tech/neotip
        })
    end,
}

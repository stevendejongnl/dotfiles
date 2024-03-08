return {
    "nvimdev/dashboard-nvim",
    enabled = true,
    event = "VimEnter",
    config = function()
        require("dashboard").setup {
            theme = "hyper"
        }
        vim.keymap.set("n", "<C-q>", vim.cmd.Dashboard)
    end,
}

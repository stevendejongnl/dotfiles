return {
    "nvimdev/dashboard-nvim",
    enabled = true,
    event = "VimEnter",
    config = function()
        require("dashboard").setup {
            theme = "doom"
        }
        vim.keymap.set("n", "<C-q>", vim.cmd.Dashboard)
    end,
}

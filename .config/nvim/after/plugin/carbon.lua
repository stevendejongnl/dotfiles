local carbon = require('carbon-now')
carbon.setup({
  options = {
    bg = "#1F816D",
    padding_horizontal = "56px",
    drop_shadow = false,
    drop_shadow_offset_y = "20px",
    drop_shadow_blur_radius = "68px",
    theme = "night-owl",
    window_theme = "none",
    font_family = "Hack",
    font_size = "14px",
    line_height = "143%",
    window_controls = false,
    width_adjustment = true,
    line_numbers = false,
    first_line_number = 1,
    export_size = "2x",
    watermark = false,
    squared_image = false,
    hidden_characters = false,
    width = 680,
  }
})

vim.keymap.set("v", "<leader>cs", ":CarbonNow<CR>", { silent = true })


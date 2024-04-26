return {
  "numToStr/Comment.nvim",
  enabled = true,
  event = "VeryLazy",
  config = function()
    require('Comment').setup()
  end
}

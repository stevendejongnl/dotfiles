return {
  "numToStr/Comment.nvim",
  enabled = true,
  event = "InsertLazy",
  config = function()
    require('Comment').setup()
  end
}

return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.defaults["<leader>t"] = { name = "+terminal" }
  end,
}

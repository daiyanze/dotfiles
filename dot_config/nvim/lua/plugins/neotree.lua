-- Override existing plugin
return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function(_, opts)
    opts.window = {
      width = 35,
    }

    require("neo-tree").setup(opts)
  end,
}

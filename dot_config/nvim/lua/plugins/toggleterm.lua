return {
  "akinsho/toggleterm.nvim",
  lazy = false,
  keys = {
    { "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", desc = "ToggleTerm vertical split" },
    { "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", desc = "ToggleTerm horizontal split" },
  },
  config = function(_, opts)
    opts.size = function(term)
      if term.direction == "horizontal" then
        return 10
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end

    require("toggleterm").setup(opts)
  end,
}

return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  opts = {
    bottom = {
      ft = "toggleterm",
      size = { height = 0.4 },
      filter = function(_, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
  },
  keys = {
    keys = {
      -- increase width
      ["<C-Right>"] = function(win)
        win:resize("width", 2)
      end,
      -- decrease width
      ["<C-Left>"] = function(win)
        win:resize("width", -2)
      end,
      -- increase height
      ["<C-Up>"] = function(win)
        win:resize("height", 2)
      end,
      -- decrease height
      ["<C-Down>"] = function(win)
        win:resize("height", -2)
      end,
    },
  },
}

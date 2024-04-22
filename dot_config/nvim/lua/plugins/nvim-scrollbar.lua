return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  config = function()
    require("scrollbar").setup({
      handle = {
        color = "#46413e",
      },
      marks = {
        Search = { color = "#f28534" },
        Error = { color = "#db4740" },
        Warn = { color = "#e9b143" },
        Info = { color = "#80aa9e" },
        Hint = { color = "#b0b846" },
        Misc = { color = "#d3869b" },
      },
    })
  end,
}

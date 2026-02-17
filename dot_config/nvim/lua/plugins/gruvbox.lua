return {
  -- add gruvbox
  { "sainnhe/gruvbox-material" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}

-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({
--       transparent_mode = true,
--       contrast = "soft",
--     })
--     vim.o.background = "dark" -- or "light" for light mode
--     vim.cmd([[colorscheme gruvbox]])
--   end,
-- }

-- return {
--   "f4z3r/gruvbox-material.nvim",
--   name = "gruvbox-material",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     colorscheme = "gruvbox-material",
--     contrast = "medium",
--   },
-- }

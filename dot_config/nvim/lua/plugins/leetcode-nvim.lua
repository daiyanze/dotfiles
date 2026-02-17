---Get highlight group value by name.
---
---@param name string String for looking up highlight group.
---@return table
local function hl(name)
  local highlight = vim.api.nvim_get_hl(0, { name = name, link = false })
  setmetatable(highlight, {
    __index = function(self, key)
      if key == "bg" then
        return self.background
      end
      if key == "fg" then
        return self.foreground
      end

      return nil
    end,
  })

  return highlight
end

return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    -- include a picker of your choice, see picker section for more details
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- optional
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- configuration goes here
    lang = "javascript", -- preferred language
    theme = {
      -- ["alt"] = {
      --   bg = "#FFFFFF",
      -- },
      ["normal"] = {
        fg = hl("Normal").bg,
        italic = true,
      },
      ["code"] = {
        bg = hl("StatusLineNC").bg,
      },
    },
  },
  cmd = "Leet",
}

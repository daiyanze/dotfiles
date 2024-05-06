-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Open neo-tree on startup
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("open_neo_tree_on_start"),
  callback = function()
    if package.loaded["neo-tree"] then
      return true
    else
      local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(0)) -- TODO: REMOVE vim.loop WHEN DROPPING SUPPORT FOR Neovim v0.9
      if stats and stats.type == "directory" then
        require("lazy").load({ plugins = { "neo-tree.nvim" } })
        return true
      end
    end
  end,
})

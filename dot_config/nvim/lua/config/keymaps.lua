-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- comment with "/"
vim.keymap.set("v", "<leader>/", "gc", { desc = "comment linewise", remap = true })
vim.keymap.set("n", "<leader>/", "gcc", { desc = "comment linewise", remap = true })

-- Move cursor in insert mode
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "move down" })
-- FIXME: There's conflict with the <C-k>, it's trying to display the signature of the current cursor
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "move up", remap = true })

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "move line/block down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "move line/block up" })

-- toggleterm shortcut keys
vim.keymap.set("n", "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", { desc = "ToggleTerm vertical split" })
vim.keymap.set("n", "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", { desc = "ToggleTerm horizontal split" })

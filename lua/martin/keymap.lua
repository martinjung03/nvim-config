vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- my save
vim.keymap.set("n", "<C-s>", vim.cmd.write)

-- my quite
vim.keymap.set("n", "<leader>q", vim.cmd.q)

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")



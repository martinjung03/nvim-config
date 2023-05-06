vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- my save
vim.keymap.set("n", "<leader>w", vim.cmd.write)

-- my quit
vim.keymap.set("n", "<leader>q", vim.cmd.q)

-- This is going to get me cancelled
-- on top of the better escape plugin
vim.keymap.set("i", "<C-c>", "<Esc>")

-- buffer move
vim.keymap.set("n", "<C-b>n", vim.cmd.bnext)
vim.keymap.set("n", "<C-b>p", vim.cmd.bprevious)

-- git
vim.keymap.set("n", "<leader>gl", vim.cmd.LazyGit)


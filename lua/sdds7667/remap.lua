vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", vim.cmd.Oil, { desc = "Oil" })
vim.keymap.set("n", "<S-tab>", vim.cmd.bprev, {desc = "Prev buffer"})
vim.keymap.set("n", "<tab>", vim.cmd.bnext, {desc = "Prev buffer"})
vim.keymap.set("n", "<leader>rs", "<cmd>:let @a=@\"<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>:terminal<CR>")

-- Neovide utilities
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>")

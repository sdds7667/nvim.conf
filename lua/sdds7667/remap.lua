vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", vim.cmd.Oil, { desc = "Oil" })
vim.keymap.set("n", "<leader><Left>", vim.cmd.bprev, {desc = "Prev buffer"})
vim.keymap.set("n", "<leader><Right>", vim.cmd.bnext, {desc = "Next buffer"})

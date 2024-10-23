
local telescope = require("telescope")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fa", builtin.find_files, {desc = "Find [A]ll files"})
vim.keymap.set("n", "<leader>ff", builtin.git_files,  {desc = "Find Git [f]iles"})
vim.keymap.set("n", "<leader>fw", builtin.live_grep,  {desc = "Live Grep Project"})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles,  {desc = "[o]ld files"})
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {desc = "Find Fu[z]zy the current buffer"})
vim.keymap.set("n", "<leader>b", builtin.buffers, {desc = "Find in opened [b]uffers"})

vim.keymap.set("n", "<leader>th", builtin.colorscheme, {desc="Theme!"})

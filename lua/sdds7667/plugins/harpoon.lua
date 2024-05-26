
local harpoon = require("harpoon")
harpoon.setup()
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


vim.keymap.set("n", "<leader>ha", mark.add_file, {desc="[h]arpoon [a]dd"})
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, {desc="[h]arpoon list"})
vim.keymap.set("n", "<leader>hj", function() ui.nav_file(1) end, {desc="[h]arpoon 1st file"})
vim.keymap.set("n", "<leader>hk", function() ui.nav_file(2) end, {desc="[h]arpoon 2nd file"})
vim.keymap.set("n", "<leader>hl", function() ui.nav_file(3) end, {desc="[h]arpoon 3rd file"})
vim.keymap.set("n", "<leader>h;", function() ui.nav_file(4) end, {desc="[h]arpoon 4th file"})

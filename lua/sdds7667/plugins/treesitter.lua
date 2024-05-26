
local treesitter = require("nvim-treesitter")
local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = {"c", "cpp", "lua", "vim", "vimdoc", "query", "python", "javascript", "typescript"},
	auto_install = true,
    highlight = {
        enable = true
    }
})

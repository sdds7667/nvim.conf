local plugins = {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        keys = {
            "<leader>f", "<leader>th"
        },
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("sdds7667.plugins.telescope")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("sdds7667.plugins.treesitter")
        end
    },
    {
        "theprimeagen/harpoon",
        keys = { "<leader>h" },
        config = function()
            -- require("sdds7667.plugins.harpoon")
        end
    },
    {
        "smoka7/hop.nvim",
        version = '*',
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        },
        config = function()
            require("sdds7667.plugins.hop")
        end
    },
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    { 'williamboman/mason.nvim',          config = function() require("mason").setup() end },
    { 'williamboman/mason-lspconfig.nvim' },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function() require("sdds7667.plugins.lsp") end,
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/nvim-cmp' },
            {
                'L3MON4D3/LuaSnip',
                dependencies = { "rafamadriz/friendly-snippets" },
                config = function()
                    require("sdds7667.plugins.lua_snip")
                end
            },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "BufReadPost",
        config = function()
            local ibl = require("ibl")
            local hooks = require("ibl.hooks")
            ibl.setup()
            hooks.register(hooks.type.WHITESPACE,
                hooks.builtin.hide_first_space_indent_level)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "󰍵" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "│" },
                },
            })
        end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
            require("nvim-autopairs").setup(opts)

            -- setup cmp for autopairs
            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },

    {
        'numToStr/Comment.nvim',
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        config = function()
            local comment = require("Comment.api")
            vim.keymap.set("n", "<leader>/", function()
                comment.toggle.linewise.current()
            end)
            vim.keymap.set("v", "<leader>/",
                "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
        end
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        {
            "nvimtools/hydra.nvim",
            config = function()
                require("sdds7667.plugins.hydra_harpoon")
            end
        }
    },
    {
        {
            "stevearc/dressing.nvim",
            opts = {

            }
        }
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup {}
        end

    },
    {
        "kylechui/nvim-surround",
        event = { "BufReadPost", "BufNewFile" },
        version = "*",
        config = true
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup()
        end
    },
    {
        "github/copilot.vim",
        enabled = false,
        event = 'InsertEnter',
        init = function()
            vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
        end,
        config = function()
            vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            require("sdds7667.plugins.noice")
        end
    },

    {
        'https://gitlab.com/itaranto/preview.nvim',
        version = '*',
        config = function() require('preview').setup({
        }) end,
    }
}
local themes = require("sdds7667.plugins.themes")
for _, value in ipairs(themes) do
    table.insert(plugins, value)
end

return plugins

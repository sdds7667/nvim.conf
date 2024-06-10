local lsp_zero = require('lsp-zero')
local server = require("lsp-zero.server")
lsp_zero.extend_lspconfig()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ["<Down>"] = cmp.mapping.scroll_docs(-4),
        ["<Up>"] = cmp.mapping.scroll_docs(4),

    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
    },
})



lsp_zero.on_attach(function(client, bufnr)
    ---@param mode string
    local map = function(mode, keys, cmd, desc)
        local opts = {
            buffer = bufnr,
            remap = false,
            desc = desc
        }
        vim.keymap.set(mode, keys, cmd, opts)
    end

    map("n", "<C-h>", "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover documentation")
    map("i", "<C-h>", "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover documentation")

    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration")
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to implentation")
    map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go to type definition")

    map("n", "<leader>re", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol")
    map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show function signature")
    map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Actions")
    map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Actions")
    map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format File")
    map("n", "<leader>lf", "<cmd>lua vim.diagnostic.open_float { border = \"rounded\" }<cr>", "Floating diagnostic")
    
end)

-- here you can setup the language servers
lsp_zero.setup_servers({ 'rust_analyzer', "clangd", "svelte", "tsserver" })


server.setup("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
});

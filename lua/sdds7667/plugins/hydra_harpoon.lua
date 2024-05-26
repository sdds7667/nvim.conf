local Hydra = require("hydra")
local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


Hydra(
    {
        name = "Harpoon",
        mode = "n",
        body = "<leader>h",
        hint = [[
_j_:%{func_for_j}
_k_:%{func_for_k}
_l_:%{func_for_l}
_;_:%{func_for_semicolumn}
]],

        heads = {
            {
                "j",
                function()
                    ui.nav_file(1)
                end,
                {
                    exit = true,
                    desc = "First File from harpoon"
                },
            },
            {
                "k",
                function()
                    ui.nav_file(2)
                end,
                {
                    exit = true,
                    desc = "First File from harpoon"
                },
            },
            {
                "l",
                function()
                    ui.nav_file(3)
                end,
                {
                    exit = true,
                    desc = "First File from harpoon"
                },
            },
            {
                ";",
                function()
                    ui.nav_file(4)
                end,
                {
                    exit = true,
                    desc = "First File from harpoon"
                },
            },
            {
                "h",
                function()
                    ui.toggle_quick_menu()
                end,
                {
                    exit = true,
                    desc = "Harpoon List"
                }
            },
            {
                "a",
                function()
                    mark.add_file()
                end,
                {
                    exit = true,
                    desc = "Add to harpoon list"
                }
            }

        },
        config = {
            invoke_on_body = true,
            hint = {
                position = "middle",
                float_opts = {
                    style = nil,
                    border = "rounded",
                },
                funcs = {
                    ["func_for_j"] = function()
                        assert(harpoon ~= nil)
                        local len = table.maxn(harpoon.get_mark_config().marks)
                        if (len < 1) then
                            return ""
                        else
                            return (mark.get_marked_file_name(1))
                        end
                    end,
                    ["func_for_k"] = function()
                        assert(harpoon ~= nil)
                        local len = table.maxn(harpoon.get_mark_config().marks)
                        if (len < 2) then
                            return ""
                        else
                            return (mark.get_marked_file_name(2))
                        end
                    end,

                    ["func_for_l"] = function()
                        assert(harpoon ~= nil)
                        local len = table.maxn(harpoon.get_mark_config().marks)
                        if (len < 3) then
                            return ""
                        else
                            return (mark.get_marked_file_name(3))
                        end
                    end,

                    ["func_for_semicolumn"] = function()
                        assert(harpoon ~= nil)
                        local len = table.maxn(harpoon.get_mark_config().marks)
                        if (len < 4) then
                            return ""
                        else
                            return (mark.get_marked_file_name(4))
                        end
                    end
                }
            },
            on_enter = function()
            end
        }

    })
Hydra.setup({

    hint = {
        show_name = true,
    }
})

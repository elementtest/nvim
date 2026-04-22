local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
    s({ trig = "bbbrrrtest", name = "Red Border & Save" }, {
        t("border: 3px solid red;")
    }, {
        callbacks = {
            [-1] = {
                [require("luasnip.util.events").enter] = function()
                    vim.cmd("write")
                end
            }
        }
    }),
}


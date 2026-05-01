local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {
    s({ trig = "ffnncall", name = "Function + Call" }, {
        t("function "), i(1, "myFunction"), t("("), i(2, "args"), t({ ") {", "\t" }),
        i(3, "// body"),
        t({ "", "}", "", "" }),
        rep(1), t("("), i(4, ""), t(")"),
    }),
}

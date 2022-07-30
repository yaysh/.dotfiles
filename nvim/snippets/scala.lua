local ls = require('luasnip')
local s = ls.s
local i = ls.i
local t = ls.t

local fmt = require('luasnip.extras.fmt').fmt

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })

local forComprehensionSnippet = s("for", fmt(
    [[
def {}({}) = for {{
    {}
}} yield ({})
]], {
    i(1, ""),
    i(2, ""),
    i(3, ""),
    i(4, ""),
}))
table.insert(snippets, forComprehensionSnippet)
return snippets, autosnippets

local ls = require('luasnip')
local s = ls.s
local i = ls.i
local t = ls.t
local r = require("luasnip.extras").rep
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


local zioRepo = s("zrepo", fmt(
    [[
import io.getquill.jdbczio.Quill
import zio.{{ZIO, ZLayer}}
import java.sql.SQLException
import io.getquill._

case class {}(id: Int)

case class {}Service(quill: Quill.Postgres[SnakeCase]) {{
  import quill.*
  def getAll: ZIO[{}Service, SQLException, List[{}] ] = run(query[{}])
}}

object {}Service {{
  def get{}: ZIO[{}Service, SQLException, List[{}] ] =
    ZIO.serviceWithZIO[{}Service](_.getAll)
  val live = ZLayer.fromFunction(new {}Service(_))
}}
]], {
    i(1, ""),
    r(1),
    r(1),
    r(1),
    r(1),
    r(1),
    r(1),
    r(1),
    r(1),
    r(1),
    r(1),
}))
table.insert(snippets, forComprehensionSnippet)
table.insert(snippets, zioRepo)
return snippets, autosnippets

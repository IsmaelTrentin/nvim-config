-- ~/.config/nvim/snippets/javascript.lua or typescript.lua (or define inline in config)
local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('log', {
    t 'console.log(',
    i(1),
    t ');',
  }),
}

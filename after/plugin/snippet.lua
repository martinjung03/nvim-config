local ls = require('luasnip')

local M = {}

function M.expand_or_jump()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end

function M.jump_next()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end

function M.jump_prev()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end

function M.change_choice()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end

local set = vim.keymap.set
local mode = { 'i', 's' }
set(mode, '<c-i>', M.expand_or_jump)
set(mode, '<c-n>', M.jump_prev)
set(mode, '<c-l>', M.change_choice)

-- custom snippet
local s = ls.snippet
local t = ls.text_node
ls.add_snippets("all", {
  s("hh", t("hello martin")),
})

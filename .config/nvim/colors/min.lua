-- min colorscheme

-- Extend default colorscheme default
vim.cmd.colorscheme("default")
vim.g.colors_name = "min"

local hi = function(name, val)
	-- Force links
	val.force = true
	-- Make sure that `cterm` attribute is not populated from `gui`
	val.cterm = val.cterm or {} ---@type vim.api.keyset.highlight
	-- Define global highlight
	vim.api.nvim_set_hl(0, name, val)
end

-- :hl-Normal
-- :group-name
hi("Comment", { fg = "gray", ctermfg = "gray" })
hi("String", { link = "Normal" })
hi("Identifier", { link = "Normal" })
hi("Function", { link = "Normal" })
hi("Statement", { link = "Normal" })
hi("Conditional", { link = "Normal" })
hi("Repeat", { link = "Normal" })
hi("Label", { link = "Normal" })
hi("Keyword", { link = "Normal" })
hi("Delimiter", { link = "Normal" })
hi("Exception", { link = "Normal" })
hi("Todo", { link = "Normal" })

-- Text
hi("@markup.raw", { link = "Comment" })
hi("@markup.link", { link = "Identifier" })
hi("@markup.heading", { link = "Title" })
hi("@markup.link.url", { link = "Underlined" })
hi("@markup.underline", { link = "Underlined" })
hi("@comment.todo", { link = "Todo" })

-- Miscs
hi("@comment", { link = "Comment" })
hi("@punctuation", { link = "Delimiter" })

-- Constants
-- hi('@constant',          { link = 'Constant' })
-- hi('@constant.builtin',  { link = 'Special' })
-- hi('@constant.macro',    { link = 'Define' })
-- hi('@keyword.directive', { link = 'Define' })
-- hi('@string',            { link = 'String' })
-- hi('@string.escape',     { link = 'SpecialChar' })
-- hi('@string.special',    { link = 'SpecialChar' })
-- hi('@character',         { link = 'Character' })
-- hi('@character.special', { link = 'SpecialChar' })
-- hi('@number',            { link = 'Number' })
-- hi('@boolean',           { link = 'Boolean' })
-- hi('@number.float',      { link = 'Float' })

-- Functions
hi("@function", { link = "Normal" })
hi("@function.builtin", { link = "Normal" })
hi("@function.macro", { link = "Normal" })
hi("@function.method", { link = "Normal" })
hi("@variable.parameter", { link = "Normal" })
hi("@variable.parameter.builtin", { link = "Normal" })
hi("@variable.member", { link = "Normal" })
hi("@property", { link = "Normal" })
hi("@attribute", { link = "Normal" })
hi("@attribute.builtin", { link = "Normal" })
hi("@constructor", { link = "Normal" })

-- Keywords
-- hi('@keyword.conditional', { link = 'Conditional' })
-- hi('@keyword.repeat',      { link = 'Repeat' })
-- hi('@keyword.type',        { link = 'Structure' })
-- hi('@label',               { link = 'Label' })
-- hi('@operator',            { link = 'Operator' })
-- hi('@keyword',             { link = 'Keyword' })
-- hi('@keyword.exception',   { link = 'Exception' })

-- hi('@variable',          { link = 'Identifier' })
-- hi('@type',              { link = 'Type' })
-- hi('@type.definition',   { link = 'Typedef' })
-- hi('@module',            { link = 'Identifier' })
-- hi('@keyword.import',    { link = 'Include' })
-- hi('@keyword.directive', { link = 'PreProc' })
-- hi('@keyword.debug',     { link = 'Debug' })
-- hi('@tag',               { link = 'Tag' })
-- hi('@tag.builtin',       { link = 'Special' })

-- LSP semantic tokens
-- hi('@lsp.type.class',         { link = 'Structure' })
-- hi('@lsp.type.comment',       { link = 'Comment' })
-- hi('@lsp.type.decorator',     { link = 'Function' })
-- hi('@lsp.type.enum',          { link = 'Structure' })
-- hi('@lsp.type.enumMember',    { link = 'Constant' })
-- hi('@lsp.type.function',      { link = 'Function' })
-- hi('@lsp.type.interface',     { link = 'Structure' })
-- hi('@lsp.type.macro',         { link = 'Macro' })
-- hi('@lsp.type.method',        { link = 'Function' })
-- hi('@lsp.type.namespace',     { link = 'Structure' })
-- hi('@lsp.type.parameter',     { link = 'Identifier' })
-- hi('@lsp.type.property',      { link = 'Identifier' })
-- hi('@lsp.type.struct',        { link = 'Structure' })
-- hi('@lsp.type.type',          { link = 'Type' })
-- hi('@lsp.type.typeParameter', { link = 'TypeDef' })
-- hi('@lsp.type.variable',      { link = 'Identifier' })

-- if vim.o.background == 'light' then
-- hi('Comment',        { fg = 'gray',        ctermfg = 'gray' })
-- else
-- hi('Comment',        { fg = 'gray',        ctermfg = 'gray' })
-- end

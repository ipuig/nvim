M = {}

M.setup_colors_when_fucked = function(colorscheme, background)
	vim.opt.background = background
	vim.cmd.colorscheme(colorscheme)
	vim.api.nvim_set_hl(0, "CmpItemKind", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindColor", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindFolder", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindKindUnit", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindOperator", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindReference", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindUnit", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindConstant", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindProperty", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindClass", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindParameter", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindEvent", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindStruct", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindFile", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindEnum", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindModule", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindInterface", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindMethod", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindField", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindValue", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindText", { bg = "none" })
	vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "none" })
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "none" })


end

M.setup_colors = function(colorscheme, background)
    vim.opt.background = background
    vim.cmd.colorscheme(colorscheme)
    vim.api.nvim_set_hl(0, "Comment", { fg = "#7E7E7E" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "None" })

    -- neorg
    vim.api.nvim_set_hl(0, "@markup.strong", { bold = true })
    vim.api.nvim_set_hl(0, "@markup.italic", { italic = true })

    vim.api.nvim_set_hl(0, "@markup.strikethrough", { strikethrough = true })
    vim.api.nvim_set_hl(0, "@neorg.markup.strikethrough.norg", { strikethrough = true })
    vim.api.nvim_set_hl(0,"@text.strike", {strikethrough=true})

    vim.api.nvim_set_hl(0, "@markup.underline", { underline = true })
    vim.cmd([[ autocmd FileType norg setlocal conceallevel=2 ]])
end

return M.setup_colors

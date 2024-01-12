print("loading settings")
vim.opt.rnu = true
vim.opt.nu = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard:append ("unnamedplus")

vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30

-- vim.opt.wildignore = {}
-- vim.opt.wildignore:remove { "node_modules" }
vim.opt.wildignore:append { '*.o', '*.class', "node_modules", '__pycache__' }

-- opt.iskeyword:append("-")
-- vim.keymap.set('n', 'lhs', function() print("real lua function") end)

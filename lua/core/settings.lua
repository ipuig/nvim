vim.opt.rnu = true
vim.opt.nu = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.laststatus = 0
vim.opt.wrap = false
vim.opt.smartcase = true

vim.opt.clipboard:append("unnamedplus")
vim.opt.hls = true

vim.opt.wildignore:append({ "*.o", "*.class", "node_modules", "__pycache__" })
vim.opt.path:append("**")
vim.opt.iskeyword:append("-")
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- globals
vim.g.mapleader = " "

-- netrw setup
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30

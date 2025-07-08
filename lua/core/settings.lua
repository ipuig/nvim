vim.opt.rnu = true
vim.opt.nu = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.laststatus = 0
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.mouse = ""

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


-- languages
vim.g.zig_fmt_autosave = 0
-- vim.g.filetype_pl = "prolog"


vim.env.TERM = "tmux-256color"

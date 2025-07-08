vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_browse_split = 0

vim.keymap.set("n", "q", "<cmd>q!<cr>", { silent = true, buffer = true, noremap = true, nowait = true })

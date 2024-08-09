local M = {}

M.setup = function()
    vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", {})
    vim.keymap.set("n", "x", '"_x') -- delete single character without copying into register

    -- Move lines
    vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
    vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

    local toggle_hls = function()
        if vim.opt.hls:get() then
            vim.opt.hls = false
        else
            vim.opt.hls = true
        end
    end

    vim.keymap.set("n", "<leader>sh", toggle_hls)

    -- Stay in visual mode when indenting)
    vim.keymap.set("v", "<", "<gv")
    vim.keymap.set("v", ">", ">gv")

    -- Follow the cursor)
    vim.keymap.set("n", "n", "nzzzv")
    vim.keymap.set("n", "N", "Nzzzv")
    vim.keymap.set("n", "J", "mzJ`z")

    vim.keymap.set("n", "<leader>i", "<cmd>Neorg workspace Notes<cr>")

end

return M.setup

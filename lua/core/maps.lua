local M = {}

M.setup = function()
    vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", {})
    vim.keymap.set("n", "x", '"_x') -- delete single character without copying into register

    -- Move lines
    vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
    vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

    local toggle_spelling = function()
        if vim.opt.spell:get() then
            vim.opt.spell = false
        else
            vim.opt.spell = true
        end
    end

    -- Stay in visual mode when indenting)
    vim.keymap.set("v", "<", "<gv")
    vim.keymap.set("v", ">", ">gv")

    -- Follow the cursor)
    vim.keymap.set("n", "n", "nzzzv")
    vim.keymap.set("n", "N", "Nzzzv")
    vim.keymap.set("n", "J", "mzJ`z")

    vim.keymap.set("n", "<leader>i", "<cmd>Neorg workspace Notes<cr>")
    vim.keymap.set("n", "<c-s>", toggle_spelling)


    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "netrw", "qf" },
        callback = function()
            vim.api.nvim_buf_set_keymap(0, "n", "qq", ":q<CR>", { noremap = true, silent = true })
        end
    })

end

return M.setup

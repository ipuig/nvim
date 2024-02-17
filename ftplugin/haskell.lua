local quick_repl = function()
    if vim.fn.expand("%:e") ~= "hs" then return end
    local command = "tmux list-panes -a -F \"#{pane_id} #{window_name} #{pane_current_command}\" | grep ghc"
    local output = vim.fn.system(command)
    if output == "" then
        local current_file = vim.fn.expand("%:p")
        vim.fn.system("tmux display-popup ghci " .. current_file)
    end
end

local split_down_repl = function()
    if vim.fn.expand("%:e") ~= "hs" then return end
    local command = "tmux list-panes -a -F \"#{pane_id} #{window_name} #{pane_current_command}\" | grep ghc"
    local output = vim.fn.system(command)
    if output == "" then
        local current_file = vim.fn.expand("%:p")
        vim.fn.system("tmux split -c \"{pane_current_path}\" ghci " .. current_file)
    end
end

vim.keymap.set("n", "<leader>ll", quick_repl, {})
vim.keymap.set("n", "<leader>lr", split_down_repl, {})

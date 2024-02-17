local quick_repl = function()
    if vim.fn.expand("%:e") ~= "pl" then return end
    local command = "tmux list-panes -a -F \"#{pane_id} #{window_name} #{pane_current_command}\" | grep swipl"
    local output = vim.fn.system(command)
    if output == "" then
        local current_file = vim.fn.expand("%:p")
        vim.fn.system("tmux display-popup swipl " .. current_file)
    end
end
vim.keymap.set("n", "<leader>ll", quick_repl, {})
